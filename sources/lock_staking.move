module vip::lock_staking {
    use std::bcs::to_bytes;
    use std::error;
    use std::option::{Self, Option};
    use std::signer;
    use std::string::{Self, String};
    use std::vector;

    use initia_std::address::to_sdk;
    use initia_std::block;
    use initia_std::coin;
    use initia_std::cosmos::{stargate, stargate_vote, move_execute};
    use initia_std::bigdecimal::{Self, BigDecimal};
    use initia_std::fungible_asset::{Self, FungibleAsset, Metadata};
    use initia_std::json::{marshal, unmarshal};
    use initia_std::object::{Self, ExtendRef, Object};
    use initia_std::simple_map::{Self, SimpleMap};
    use initia_std::staking;
    use initia_std::table::{Self, Table};
    use initia_std::table_key;
    use initia_std::type_info;
    use initia_std::query::query_stargate;

    use vip::utils;

    friend vip::vip;

    const EUNAUTHORIZED: u64 = 1;
    const EDELEGATION_NOT_FOUND: u64 = 2;
    // length of redelegation_responses must be 1
    const EREDELEGATION_LENGTH: u64 = 3;
    const ECREATION_HEIGHT_MISMATCH: u64 = 4;
    const ENOT_SINGLE_COIN: u64 = 5;
    const EDENOM_MISMATCH: u64 = 6;
    const ENOT_ENOUGH_BALANCE: u64 = 7;
    const ESMALL_RELEASE_TIME: u64 = 8;
    const ENOT_RELEASE: u64 = 9;
    const ESAME_HEIGHT: u64 = 10;
    const ENOT_ENOUGH_DELEGATION: u64 = 11;
    const EMAX_LOCK_PERIOD: u64 = 12;
    const EMAX_SLOT: u64 = 13;
    const EZERO_AMOUNT: u64 = 14;
    const EINVALID_MIN_MAX: u64 = 15;

    struct LockedDelegationResponse has drop {
        metadata: Object<Metadata>,
        validator: String,
        locked_share: BigDecimal,
        amount: u64,
        release_time: u64,
    }

    struct StakingAccount has key {
        extend_ref: ExtendRef,
        last_height: u64, // record the last executed height to prevent the stargate sequential problem.
        validators: Table<String, u16>, // validator => number of delegation
        delegations: Table<DelegationKey, BigDecimal>, // key => locked share
        // This share variable is specific to the lock_staking.move module
        // It should not be confused with the share variable in the mstaking module
        total_locked_shares: Table<LockedShareKey, BigDecimal>, // store total locked share
    }

    struct DelegationKey has copy, drop {
        metadata: Object<Metadata>,
        release_time: vector<u8>, // use table encoded key for ordering
        validator: String,
    }

    struct LockedShareKey has copy, drop {
        metadata: Object<Metadata>,
        validator: String,
    }

    struct ModuleStore has key {
        min_lock_period: u64,
        max_lock_period: u64,
        max_delegation_slot: u64,
    }

    // init module
    fun init_module(vip: &signer) {
        move_to(
            vip,
            ModuleStore {
                min_lock_period: 0,
                max_lock_period: 126230400u64, // 60 * 60 * 24 * 365.25 * 4 (4 years)
                max_delegation_slot: 18_446_744_073_709_551_615u64 // u64 max at first
            },
        )
    }

    // entry functions

    public entry fun update_params(
        chain: &signer,
        min_lock_period: Option<u64>,
        max_lock_period: Option<u64>,
        max_delegation_slot: Option<u64>
    ) acquires ModuleStore {
        utils::check_chain_permission(chain);
        let module_store = borrow_global_mut<ModuleStore>(@vip);

        if (option::is_some(&min_lock_period)) {
            module_store.min_lock_period = option::extract(&mut min_lock_period);
        };

        if (option::is_some(&max_lock_period)) {
            module_store.max_lock_period = option::extract(&mut max_lock_period);
        };

        if (option::is_some(&max_delegation_slot)) {
            module_store.max_delegation_slot = option::extract(&mut max_delegation_slot);
        };

        assert!(
            module_store.max_lock_period > module_store.min_lock_period,
            error::invalid_argument(EINVALID_MIN_MAX),
        );
    }

    public entry fun withdraw_delegator_reward(account: &signer) acquires StakingAccount {
        let staking_account_signer = get_staking_account_signer(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let staking_account = borrow_global<StakingAccount>(staking_account_addr);

        let iter =
            table::iter(
                &staking_account.validators,
                option::none(),
                option::none(),
                1,
            );

        loop {
            if (!table::prepare<String, u16>(iter)) { break };
            let (validator, _) = table::next<String, u16>(iter);
            // execute withdraw delegator reward for each validator
            let msg = MsgWithdrawDelegatorReward {
                _type_: string::utf8(
                    b"/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
                ),
                delegator_address: to_sdk(staking_account_addr),
                validator_address: validator,
            };
            stargate(
                &staking_account_signer,
                marshal(&msg),
            )
        };

        // withdraw uinit from staking account
        move_execute(
            &staking_account_signer,
            @vip,
            string::utf8(b"lock_staking"),
            string::utf8(b"withdraw_asset_for_staking_account"),
            vector[],
            vector[
                to_bytes(&coin::metadata(@initia_std, string::utf8(b"uinit"))),
                to_bytes(&option::none<u64>())],
        )
    }

    public entry fun vote_gov_proposal(
        account: &signer, proposal_id: u64, option: u64, metadata: String
    ) acquires StakingAccount {
        let addr = signer::address_of(account);
        if (!is_registered(addr)) { return };

        let staking_account_signer = get_staking_account_signer(account);
        stargate_vote(
            &staking_account_signer,
            proposal_id,
            to_sdk(addr),
            option,
            metadata,
        );
    }

    public entry fun withdraw_asset(
        account: &signer,
        metadata: Object<Metadata>,
        amount: Option<u64>,
    ) acquires StakingAccount {
        let staking_account_signer = get_staking_account_signer(account);
        withdraw_asset_for_staking_account(
            &staking_account_signer,
            metadata,
            amount,
        );
    }

    public entry fun withdraw_asset_for_staking_account(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        amount: Option<u64>,
    ) {
        let staking_account_addr = signer::address_of(staking_account_signer);
        assert_staking_account(staking_account_addr);
        let object = object::address_to_object<StakingAccount>(staking_account_addr);
        let owner = object::owner(object);

        let balance = coin::balance(staking_account_addr, metadata);

        let withdraw_amount =
            if (option::is_none(&amount)) {
                balance
            } else {
                let withdraw_amount = *option::borrow(&amount);
                assert!(withdraw_amount > 0, error::invalid_argument(EZERO_AMOUNT));
                assert!(
                    withdraw_amount <= balance,
                    error::invalid_argument(ENOT_ENOUGH_BALANCE),
                );
                withdraw_amount
            };

        if (withdraw_amount == 0) { return };

        coin::transfer(
            staking_account_signer,
            owner,
            metadata,
            withdraw_amount,
        );
    }

    public entry fun delegate(
        account: &signer,
        metadata: Object<Metadata>,
        amount: u64,
        release_time: u64,
        validator_address: String
    ) acquires StakingAccount, ModuleStore {
        // TODO: disable this
        let fa = coin::withdraw(account, metadata, amount);
        delegate_internal(
            account,
            fa,
            release_time,
            validator_address,
        );
    }

    public entry fun redelegate(
        account: &signer,
        metadata: Object<Metadata>,
        amount: Option<u64>, // if none, redelegate all
        src_release_time: u64,
        validator_src_address: String,
        dst_release_time: u64,
        validator_dst_address: String,
    ) acquires StakingAccount {
        let staking_account_signer = get_staking_account_signer(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let staking_account = borrow_global_mut<StakingAccount>(staking_account_addr);

        assert_height(staking_account);
        assert!(
            dst_release_time >= src_release_time,
            error::invalid_argument(ESMALL_RELEASE_TIME),
        );
        // get current delegation share
        let delegation =
            get_delegation(
                staking_account,
                validator_src_address,
                staking_account_addr,
                false,
            );
        let locked_share =
            get_locked_share(
                staking_account,
                metadata,
                src_release_time,
                validator_src_address,
            );
        let share_before =
            get_share(
                &delegation.delegation.shares,
                coin::metadata_to_denom(metadata),
                true,
            );
        let locked_amount =
            locked_share_to_amount(
                staking_account,
                validator_src_address,
                metadata,
                &share_before,
                &locked_share,
            );

        // get redelegate amount and share before
        let (amount, share_before) =
            if (option::is_none(&amount)) {
                // redelegate all
                (locked_amount, option::none())
            } else {
                let redelegate_amount = option::extract(&mut amount);
                assert!(redelegate_amount > 0, error::invalid_argument(EZERO_AMOUNT));
                assert!(
                    locked_amount >= redelegate_amount,
                    error::invalid_argument(ENOT_ENOUGH_DELEGATION),
                );

                (redelegate_amount, option::some(share_before))
            };

        // execute begin redelegate
        let coin = create_coin(metadata, amount);
        let msg = MsgBeginRedelegate {
            _type_: string::utf8(b"/initia.mstaking.v1.MsgBeginRedelegate"),
            delegator_address: to_sdk(staking_account_addr),
            validator_src_address,
            validator_dst_address,
            amount: vector[coin]
        };

        stargate(&staking_account_signer, marshal(&msg));

        // execute redelegate hook
        move_execute(
            &staking_account_signer,
            @vip,
            string::utf8(b"lock_staking"),
            string::utf8(b"redelegate_hook"),
            vector[],
            vector[
                to_bytes(&metadata),
                to_bytes(&src_release_time),
                to_bytes(&validator_src_address),
                to_bytes(&dst_release_time),
                to_bytes(&validator_dst_address),
                to_bytes(&share_before),],
        )
    }

    public entry fun undelegate(
        account: &signer,
        metadata: Object<Metadata>,
        amount: Option<u64>, // if none, undelegte all
        release_time: u64,
        validator: String,
    ) acquires StakingAccount {
        let staking_account_signer = get_staking_account_signer(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let staking_account = borrow_global_mut<StakingAccount>(staking_account_addr);

        assert_height(staking_account);

        // check can undelegate
        let (_, curr_time) = block::get_block_info();
        assert!(
            curr_time > release_time,
            error::invalid_state(ENOT_RELEASE),
        );
        // get current delegation share
        let delegation =
            get_delegation(
                staking_account,
                validator,
                staking_account_addr,
                false,
            );
        let locked_share =
            get_locked_share(
                staking_account,
                metadata,
                release_time,
                validator,
            );
        let share_before =
            get_share(
                &delegation.delegation.shares,
                coin::metadata_to_denom(metadata),
                true,
            );

        let locked_amount =
            locked_share_to_amount(
                staking_account,
                validator,
                metadata,
                &share_before,
                &locked_share,
            );

        // get undelegate amount and share before
        let (amount, share_before) =
            if (option::is_none(&amount)) {
                // undelegate all
                (locked_amount, option::none())
            } else {
                let undelegate_amount = option::extract(&mut amount);
                assert!(undelegate_amount > 0, error::invalid_argument(EZERO_AMOUNT));
                assert!(
                    locked_amount >= undelegate_amount,
                    error::invalid_argument(ENOT_ENOUGH_DELEGATION),
                );

                (undelegate_amount, option::some(share_before))
            };

        // execute undelegate
        let coin = create_coin(metadata, amount);
        let msg = MsgUndelegate {
            _type_: string::utf8(b"/initia.mstaking.v1.MsgUndelegate"),
            delegator_address: to_sdk(staking_account_addr),
            validator_address: validator,
            amount: vector[coin]
        };

        stargate(&staking_account_signer, marshal(&msg));

        // execute undelegate hook
        move_execute(
            &staking_account_signer,
            @vip,
            string::utf8(b"lock_staking"),
            string::utf8(b"undelegate_hook"),
            vector[],
            vector[
                to_bytes(&metadata),
                to_bytes(&release_time),
                to_bytes(&validator),
                to_bytes(&share_before),],
        )
    }

    public entry fun extend(
        account: &signer,
        metadata: Object<Metadata>,
        amount: Option<u64>, // if none, extend all
        release_time: u64,
        validator: String,
        new_release_time: u64,
    ) acquires StakingAccount, ModuleStore {
        let staking_account_signer = get_staking_account_signer(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let staking_account = borrow_global_mut<StakingAccount>(staking_account_addr);

        assert_height(staking_account);

        // check release time
        assert!(
            new_release_time > release_time,
            error::invalid_argument(ESMALL_RELEASE_TIME),
        );

        // get locked_share amount to extend
        let locked_share =
            if (option::is_none(&amount)) {
                // extend all
                option::none()
            } else {
                let extend_amount = option::extract(&mut amount);
                assert!(extend_amount > 0, error::invalid_argument(EZERO_AMOUNT));
                // get current delegation share
                let delegation =
                    get_delegation(
                        staking_account,
                        validator,
                        staking_account_addr,
                        false,
                    );
                let total_share =
                    get_share(
                        &delegation.delegation.shares,
                        coin::metadata_to_denom(metadata),
                        true,
                    );
                option::some(
                    amount_to_locked_share(
                        staking_account,
                        validator,
                        metadata,
                        &total_share,
                        extend_amount,
                    ),
                )
            };

        // withdraw/remove delegation
        let withdrawn_locked_share =
            withdraw_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator,
                locked_share,
            );

        // deposit delegation to new release time
        deposit_delegation(
            staking_account_addr,
            metadata,
            validator,
            withdrawn_locked_share,
            new_release_time,
        );
    }

    // stargate msgs
    struct MsgDelegate has drop {
        _type_: String,
        delegator_address: String,
        validator_address: String,
        amount: vector<Coin>,
    }

    struct MsgBeginRedelegate has drop {
        _type_: String,
        delegator_address: String,
        validator_src_address: String,
        validator_dst_address: String,
        amount: vector<Coin>,
    }

    struct MsgUndelegate has drop {
        _type_: String,
        delegator_address: String,
        validator_address: String,
        amount: vector<Coin>,
    }

    struct MsgWithdrawDelegatorReward has drop {
        _type_: String,
        delegator_address: String,
        validator_address: String,
    }

    public(friend) fun delegate_internal(
        account: &signer,
        fa: FungibleAsset,
        release_time: u64,
        validator_address: String
    ) acquires StakingAccount, ModuleStore {
        let (_, curr_time) = block::get_block_info();
        let module_store = borrow_global<ModuleStore>(@vip);
        assert!(
            release_time > curr_time + module_store.min_lock_period,
            error::invalid_argument(ESMALL_RELEASE_TIME),
        );

        let staking_account_signer = get_staking_account_signer(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let staking_account = borrow_global_mut<StakingAccount>(staking_account_addr);

        assert_height(staking_account);
        let metadata = fungible_asset::metadata_from_asset(&fa);
        let amount = fungible_asset::amount(&fa);
        let denom = coin::metadata_to_denom(metadata);
        let coin = Coin { denom, amount };

        // deposit token to staking account addr
        coin::deposit(staking_account_addr, fa);

        // delegate
        let msg = MsgDelegate {
            _type_: string::utf8(b"/initia.mstaking.v1.MsgDelegate"),
            delegator_address: to_sdk(staking_account_addr),
            validator_address,
            amount: vector[coin]
        };
        stargate(&staking_account_signer, marshal(&msg));

        // execute hook
        let delegation =
            get_delegation(
                staking_account,
                validator_address,
                staking_account_addr,
                false,
            );

        let share_before = get_share(&delegation.delegation.shares, denom, false);

        move_execute(
            &staking_account_signer,
            @vip,
            string::utf8(b"lock_staking"),
            string::utf8(b"delegate_hook"),
            vector[],
            vector[
                to_bytes(&metadata),
                to_bytes(&release_time),
                to_bytes(&validator_address),
                to_bytes(&share_before),],
        )
    }

    // hook functions
    entry fun delegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        share_before: BigDecimal,
    ) acquires StakingAccount, ModuleStore {
        let staking_account_addr = signer::address_of(staking_account_signer);
        let staking_account = borrow_global<StakingAccount>(staking_account_addr);
        assert_staking_account(staking_account_addr);

        // calculate share diff
        let denom = coin::metadata_to_denom(metadata);

        let delegation =
            get_delegation(
                staking_account,
                validator,
                staking_account_addr,
                true,
            );

        let share_after = get_share(&delegation.delegation.shares, denom, true);
        let share_diff = bigdecimal::sub(share_after, share_before);
        let new_locked_share =
            share_to_locked_share(
                staking_account,
                validator,
                metadata,
                &share_before,
                &share_diff,
            );

        // store delegation
        deposit_delegation(
            staking_account_addr,
            metadata,
            validator,
            new_locked_share,
            release_time,
        );

        // withdraw uinit from staking account
        withdraw_asset_for_staking_account(
            staking_account_signer,
            coin::metadata(@initia_std, string::utf8(b"uinit")),
            option::none(),
        );
    }

    entry fun redelegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        src_release_time: u64,
        validator_src_address: String,
        dst_release_time: u64,
        validator_dst_address: String,
        src_share_before: Option<BigDecimal>, // if none, redelegate all
    ) acquires StakingAccount, ModuleStore {
        let staking_account_addr = signer::address_of(staking_account_signer);
        let staking_account = borrow_global<StakingAccount>(staking_account_addr);
        assert_staking_account(staking_account_addr);
        let (height, _) = block::get_block_info();
        let denom = coin::metadata_to_denom(metadata);

        // get redelegation
        let redelegations =
            get_redelegations(
                to_sdk(staking_account_addr),
                validator_src_address,
                validator_dst_address,
            );
        assert!(
            vector::length(&redelegations.redelegation_responses) == 1,
            error::internal(EREDELEGATION_LENGTH),
        );
        let redelegation_response = vector::borrow_mut(
            &mut redelegations.redelegation_responses, 0
        );

        // the last entry is the most recent creation
        let RedelegationEntryResponse { redelegation_entry, balance: _ } = vector::pop_back(
            &mut redelegation_response.entries
        );

        // check redelegation to be sure there is no query ordering changes
        assert!(
            (redelegation_entry.creation_height as u64) == height,
            error::internal(ECREATION_HEIGHT_MISMATCH),
        );
        assert!(
            vector::length(&redelegation_entry.shares_dst) == 1,
            error::internal(ENOT_SINGLE_COIN),
        );
        let redelegation_share = vector::borrow(&redelegation_entry.shares_dst, 0);
        assert!(
            redelegation_share.denom == denom,
            error::internal(EDENOM_MISMATCH),
        );

        // withdraw src locked delegation
        let locked_share_to_withdraw =
            if (option::is_none(&src_share_before)) {
                option::none()
            } else {
                // calculate share diff
                let share_before = option::extract(&mut src_share_before);
                let delegation =
                    get_delegation(
                        staking_account,
                        validator_src_address,
                        staking_account_addr,
                        false,
                    );

                // redelegation always decreses the share from the src validator
                let share_after = get_share(&delegation.delegation.shares, denom, false);

                let share_diff = bigdecimal::sub(share_before, share_after);

                let locked_share =
                    share_to_locked_share(
                        staking_account,
                        validator_src_address,
                        metadata,
                        &share_before,
                        &share_diff,
                    );
                option::some(locked_share)
            };

        withdraw_delegation(
            staking_account_addr,
            metadata,
            src_release_time,
            validator_src_address,
            locked_share_to_withdraw,
        );

        // deposit locked delegation
        let staking_account = borrow_global<StakingAccount>(staking_account_addr);
        let delegation =
            get_delegation(
                staking_account,
                validator_dst_address,
                staking_account_addr,
                true,
            );

        // total delegation share after redelegation
        let current_total_share =
            get_share(
                &delegation.delegation.shares,
                redelegation_share.denom,
                true,
            );

        // get total delegation share before redelegation
        let dst_share_before =
            bigdecimal::sub(current_total_share, redelegation_share.amount);

        // get new locked share
        let new_locked_share =
            share_to_locked_share(
                staking_account,
                validator_dst_address,
                metadata,
                &dst_share_before,
                &redelegation_share.amount,
            );

        deposit_delegation(
            staking_account_addr,
            metadata,
            validator_dst_address,
            new_locked_share,
            dst_release_time,
        );

        // withdraw uinit from staking account
        withdraw_asset_for_staking_account(
            staking_account_signer,
            coin::metadata(@initia_std, string::utf8(b"uinit")),
            option::none(),
        );
    }

    entry fun undelegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        share_before: Option<BigDecimal>, // if none, undelegate all
    ) acquires StakingAccount {
        let staking_account_addr = signer::address_of(staking_account_signer);
        let staking_account = borrow_global<StakingAccount>(staking_account_addr);
        assert_staking_account(staking_account_addr);

        let (height, _) = block::get_block_info();
        let denom = coin::metadata_to_denom(metadata);

        // get undelegation
        let UnbondingDelegationResponse { unbond } =
            get_unbonding_delegation(staking_account_addr, validator);

        // the last entry is the most recent creation
        let unbond_entry = vector::pop_back(&mut unbond.entries);

        // check redelegation to check query ordering changed
        assert!(
            unbond_entry.creation_height == height,
            error::internal(ECREATION_HEIGHT_MISMATCH),
        );
        assert!(
            vector::length(&unbond_entry.initial_balance) == 1,
            error::internal(ENOT_SINGLE_COIN),
        );
        let initial_balance = vector::borrow(&unbond_entry.initial_balance, 0);
        assert!(
            initial_balance.denom == denom,
            error::internal(EDENOM_MISMATCH),
        );

        // withdraw delegation
        let locked_share_to_withdraw =
            if (option::is_none(&share_before)) {
                option::none()
            } else {
                // calculate share diff
                let share_before = option::extract(&mut share_before);
                let delegation =
                    get_delegation(
                        staking_account,
                        validator,
                        staking_account_addr,
                        false,
                    );

                let share_after = get_share(&delegation.delegation.shares, denom, false);

                let share_diff = bigdecimal::sub(share_before, share_after);

                let locked_share =
                    share_to_locked_share(
                        staking_account,
                        validator,
                        metadata,
                        &share_before,
                        &share_diff,
                    );
                option::some(locked_share)
            };

        withdraw_delegation(
            staking_account_addr,
            metadata,
            release_time,
            validator,
            locked_share_to_withdraw,
        );

        // withdraw uinit from staking account
        withdraw_asset_for_staking_account(
            staking_account_signer,
            coin::metadata(@initia_std, string::utf8(b"uinit")),
            option::none(),
        );
    }

    // stargate queries
    struct DelegationRequest has copy, drop {
        validator_addr: String,
        delegator_addr: String,
    }

    struct DelegationResponse has drop, copy, store {
        delegation_response: DelegationResponseInner
    }

    struct DelegationResponseInner has drop, copy, store {
        delegation: Delegation,
        balance: vector<Coin>
    }

    struct UnbondingDelegationRequest has copy, drop {
        delegator_addr: String,
        validator_addr: String,
    }

    struct UnbondingDelegationResponse has drop, copy, store {
        unbond: UnbondingDelegation,
    }

    // only allow single redelegation query
    struct RedelegationsRequest has copy, drop {
        delegator_addr: String,
        src_validator_addr: String,
        dst_validator_addr: String,
    }

    struct RedelegationsResponse has drop, copy, store {
        redelegation_responses: vector<RedelegationResponse>, // Always contains exactly one item, as only single redelegation queries are allowed
        pagination: Option<PageResponse>, // Always None, as only single redelegation queries are allowed
    }

    fun get_delegation(
        staking_account: &StakingAccount,
        validator_addr: String,
        delegator_addr: address,
        must_exist: bool,
    ): DelegationResponseInner {
        let delegator_addr = to_sdk(delegator_addr);
        if (!table::contains(
                &staking_account.validators,
                validator_addr,
            ) && !must_exist) {
            return DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: delegator_addr,
                    validator_address: validator_addr,
                    shares: vector[],
                },
                balance: vector[],
            }
        };
        let path = b"/initia.mstaking.v1.Query/Delegation";
        let request = DelegationRequest { validator_addr, delegator_addr };
        query<DelegationRequest, DelegationResponse>(path, request).delegation_response
    }

    fun get_unbonding_delegation(
        delegator_addr: address, validator_addr: String
    ): UnbondingDelegationResponse {
        let path = b"/initia.mstaking.v1.Query/UnbondingDelegation";
        let request = UnbondingDelegationRequest {
            validator_addr,
            delegator_addr: to_sdk(delegator_addr)
        };
        query<UnbondingDelegationRequest, UnbondingDelegationResponse>(path, request)
    }

    fun get_redelegations(
        delegator_addr: String, src_validator_addr: String, dst_validator_addr: String
    ): RedelegationsResponse {
        let path = b"/initia.mstaking.v1.Query/Redelegations";
        let request = RedelegationsRequest {
            delegator_addr,
            src_validator_addr,
            dst_validator_addr
        };
        query<RedelegationsRequest, RedelegationsResponse>(path, request)
    }

    fun query<Request: drop, Response: drop>(
        path: vector<u8>, data: Request
    ): Response {
        let response = query_stargate(path, marshal(&data));
        unmarshal<Response>(response)
    }

    // common cosmos types
    struct Delegation has drop, copy, store {
        delegator_address: String,
        validator_address: String,
        shares: vector<DecCoin>
    }

    struct Coin has drop, copy, store {
        denom: String,
        amount: u64,
    }

    struct DecCoin has drop, copy, store {
        denom: String,
        amount: BigDecimal,
    }

    struct UnbondingDelegation has drop, copy, store {
        delegator_address: String,
        validator_address: String,
        entries: vector<UnbondingDelegationEntry>
    }

    struct UnbondingDelegationEntry has drop, copy, store {
        creation_height: u64,
        completion_time: String,
        initial_balance: vector<Coin>,
        balance: vector<Coin>,
        unbonding_id: u64,
        unbonding_on_hold_ref_count: u64,
    }

    struct RedelegationResponse has drop, copy, store {
        redelegation: Redelegation,
        entries: vector<RedelegationEntryResponse>,
    }

    struct Redelegation has drop, copy, store {
        delegator_address: String,
        validator_src_address: String,
        validator_dst_address: String,
        entries: Option<vector<RedelegationEntry>>, // Always None for query response
    }

    struct RedelegationEntry has drop, copy, store {
        creation_height: u32,
        completion_time: String,
        initial_balance: vector<Coin>,
        shares_dst: vector<DecCoin>,
        unbonding_id: u32,
    }

    struct RedelegationEntryResponse has drop, copy, store {
        redelegation_entry: RedelegationEntry,
        balance: vector<Coin>,
    }

    struct PageResponse has drop, copy, store {
        next_key: String, // hex string
        total: u64,
    }

    // util functions
    public fun is_registered(addr: address): bool {
        let staking_account_addr = get_staking_address(addr);
        exists<StakingAccount>(staking_account_addr)
    }

    public fun unpack_locked_delegation(
        locked_delegation: &LockedDelegationResponse
    ): (Object<Metadata>, String, u64, u64) {
        (
            locked_delegation.metadata,
            locked_delegation.validator,
            locked_delegation.amount,
            locked_delegation.release_time,
        )
    }

    fun get_staking_account_signer(account: &signer): signer acquires StakingAccount {
        let addr = signer::address_of(account);
        if (!is_registered(addr)) {
            let constructor_ref =
                object::create_named_object(
                    account,
                    generate_staking_account_seed(addr),
                );
            let extend_ref = object::generate_extend_ref(&constructor_ref);
            let transfer_ref = object::generate_transfer_ref(&constructor_ref);
            let staking_account_signer = object::generate_signer(&constructor_ref);
            move_to(
                &staking_account_signer,
                StakingAccount {
                    extend_ref,
                    last_height: 0,
                    validators: table::new(),
                    delegations: table::new(),
                    total_locked_shares: table::new(),
                },
            );
            object::disable_ungated_transfer(&transfer_ref);
        };

        let staking_account = borrow_global<StakingAccount>(get_staking_address(addr));
        object::generate_signer_for_extending(&staking_account.extend_ref)
    }

    fun generate_staking_account_seed(addr: address): vector<u8> {
        let type_name = type_info::type_name<StakingAccount>();
        let seed = *string::bytes(&type_name);
        vector::append(&mut seed, to_bytes(&addr));
        seed
    }

    fun create_coin(metadata: Object<Metadata>, amount: u64): Coin {
        let denom = coin::metadata_to_denom(metadata);
        Coin { denom, amount }
    }

    fun assert_staking_account(staking_account_addr: address) {
        assert!(
            exists<StakingAccount>(staking_account_addr),
            error::permission_denied(EUNAUTHORIZED),
        )
    }

    fun compare_denom(dec_coin: &DecCoin, denom: String): bool {
        dec_coin.denom == denom
    }

    fun generate_delegation_key(
        metadata: Object<Metadata>, release_time: u64, validator: String
    ): DelegationKey {
        DelegationKey {
            metadata,
            release_time: table_key::encode_u64(release_time),
            validator,
        }
    }

    fun assert_height(staking_account: &mut StakingAccount) {
        let (height, _) = block::get_block_info();
        assert!(staking_account.last_height != height, error::invalid_state(ESAME_HEIGHT));
        staking_account.last_height = height;
    }

    fun withdraw_delegation(
        addr: address,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        locked_share: Option<BigDecimal>, // if none, withdraw all
    ): BigDecimal acquires StakingAccount {
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
        let locked_share_stored = table::borrow_mut(&mut staking_account.delegations, key);
        let locked_share =
            if (option::is_some(&locked_share)) {
                option::extract(&mut locked_share)
            } else {
                *locked_share_stored
            };

        assert!(
            bigdecimal::ge(*locked_share_stored, locked_share),
            error::invalid_argument(ENOT_ENOUGH_DELEGATION),
        );

        // update total locked share
        let total_locked_share =
            table::borrow_mut(
                &mut staking_account.total_locked_shares,
                LockedShareKey { metadata, validator },
            );
        *total_locked_share = bigdecimal::sub(*total_locked_share, locked_share);

        if (bigdecimal::is_zero(*total_locked_share)) {
            table::remove(
                &mut staking_account.total_locked_shares,
                LockedShareKey { metadata, validator },
            );
        };

        // update locked delegation
        if (bigdecimal::eq(*locked_share_stored, locked_share)) {
            table::remove(&mut staking_account.delegations, key);
            let count = table::borrow_mut(&mut staking_account.validators, validator);
            *count = *count - 1;
            if (count == &0) {
                table::remove(
                    &mut staking_account.validators,
                    validator,
                );
            };
        } else {
            *locked_share_stored = bigdecimal::sub(*locked_share_stored, locked_share);
        };
        locked_share
    }

    fun deposit_delegation(
        addr: address,
        metadata: Object<Metadata>,
        validator: String,
        locked_share: BigDecimal,
        release_time: u64,
    ) acquires StakingAccount, ModuleStore {
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let module_store = borrow_global<ModuleStore>(@vip);
        let key = generate_delegation_key(metadata, release_time, validator);

        let (_, curr_time) = block::get_block_info();
        assert!(
            release_time <= curr_time + module_store.max_lock_period,
            error::invalid_argument(EMAX_LOCK_PERIOD),
        );

        // update total locked share
        let total_locked_share =
            table::borrow_mut_with_default(
                &mut staking_account.total_locked_shares,
                LockedShareKey { metadata, validator },
                bigdecimal::zero(),
            );
        *total_locked_share = bigdecimal::add(*total_locked_share, locked_share);
        // update locked delegation
        if (!table::contains(&staking_account.delegations, key)) {
            let count =
                table::borrow_mut_with_default(
                    &mut staking_account.validators,
                    validator,
                    0,
                );
            *count = *count + 1;
            table::add(
                &mut staking_account.delegations,
                key,
                bigdecimal::zero(), // locked share
            )
        };

        let locked_share_stored = table::borrow_mut(&mut staking_account.delegations, key);
        *locked_share_stored = bigdecimal::add(*locked_share_stored, locked_share);

        assert!(
            table::length(&staking_account.delegations) <= module_store.max_delegation_slot,
            error::invalid_state(EMAX_SLOT),
        );
    }

    fun get_share(
        shares: &vector<DecCoin>, denom: String, must_exist: bool
    ): BigDecimal {
        let (found, idx) = vector::find<DecCoin>(
            shares,
            |share| { compare_denom(share, denom) },
        );

        assert!(!must_exist || found, error::not_found(EDELEGATION_NOT_FOUND));

        if (found) {
            vector::borrow(shares, idx).amount
        } else {
            bigdecimal::zero()
        }
    }

    fun locked_share_to_share(
        staking_account: &StakingAccount,
        validator: String,
        metadata: Object<Metadata>,
        total_share: &BigDecimal,
        locked_share: &BigDecimal
    ): BigDecimal {
        let total_locked_share =
            table::borrow_with_default(
                &staking_account.total_locked_shares,
                LockedShareKey { metadata, validator },
                &bigdecimal::zero(),
            );
        if (bigdecimal::is_zero(*total_share) || bigdecimal::is_zero(*total_locked_share)) {
            return *locked_share
        };

        // locked_share * total_share / total_locekd_share
        bigdecimal::div(bigdecimal::mul(*locked_share, *total_share), *total_locked_share)
    }

    fun share_to_locked_share(
        staking_account: &StakingAccount,
        validator: String,
        metadata: Object<Metadata>,
        total_share: &BigDecimal,
        share: &BigDecimal
    ): BigDecimal {
        let total_locked_share =
            table::borrow_with_default(
                &staking_account.total_locked_shares,
                LockedShareKey { metadata, validator },
                &bigdecimal::zero(),
            );
        if (bigdecimal::is_zero(*total_locked_share) || bigdecimal::is_zero(*total_share)) {
            return *share
        };

        // share * total_locekd_share / total_share
        bigdecimal::div(bigdecimal::mul(*share, *total_locked_share), *total_share)
    }

    fun locked_share_to_amount(
        staking_account: &StakingAccount,
        validator: String,
        metadata: Object<Metadata>,
        total_share: &BigDecimal,
        locked_share: &BigDecimal
    ): u64 {
        let share =
            locked_share_to_share(
                staking_account,
                validator,
                metadata,
                total_share,
                locked_share,
            );
        staking::share_to_amount(*string::bytes(&validator), &metadata, &share)
    }

    fun amount_to_locked_share(
        staking_account: &StakingAccount,
        validator: String,
        metadata: Object<Metadata>,
        total_share: &BigDecimal,
        amount: u64
    ): BigDecimal {
        let share = staking::amount_to_share(
            *string::bytes(&validator), &metadata, amount
        );
        share_to_locked_share(
            staking_account,
            validator,
            metadata,
            total_share,
            &share,
        )
    }

    fun get_locked_share(
        staking_account: &StakingAccount,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String
    ): BigDecimal {
        let key = generate_delegation_key(metadata, release_time, validator);
        assert!(
            table::contains(&staking_account.delegations, key),
            error::not_found(EDELEGATION_NOT_FOUND),
        );
        *table::borrow(&staking_account.delegations, key)
    }

    #[view]
    public fun get_staking_address(addr: address): address {
        object::create_object_address(
            &addr,
            generate_staking_account_seed(copy addr),
        )
    }

    #[view]
    public fun get_locked_delegations(addr: address): vector<LockedDelegationResponse> acquires StakingAccount {
        let staking_account_addr = get_staking_address(addr);
        if (!exists<StakingAccount>(staking_account_addr)) {
            return vector[]
        };
        let staking_account = borrow_global<StakingAccount>(staking_account_addr);
        let iter =
            table::iter(
                &staking_account.delegations,
                option::none(),
                option::none(),
                1,
            );

        let res = vector[];

        let delegations: SimpleMap<String, DelegationResponseInner> =
            simple_map::create();

        loop {
            if (!table::prepare<DelegationKey, BigDecimal>(iter)) { break };
            let (key, locked_share_ref) = table::next<DelegationKey, BigDecimal>(iter);
            let metadata = key.metadata;
            let validator = key.validator;

            if (!simple_map::contains_key(&delegations, &validator)) {
                let delegation =
                    get_delegation(
                        staking_account,
                        validator,
                        staking_account_addr,
                        false,
                    );
                simple_map::add(&mut delegations, validator, delegation);
            };
            let delegation = simple_map::borrow(&delegations, &validator);
            let total_share =
                get_share(
                    &delegation.delegation.shares,
                    coin::metadata_to_denom(metadata),
                    true,
                );
            let amount =
                locked_share_to_amount(
                    staking_account,
                    validator,
                    metadata,
                    &total_share,
                    locked_share_ref,
                );
            let release_time = table_key::decode_u64(key.release_time);

            vector::push_back(
                &mut res,
                LockedDelegationResponse {
                    metadata,
                    validator,
                    locked_share: *locked_share_ref,
                    amount,
                    release_time,
                },
            );
        };

        res
    }

    #[test_only]
    public fun init_module_for_test(chain: &signer) {
        assert!(signer::address_of(chain) == @vip, 1);
        init_module(chain);

    }

    // #[test_only]
    // public fun set_delegation(
    //     metadata: Object<Metadata>, release_time: u64, validator: String, locked_share
    // )
}
