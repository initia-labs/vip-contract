#[test_only]
module vip::mock_lock_staking {
    use std::bcs::to_bytes;
    use std::error;
    use std::option::{Self, Option};
    use std::signer;
    use std::string::{Self, String};
    use std::vector;

    use initia_std::address::to_sdk;
    use initia_std::block;
    use initia_std::coin;
    use initia_std::decimal128::{Self, Decimal128};
    use initia_std::fungible_asset::{Self, FungibleAsset, Metadata};
    use initia_std::json::{marshal, unmarshal};
    use initia_std::object::{Self, ExtendRef, Object};
    use initia_std::staking;
    use initia_std::table::{Self, Table};
    use initia_std::table_key;
    use initia_std::type_info;
    use initia_std::query::query_stargate;

    use initia_std::mock_mstaking;
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
    const ESMALL_RLEASE_TIME: u64 = 8;
    const ENOT_RELEASE: u64 = 9;
    const ESAME_HEIGHT: u64 = 10;
    const ENOT_ENOUGH_DELEGATION: u64 = 11;
    const EMAX_LOCK_PERIOD: u64 = 12;
    const EMAX_SLOT: u64 = 13;
    const EZERO_AMOUNT: u64 = 14;

    struct LockedDelegation has store {
        metadata: Object<Metadata>,
        validator: String,
        share: Decimal128,
    }

    struct LockedDelegationResponse has drop {
        metadata: Object<Metadata>,
        validator: String,
        amount: u64,
        release_time: u64,
    }

    struct StakingAccount has key {
        extend_ref: ExtendRef,
        last_height: u64, // record the last executed height to prevent the stargate sequential problem.
        validators: Table<String, u16>, // validator => number of delegation
        delegations: Table<DelegationKey, LockedDelegation>,
    }

    struct DelegationKey has copy, drop {
        metadata: Object<Metadata>,
        release_time: vector<u8>, // use table encoded key for ordering
        validator: String,
    }

    struct ModuleStore has key {
        max_lock_period: u64,
        max_delegation_slot: u64,
    }

    // init module
    fun init_module(vip: &signer) {
        move_to(
            vip,
            ModuleStore {
                max_lock_period: 126230400u64, // 60 * 60 * 24 * 365.25 * 4 (4 years)
                max_delegation_slot: 18_446_744_073_709_551_615u64 // u64 max at first
            },
        )
    }

    // entry functions

    public entry fun update_params(
        chain: &signer, max_lock_period: Option<u64>, max_delegation_slot: Option<u64>
    ) acquires ModuleStore {
        utils::check_chain_permission(chain);
        let module_store = borrow_global_mut<ModuleStore>(@vip);

        if (option::is_some(&max_lock_period)) {
            module_store.max_lock_period = option::extract(&mut max_lock_period);
        };

        if (option::is_some(&max_delegation_slot)) {
            module_store.max_delegation_slot = option::extract(&mut max_delegation_slot);
        };
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
            mock_mstaking::withdraw_delegations_reward(account, validator);
            
        };

        // withdraw uinit from staking account
        withdraw_asset_for_staking_account(
            &staking_account_signer,
            coin::metadata(@initia_std, string::utf8(b"uinit")),
            option::none<u64>()
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

    fun withdraw_asset_for_staking_account(
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

    public fun delegate(
        account: &signer,
        metadata: Object<Metadata>,
        amount: u64,
        release_time: u64,
        validator_address: String
    ) acquires StakingAccount, ModuleStore{
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
    ) acquires StakingAccount, ModuleStore {
        let staking_account_signer = get_staking_account_signer(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);

        assert_height(staking_account_addr);
        assert!(
            dst_release_time >= src_release_time,
            error::invalid_argument(ESMALL_RLEASE_TIME),
        );
        let locked_delegation =
            get_locked_delegation(
                staking_account_addr,
                metadata,
                src_release_time,
                validator_src_address,
            );
        let share = floor(&locked_delegation.share);
        let locked_amount =
            staking::share_to_amount(
                *string::bytes(&locked_delegation.validator),
                &metadata,
                share,
            );


        // get redelegate amount and share before
        let (amount, share_before) =
            if (option::is_none(&amount)) {
                // redelegate all
                (locked_amount, option::none())
            } else {
                let redelegate_amount = option::extract(&mut amount);
                assert!(redelegate_amount > 0, error::invalid_argument(EZERO_AMOUNT));
                assert!(locked_amount >= redelegate_amount, error::invalid_argument(ENOT_ENOUGH_DELEGATION));
                // get current delegation share
                let delegation =
                    get_delegation(
                        validator_src_address,
                        staking_account_addr,
                        false,
                    );

                let share_before = get_share(&delegation.delegation.shares, coin::metadata_to_denom(metadata), true);

                (redelegate_amount, option::some(share_before))
            };

        // execute begin redelegate
        mock_mstaking::redelegate(
            &staking_account_signer,
            validator_src_address,
            validator_dst_address,
            metadata,
            amount
        );

        // execute redelegate hook
        redelegate_hook(
            &staking_account_signer,
            metadata,
            src_release_time,
            validator_src_address,
            dst_release_time,
            validator_dst_address,
            share_before
        );
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
        assert_height(staking_account_addr);

        // check can undelegate
        let (_, curr_time) = block::get_block_info();
        assert!(
            curr_time > release_time,
            error::invalid_state(ENOT_RELEASE),
        );
        let locked_delegation =
            get_locked_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator,
            );
        let share = floor(&locked_delegation.share);
        let locked_amount =
            staking::share_to_amount(
                *string::bytes(&locked_delegation.validator),
                &metadata,
                share,
            );

        // get undelegate amount and share before
        let (amount, share_before) =
            if (option::is_none(&amount)) {
                // undelegate all
                (locked_amount, option::none())
            } else {
                let undelegate_amount = option::extract(&mut amount);
                assert!(undelegate_amount > 0, error::invalid_argument(EZERO_AMOUNT));
                assert!(locked_amount >= undelegate_amount, error::invalid_argument(ENOT_ENOUGH_DELEGATION));
                // get current delegation share
                let delegation = get_delegation(
                    validator,
                    staking_account_addr,
                    false,
                );

                let share_before = get_share(&delegation.delegation.shares, coin::metadata_to_denom(metadata), true);

                (undelegate_amount, option::some(share_before))
            };

        // execute undelegate
        mock_mstaking::undelegate(&staking_account_signer,validator, metadata, amount);

        // execute undelegate hook
        undelegate_hook(
            &staking_account_signer,
            metadata,
            release_time,
            validator,
            share_before
        );
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
        assert_height(staking_account_addr);

        // check release time
        assert!(
            new_release_time > release_time,
            error::invalid_argument(ESMALL_RLEASE_TIME),
        );

        // get share amount the extend
        let share =
            if (option::is_none(&amount)) {
                // extend all
                option::none()
            } else {
                let extend_amount = option::extract(&mut amount);
                assert!(extend_amount > 0, error::invalid_argument(EZERO_AMOUNT));
                let share =
                    staking::amount_to_share(
                        *string::bytes(&validator),
                        &metadata,
                        extend_amount,
                    );
                option::some(decimal128::from_ratio_u64(share, 1))
            };

        // withdraw/remove delegation
        let delegation =
            withdraw_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator,
                share,
            );

        // deposit delegation to new release time
        deposit_delegation(
            staking_account_addr,
            delegation,
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
        assert!(
            release_time > curr_time,
            error::invalid_argument(ESMALL_RLEASE_TIME),
        );

        let staking_account_signer = get_staking_account_signer(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        assert_height(staking_account_addr);
        let metadata = fungible_asset::metadata_from_asset(&fa);
        let amount = fungible_asset::amount(&fa);
        let denom = coin::metadata_to_denom(metadata);

        // deposit token to staking account addr
        coin::deposit(staking_account_addr, fa);

        // delegate
        mock_mstaking::delegate(&staking_account_signer, validator_address, metadata, amount);

        // execute hook
        let delegation = get_delegation(
            validator_address,
            staking_account_addr,
            false,
        );
        let share_before = get_share(&delegation.delegation.shares, denom, false);
        delegate_hook(&staking_account_signer, metadata,release_time, validator_address, share_before);
    }

    // hook functions
    fun delegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        share_before: Decimal128,
    ) acquires StakingAccount, ModuleStore {
        let staking_account_addr = signer::address_of(staking_account_signer);
        assert_staking_account(staking_account_addr);

        // calculate share diff
        let denom = coin::metadata_to_denom(metadata);

        let delegation = get_delegation(
            validator,
            staking_account_addr,
            true,
        );

        let share_after = get_share(&delegation.delegation.shares, denom, true);
        let share =
            decimal128::new(
                decimal128::val(&share_after) - decimal128::val(&share_before)
            );

        // store delegation
        let locked_delegation = LockedDelegation { metadata, validator, share };

        deposit_delegation(
            staking_account_addr,
            locked_delegation,
            release_time,
        );

        // withdraw uinit from staking account
        withdraw_asset_for_staking_account(
            staking_account_signer,
            coin::metadata(@initia_std, string::utf8(b"uinit")),
            option::none(),
        );
    }

    fun redelegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        src_release_time: u64,
        validator_src_address: String,
        dst_release_time: u64,
        validator_dst_address: String,
        share_before: Option<Decimal128>, // if none, redelegate all
    ) acquires StakingAccount, ModuleStore {
        let staking_account_addr = signer::address_of(staking_account_signer);
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

        // check redelegation for prevent query ordering changed
        assert!(
            (redelegation_entry.creation_height as u64) == height,
            error::internal(ECREATION_HEIGHT_MISMATCH),
        );
        assert!(
            vector::length(&redelegation_entry.shares_dst) == 1,
            error::internal(ENOT_SINGLE_COIN),
        );
        let share = vector::borrow(&redelegation_entry.shares_dst, 0);
        assert!(
            share.denom == denom,
            error::internal(EDENOM_MISMATCH),
        );

        // withdraw src delegation
        let share_to_withdraw =
            if (option::is_none(&share_before)) {
                option::none()
            } else {
                // calculate share diff
                let share_before = option::extract(&mut share_before);
                let delegation =
                    get_delegation(
                        validator_src_address,
                        staking_account_addr,
                        false,
                    );

                let share_after = get_share(&delegation.delegation.shares, denom, false);

                let share_diff =
                    decimal128::new(
                        decimal128::val(&share_before) - decimal128::val(&share_after)
                    );

                option::some(share_diff)
            };

        let LockedDelegation { metadata: _, validator: _, share: _ } =
            withdraw_delegation(
                staking_account_addr,
                metadata,
                src_release_time,
                validator_src_address,
                share_to_withdraw,
            );

        // deposit delegation
        let delegation = LockedDelegation {
            metadata,
            validator: validator_dst_address,
            share: share.amount,
        };

        deposit_delegation(
            staking_account_addr,
            delegation,
            dst_release_time,
        );

        // withdraw uinit from staking account
        withdraw_asset_for_staking_account(
            staking_account_signer,
            coin::metadata(@initia_std, string::utf8(b"uinit")),
            option::none(),
        );
    }

    public entry fun undelegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        share_before: Option<Decimal128>, // if none, undelegate all
    ) acquires StakingAccount {
        let staking_account_addr = signer::address_of(staking_account_signer);
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
        let share_to_withdraw =
            if (option::is_none(&share_before)) {
                option::none()
            } else {
                // calculate share diff
                let share_before = option::extract(&mut share_before);
                let delegation = get_delegation(
                    validator,
                    staking_account_addr,
                    false,
                );

                let share_after = get_share(&delegation.delegation.shares, denom, false);

                let share_diff =
                    decimal128::new(
                        decimal128::val(&share_before) - decimal128::val(&share_after)
                    );

                option::some(share_diff)
            };

        let LockedDelegation { metadata: _, validator: _, share: _ } =
            withdraw_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator,
                share_to_withdraw,
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
        validator_addr: String,
        delegator_addr: address,
        must_exists: bool,
    ): DelegationResponseInner acquires StakingAccount {
        let staking_account = borrow_global<StakingAccount>(delegator_addr);
        let delegator_addr = to_sdk(delegator_addr);
        if (!table::contains(
                &staking_account.validators,
                validator_addr,
            ) && !must_exists) {
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
        amount: Decimal128,
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

    fun assert_height(staking_account_addr: address) acquires StakingAccount {
        let staking_account = borrow_global_mut<StakingAccount>(staking_account_addr);
        let (height, _) = block::get_block_info();
        assert!(staking_account.last_height != height, error::invalid_state(ESAME_HEIGHT));
        staking_account.last_height = height;
    }

    fun withdraw_delegation(
        addr: address,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        share: Option<Decimal128>, // if none, withdraw all
    ): LockedDelegation acquires StakingAccount {
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
        let delegation = table::borrow_mut(&mut staking_account.delegations, key);
        let share =
            if (option::is_some(&share)) {
                option::extract(&mut share)
            } else {
                delegation.share
            };

        assert!(
            decimal128::val(&delegation.share) >= decimal128::val(&share),
            error::invalid_argument(ENOT_ENOUGH_DELEGATION),
        );
        if (decimal128::val(&delegation.share) == decimal128::val(&share)) {
            let LockedDelegation { metadata: _, validator: _, share: _ } =
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
            delegation.share = decimal128::sub(&delegation.share, &share);
        };
        LockedDelegation { metadata, validator, share }
    }

    fun deposit_delegation(
        addr: address,
        delegation: LockedDelegation,
        release_time: u64,
    ) acquires StakingAccount, ModuleStore {
        let LockedDelegation { metadata, validator, share } = delegation;
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let module_store = borrow_global<ModuleStore>(@vip);
        let key = generate_delegation_key(metadata, release_time, validator);

        let (_, curr_time) = block::get_block_info();
        assert!(
            release_time <= curr_time + module_store.max_lock_period,
            error::invalid_argument(EMAX_LOCK_PERIOD),
        );

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
                LockedDelegation { metadata, validator, share: decimal128::zero() },
            )
        };

        let delegation = table::borrow_mut(&mut staking_account.delegations, key);
        delegation.share = decimal128::add(&delegation.share, &share);

        assert!(
            table::length(&staking_account.delegations) <= module_store.max_delegation_slot,
            error::invalid_state(EMAX_SLOT),
        );
    }

    fun get_share(shares: &vector<DecCoin>, denom: String, must_exists: bool): Decimal128 {
        let (find, found_index) = vector::find<DecCoin>(
            shares,
            |share| { compare_denom(share, denom) },
        );

        assert!(!must_exists || find, error::not_found(EDELEGATION_NOT_FOUND));

        if (find) {
            vector::borrow(shares, found_index).amount
        } else {
            decimal128::zero()
        }
    }

    inline fun get_locked_delegation(
        addr: address,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String
    ): &LockedDelegation acquires StakingAccount {
        let staking_account = borrow_global<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
        assert!(
            table::contains(&staking_account.delegations, key),
            error::not_found(EDELEGATION_NOT_FOUND),
        );
        table::borrow(&staking_account.delegations, key)
    }

    fun floor(val: &Decimal128): u64 {
        (decimal128::val(val) / decimal128::val(&decimal128::one()) as u64)
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

        loop {
            if (!table::prepare<DelegationKey, LockedDelegation>(iter)) { break };
            let (key, delegation) = table::next<DelegationKey, LockedDelegation>(iter);
            let metadata = delegation.metadata;
            let share = floor(&delegation.share);
            let validator = delegation.validator;
            let release_time = table_key::decode_u64(key.release_time);
            let amount =
                staking::share_to_amount(
                    *string::bytes(&delegation.validator),
                    &metadata,
                    share,
                );

            vector::push_back(
                &mut res,
                LockedDelegationResponse { metadata, validator, amount, release_time, },
            );
        };

        res
    }
    
    const TEST_RELEASE_PERIOD: u64 = 1000;
    const DELEGATING_AMOUNT : u64 = 1000;
    public fun initialize(chain: &signer, vip:&signer){
        init_module(vip);
        mock_mstaking::initialize(chain);
    }

    #[test(chain = @initia_std, vip = @vip, delegator1 = @0x19c9b6007d21a996737ea527f46b160b0a057c37, delegator2 = @0x56ccf33c45b99546cd1da172cf6849395bbf8573)]
    fun test_lock_staking_delegate(chain: &signer, vip: &signer, delegator1: &signer, delegator2: &signer) acquires StakingAccount, ModuleStore {
        initialize(chain,vip);
        let (_ , time) = block::get_block_info();
        let release_time = time + TEST_RELEASE_PERIOD;
        let metadata = mock_mstaking::get_lp_metadata();
        let validator = mock_mstaking::get_validator1();
        let val2 = mock_mstaking::get_validator2();
        // mock lp providing
        coin::transfer(chain, signer::address_of(delegator1), metadata, DELEGATING_AMOUNT);
        coin::transfer(
            chain,
            signer::address_of(delegator2),
            metadata,
            2 * DELEGATING_AMOUNT,
        );

        // block increases
        utils::increase_block(1, 2);

        // delegate
        delegate(
            delegator1,
            metadata,
            DELEGATING_AMOUNT,
            release_time,
            validator
        );

        // block increases
        utils::increase_block(1, 2);

        delegate(
            delegator2,
            metadata,
            DELEGATING_AMOUNT,
            release_time,
            validator
        );

        // block increases
        utils::increase_block(1, 2);

        delegate(
            delegator2,
            metadata,
            DELEGATING_AMOUNT,
            release_time,
            val2
        );

        assert!(
            get_locked_delegations(signer::address_of(delegator1)) == vector[LockedDelegationResponse {
                metadata,
                validator,
                amount: DELEGATING_AMOUNT,
                release_time
            }], 1
        );

        assert!(
            get_locked_delegations(signer::address_of(delegator2)) == vector[
                LockedDelegationResponse {
                    metadata,
                    validator,
                    amount: DELEGATING_AMOUNT,
                    release_time
                },
                LockedDelegationResponse {
                    metadata,
                    validator: val2,
                    amount: DELEGATING_AMOUNT,
                    release_time
                }
            ], 2
        );

        // check mstaking share and amount of mstaking
        assert!(
            get_delegation(validator,get_staking_address(signer::address_of(delegator1)),true) == DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: to_sdk(get_staking_address(signer::address_of(delegator1))),
                    validator_address: validator,
                    shares: vector [
                        DecCoin {
                            denom: coin::metadata_to_denom(metadata),
                            amount: decimal128::from_ratio_u64(DELEGATING_AMOUNT, 1)
                        }
                    ]
                },
                balance: vector[
                    Coin {
                        denom: coin::metadata_to_denom(metadata),
                        amount: DELEGATING_AMOUNT
                    }
                ]
            }, 3
        );

        assert!(
            get_delegation(validator,get_staking_address(signer::address_of(delegator2)),true) == DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: to_sdk(get_staking_address(signer::address_of(delegator2))),
                    validator_address: validator,
                    shares: vector [
                        DecCoin {
                            denom: coin::metadata_to_denom(metadata),
                            amount: decimal128::from_ratio_u64(DELEGATING_AMOUNT, 1)
                        }
                    ]
                },
                balance: vector[
                    Coin {
                        denom: coin::metadata_to_denom(metadata),
                        amount: DELEGATING_AMOUNT
                    }
                ]
            }, 4
        ); 

        assert!(
            get_delegation(val2,get_staking_address(signer::address_of(delegator2)),true) == DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: to_sdk(get_staking_address(signer::address_of(delegator2))),
                    validator_address: val2,
                    shares: vector [
                        DecCoin {
                            denom: coin::metadata_to_denom(metadata),
                            amount: decimal128::from_ratio_u64(DELEGATING_AMOUNT, 1)
                        }
                    ]
                },
                balance: vector[
                    Coin {
                        denom: coin::metadata_to_denom(metadata),
                        amount: DELEGATING_AMOUNT
                    }
                ]
            }, 5
        );

    }


    #[test(chain = @initia_std, vip = @vip, delegator1 = @0x19c9b6007d21a996737ea527f46b160b0a057c37)]
    fun test_lock_staking_undelegate(chain: &signer, vip: &signer, delegator1: &signer) acquires StakingAccount, ModuleStore {
        initialize(chain,vip);
        let (_ , time) = block::get_block_info();
        let release_time = time + TEST_RELEASE_PERIOD;
        let metadata = mock_mstaking::get_lp_metadata();
        let validator = mock_mstaking::get_validator1();
        let val2 = mock_mstaking::get_validator2();
        // mock lp providing
        coin::transfer(chain, signer::address_of(delegator1), metadata, 3 * DELEGATING_AMOUNT);

        // block increases
        utils::increase_block(1, 2);

        // delegate
        delegate(
            delegator1,
            metadata,
            2 * DELEGATING_AMOUNT,
            release_time,
            validator
        );

        utils::increase_block(1, 2);

        delegate(
            delegator1,
            metadata,
            DELEGATING_AMOUNT,
            release_time,
            val2
        );
        
        assert!(
            get_locked_delegations(signer::address_of(delegator1)) == vector[
                LockedDelegationResponse {
                    metadata,
                    validator,
                    amount: 2 * DELEGATING_AMOUNT,
                    release_time: TEST_RELEASE_PERIOD
                },
                LockedDelegationResponse {
                    metadata,
                    validator : val2,
                    amount: DELEGATING_AMOUNT,
                    release_time: TEST_RELEASE_PERIOD
                }
            ], 1
        );

        // block increases to release 
        utils::increase_block(500, 1001);
        undelegate(
            delegator1,
            metadata,
            option::some<u64>(DELEGATING_AMOUNT),
            release_time,
            validator
        );

        assert!(
            get_locked_delegations(signer::address_of(delegator1)) == vector[
                LockedDelegationResponse {
                    metadata,
                    validator,
                    amount: DELEGATING_AMOUNT,
                    release_time: TEST_RELEASE_PERIOD
                },
                LockedDelegationResponse {
                    metadata,
                    validator : val2,
                    amount: DELEGATING_AMOUNT,
                    release_time: TEST_RELEASE_PERIOD
                }], 2
        );
        
        // check delegation share and amount
        assert!(
            get_delegation(validator,get_staking_address(signer::address_of(delegator1)),true) == DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: to_sdk(get_staking_address(signer::address_of(delegator1))),
                    validator_address: validator,
                    shares: vector [
                        DecCoin {
                            denom: coin::metadata_to_denom(metadata),
                            amount: decimal128::from_ratio_u64(DELEGATING_AMOUNT, 1)
                        }
                    ]
                },
                balance: vector[
                    Coin {
                        denom: coin::metadata_to_denom(metadata),
                        amount: DELEGATING_AMOUNT
                    }
                ]
            }, 3
        );

        assert!(
            get_delegation(val2,get_staking_address(signer::address_of(delegator1)),true) == DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: to_sdk(get_staking_address(signer::address_of(delegator1))),
                    validator_address: val2,
                    shares: vector [
                        DecCoin {
                            denom: coin::metadata_to_denom(metadata),
                            amount: decimal128::from_ratio_u64(DELEGATING_AMOUNT, 1)
                        }
                    ]
                },
                balance: vector[
                    Coin {
                        denom: coin::metadata_to_denom(metadata),
                        amount: DELEGATING_AMOUNT
                    }
                ]
            }, 4
        );
        // check unbonding entry
        assert!(get_unbonding_delegation(get_staking_address(signer::address_of(delegator1)),validator) == UnbondingDelegationResponse {
            unbond: UnbondingDelegation {
                delegator_address: to_sdk(get_staking_address(signer::address_of(delegator1))),
                validator_address: validator,
                entries: vector [
                    UnbondingDelegationEntry {
                        creation_height: 502,
                        completion_time: string::utf8(b""), // mock mstaking module doesn't set compleation time
                        initial_balance: vector[
                            Coin {
                                denom: string::utf8(b"INIT-USDC"),
                                amount: DELEGATING_AMOUNT
                            }
                        ],
                        balance: vector[
                            Coin {
                                denom: string::utf8(b"INIT-USDC"),
                                amount: DELEGATING_AMOUNT
                            }
                        ],
                        unbonding_id: 1,
                        unbonding_on_hold_ref_count: 0
                    }
                ]
            }
        } , 5);

        utils::increase_block(1, 2);
        undelegate(
            delegator1,
            metadata,
            option::none<u64>(),
            release_time,
            validator
        );

        // check unbonding entry
        assert!(get_unbonding_delegation(get_staking_address(signer::address_of(delegator1)),validator) == UnbondingDelegationResponse {
            unbond: UnbondingDelegation {
                delegator_address: to_sdk(get_staking_address(signer::address_of(delegator1))),
                validator_address: validator,
                entries: vector [
                    UnbondingDelegationEntry {
                        creation_height: 502,
                        completion_time: string::utf8(b""), // mock mstaking module doesn't set compleation time
                        initial_balance: vector[
                            Coin {
                                denom: string::utf8(b"INIT-USDC"),
                                amount: DELEGATING_AMOUNT
                            }
                        ],
                        balance: vector[
                            Coin {
                                denom: string::utf8(b"INIT-USDC"),
                                amount: DELEGATING_AMOUNT
                            }
                        ],
                        unbonding_id: 1,
                        unbonding_on_hold_ref_count: 0
                    },
                    UnbondingDelegationEntry {
                        creation_height: 503,
                        completion_time: string::utf8(b""), // mock mstaking module doesn't set compleation time
                        initial_balance: vector[
                            Coin {
                                denom: string::utf8(b"INIT-USDC"),
                                amount: DELEGATING_AMOUNT
                            }
                        ],
                        balance: vector[
                            Coin {
                                denom: string::utf8(b"INIT-USDC"),
                                amount: DELEGATING_AMOUNT
                            }
                        ],
                        unbonding_id: 2,
                        unbonding_on_hold_ref_count: 0
                    }
                ]
            }
        } , 6);

        assert!(
            get_locked_delegations(signer::address_of(delegator1)) == vector[
                LockedDelegationResponse {
                    metadata,
                    validator : val2,
                    amount: DELEGATING_AMOUNT,
                    release_time,
                }
            ], 7
        );


        // check mstaking share and amount of mstaking
        assert!(
            get_delegation(val2,get_staking_address(signer::address_of(delegator1)),true) == DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: to_sdk(get_staking_address(signer::address_of(delegator1))),
                    validator_address: val2,
                    shares: vector [
                        DecCoin {
                            denom: coin::metadata_to_denom(metadata),
                            amount: decimal128::from_ratio_u64(DELEGATING_AMOUNT, 1)
                        }
                    ]
                },
                balance: vector[
                    Coin {
                        denom: coin::metadata_to_denom(metadata),
                        amount: DELEGATING_AMOUNT
                    }
                ]
            }, 8
        );
        // pass the unbonding period 
        utils::increase_block(500, mock_mstaking::get_unbonding_period());
        // clear the unbonding entry
        mock_mstaking::clear_completed_entries(); 
        assert!(coin::balance(get_staking_address(signer::address_of(delegator1)), metadata) == 2 * DELEGATING_AMOUNT, 9 );
        
        withdraw_asset(
            delegator1,
            metadata,
            option::some(DELEGATING_AMOUNT)
        );

        assert!(coin::balance(signer::address_of(delegator1), metadata) == DELEGATING_AMOUNT, 10 );
        withdraw_asset(
            delegator1,
            metadata,
            option::none()
        );
        assert!(coin::balance(signer::address_of(delegator1), metadata) == 2 * DELEGATING_AMOUNT, 11 );
    }

    #[test(chain = @initia_std, vip = @vip, delegator1 = @0x19c9b6007d21a996737ea527f46b160b0a057c37)]
    fun test_lock_staking_redelegate(chain: &signer, vip: &signer, delegator1: &signer) acquires StakingAccount, ModuleStore {
        initialize(chain,vip);
        let (_ , time) = block::get_block_info();
        let release_time = time + TEST_RELEASE_PERIOD;
        let new_release_time = time + 2 * TEST_RELEASE_PERIOD;
        let metadata = mock_mstaking::get_lp_metadata();
        let src_val = mock_mstaking::get_validator1();
        let dst_val = mock_mstaking::get_validator2();
        // mock lp providing
        coin::transfer(chain, signer::address_of(delegator1), metadata, 3 * DELEGATING_AMOUNT);

        // block increases
        utils::increase_block(1, 2);

        // delegate
        delegate(
            delegator1,
            metadata,
            2 * DELEGATING_AMOUNT,
            release_time,
            src_val
        );

        assert!(
            get_locked_delegations(signer::address_of(delegator1)) == vector[
                LockedDelegationResponse {
                    metadata,
                    validator: src_val,
                    amount: 2 * DELEGATING_AMOUNT,
                    release_time,
                },
            ], 1
        );

        utils::increase_block(1, 2);

        redelegate(
            delegator1,
            metadata,
            option::some<u64>(DELEGATING_AMOUNT),
            release_time,
            src_val,
            release_time,
            dst_val
        );

        // block increases to release 
        utils::increase_block(500, 1001);
        assert!(
            get_redelegations(to_sdk(get_staking_address(signer::address_of(delegator1))),src_val, dst_val) == 
            RedelegationsResponse {
                redelegation_responses: vector [
                    RedelegationResponse {
                    redelegation: Redelegation {
                        delegator_address: to_sdk(get_staking_address(signer::address_of(delegator1))),
                        validator_src_address: src_val,
                        validator_dst_address: dst_val,
                        entries: option::none()
                    },
                    entries: vector [
                        RedelegationEntryResponse {
                            redelegation_entry: RedelegationEntry {
                                creation_height: 2,
                                completion_time: string::utf8(b""),
                                initial_balance: vector[
                                    Coin {
                                        denom: string::utf8(b"INIT-USDC"),
                                        amount: DELEGATING_AMOUNT
                                    }
                                ],
                                shares_dst: vector[
                                    DecCoin {
                                        denom: string::utf8(b"INIT-USDC"),
                                        amount: decimal128::from_ratio_u64(DELEGATING_AMOUNT, 1)
                                    }
                                ],
                                unbonding_id: 1
                            },
                        balance: vector[
                            Coin {
                                denom: string::utf8(b"INIT-USDC"),
                                amount: DELEGATING_AMOUNT
                            }
                        ]
                        }
                    ]
                    }
                ],
                pagination: option::none()
            } , 2
        );
        assert!(
            get_locked_delegations(signer::address_of(delegator1)) == vector[
                LockedDelegationResponse {
                    metadata,
                    validator: src_val,
                    amount: DELEGATING_AMOUNT,
                    release_time,
                },
                LockedDelegationResponse {
                    metadata,
                    validator : dst_val,
                    amount: DELEGATING_AMOUNT,
                    release_time,
                }], 3
        );
        
        assert!(coin::balance(get_staking_address(signer::address_of(delegator1)), metadata) == 0 , 4 );
        
        // pass the unbonding period 
        utils::increase_block(500, mock_mstaking::get_unbonding_period());
        // clear the unbonding entry
        mock_mstaking::clear_completed_entries(); 
        
        assert!(coin::balance(get_staking_address(signer::address_of(delegator1)), metadata) == 0 , 5 );
        
    }
    
}
