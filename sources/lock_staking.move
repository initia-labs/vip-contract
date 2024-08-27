module vip::lock_staking {
    use std::bcs::to_bytes;
    use std::error;
    use std::signer;
    use std::string::{Self, String};
    use std::vector;

    use initia_std::address::to_sdk;
    use initia_std::block;
    use initia_std::coin;
    use initia_std::cosmos::{stargate, move_execute};
    use initia_std::decimal128::{Self, Decimal128};
    use initia_std::fungible_asset::{Self, FungibleAsset, Metadata};
    use initia_std::json::{marshal, unmarshal};
    use initia_std::object::{Self, ExtendRef, Object};
    use initia_std::option::{Self, Option};
    use initia_std::table::{Self, Table};
    use initia_std::table_key;
    use initia_std::type_info;
    use initia_std::staking;
    use initia_std::query::query_stargate;

    friend vip::zapping;

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
        validators: Table<String, u16>, // validator => number of delegation
        delegations: Table<DelegationKey, LockedDelegation>,
    }

    struct DelegationKey has copy, drop {
        metadata: Object<Metadata>,
        release_time: vector<u8>, // use table encoded key for ordering
        validator: String,
    }

    // entry functions

    public entry fun withdraw_delegator_reward(account: &signer) acquires StakingAccount {
        let staking_account_signer = register(account);
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
        withdraw_uinit(&staking_account_signer);
    }

    public entry fun withdraw_asset(
        account: &signer,
        metadata: Object<Metadata>,
        amount: Option<u64>,
    ) acquires StakingAccount {
        let staking_account_signer = register(account);
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
    ) acquires StakingAccount {
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
        release_time: u64,
        validator_src_address: String,
        validator_dst_address: String,
    ) acquires StakingAccount {
        let staking_account_signer = register(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let delegation =
            get_locked_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator_src_address,
            );
        let share = floor(&delegation.share);
        let metadata = delegation.metadata;
        let amount =
            staking::share_to_amount(
                *string::bytes(&delegation.validator),
                &metadata,
                share,
            );
        let coin = create_coin(metadata, amount);

        let msg = MsgBeginRedelegate {
            _type_: string::utf8(b"/initia.mstaking.v1.MsgBeginRedelegate"),
            delegator_address: to_sdk(staking_account_addr),
            validator_src_address: delegation.validator,
            validator_dst_address,
            amount: vector[coin]
        };

        stargate(&staking_account_signer, marshal(&msg));

        move_execute(
            &staking_account_signer,
            @vip,
            string::utf8(b"lock_staking"),
            string::utf8(b"redelegate_hook"),
            vector[],
            vector[
                to_bytes(&metadata),
                to_bytes(&release_time),
                to_bytes(&validator_src_address),
                to_bytes(&validator_dst_address),],
        )
    }

    public entry fun undelegate(
        account: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
    ) acquires StakingAccount {
        let staking_account_signer = register(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let (_, curr_time) = block::get_block_info();
        let delegation =
            get_locked_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator,
            );

        assert!(
            curr_time > release_time,
            error::invalid_state(ENOT_RELEASE),
        );
        let share = floor(&delegation.share);
        let metadata = delegation.metadata;
        let amount =
            staking::share_to_amount(
                *string::bytes(&delegation.validator),
                &metadata,
                share,
            );
        let coin = create_coin(metadata, amount);

        let msg = MsgUndelegate {
            _type_: string::utf8(b"/initia.mstaking.v1.MsgUndelegate"),
            delegator_address: to_sdk(staking_account_addr),
            validator_address: delegation.validator,
            amount: vector[coin]
        };

        stargate(&staking_account_signer, marshal(&msg));
        move_execute(
            &staking_account_signer,
            @vip,
            string::utf8(b"lock_staking"),
            string::utf8(b"undelegate_hook"),
            vector[],
            vector[
                to_bytes(&metadata),
                to_bytes(&release_time),
                to_bytes(&validator),],
        )
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
    ) acquires StakingAccount {
        let (_, curr_time) = block::get_block_info();
        assert!(
            release_time > curr_time,
            error::invalid_argument(ESMALL_RLEASE_TIME),
        );

        let staking_account_signer = register(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
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
        let delegation = get_delegation(
            validator_address,
            staking_account_addr,
            false,
        );
        let (find, found_index) = vector::find<DecCoin>(
            &delegation.delegation.shares,
            |share| { compare_denom(share, denom) },
        );
        let share_before =
            if (find) {
                let share = vector::borrow(
                    &delegation.delegation.shares,
                    found_index,
                );
                share.amount
            } else {
                decimal128::zero()
            };
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
    public entry fun delegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        share_before: Decimal128,
    ) acquires StakingAccount {
        let staking_account_addr = signer::address_of(staking_account_signer);
        assert_staking_account(staking_account_addr);

        // calculate share diff
        let denom = coin::metadata_to_denom(metadata);

        let delegation = get_delegation(
            validator,
            staking_account_addr,
            true,
        );
        let (find, found_index) = vector::find<DecCoin>(
            &delegation.delegation.shares,
            |share| { compare_denom(share, denom) },
        );
        assert!(find, error::not_found(EDELEGATION_NOT_FOUND));
        let share_after = vector::borrow(&delegation.delegation.shares, found_index);
        let share =
            decimal128::new(
                decimal128::val(&share_after.amount) - decimal128::val(&share_before)
            );

        // store delegation
        add_locked_delegation(
            staking_account_addr,
            metadata,
            release_time,
            validator,
            share,
        );

        // withdraw uinit from staking account
        withdraw_uinit(staking_account_signer);
    }

    public entry fun redelegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator_src_address: String,
        validator_dst_address: String,
    ) acquires StakingAccount {
        let staking_account_addr = signer::address_of(staking_account_signer);
        assert_staking_account(staking_account_addr);
        let (metadata, validator_src_address, _) =
            remove_locked_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator_src_address,
            );
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

        // store delegation
        add_locked_delegation(
            staking_account_addr,
            metadata,
            release_time,
            validator_dst_address,
            share.amount,
        );

        // withdraw uinit from staking account
        withdraw_uinit(staking_account_signer);
    }

    public entry fun undelegate_hook(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
    ) acquires StakingAccount {
        let staking_account_addr = signer::address_of(staking_account_signer);
        assert_staking_account(staking_account_addr);
        let (metadata, validator, _) =
            remove_locked_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator,
            );
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

        // withdraw uinit from staking account
        withdraw_uinit(staking_account_signer);
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
        query_force: bool,
    ): DelegationResponseInner acquires StakingAccount {
        let staking_account = borrow_global<StakingAccount>(delegator_addr);
        let delegator_addr = to_sdk(delegator_addr);
        if (!table::contains(
                &staking_account.validators,
                validator_addr,
            ) && !query_force) {
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

    fun register(account: &signer): signer acquires StakingAccount {
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

    fun remove_locked_delegation(
        addr: address,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String
    ): (Object<Metadata>, String, Decimal128) acquires StakingAccount {
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
        assert!(
            table::contains(&staking_account.delegations, key),
            error::not_found(EDELEGATION_NOT_FOUND),
        );
        let LockedDelegation { metadata, validator, share } =
            table::remove(&mut staking_account.delegations, key);
        let count = table::borrow_mut(&mut staking_account.validators, validator);
        *count = *count - 1;
        if (count == &0) {
            table::remove(
                &mut staking_account.validators,
                validator,
            );
        };
        (metadata, validator, share)
    }

    fun add_locked_delegation(
        addr: address,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
        share: Decimal128
    ) acquires StakingAccount {
        // store delegation
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
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
    }

    fun floor(val: &Decimal128): u64 {
        (decimal128::val(val) / decimal128::val(&decimal128::one()) as u64)
    }

    fun withdraw_uinit(staking_account_signer: &signer) {
        move_execute(
            staking_account_signer,
            @vip,
            string::utf8(b"lock_staking"),
            string::utf8(b"withdraw_asset_for_staking_account"),
            vector[],
            vector[
                to_bytes(&coin::metadata(@initia_std, string::utf8(b"uinit"))),
                to_bytes(&option::none<u64>()),],
        )
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
        let (_, curr_time) = block::get_block_info();

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
            // let remain_lock_preiod =
            //     if (release_time > curr_time) {
            //         release_time - curr_time
            //     } else { 0 };

            vector::push_back(
                &mut res,
                LockedDelegationResponse {
                    metadata,
                    validator,
                    amount,
                    release_time,
                },
            );
        };

        res
    }

    #[test_only]
    use initia_std::query::set_query_response;

    #[test_only]
    struct MstakingState has key {
        extend_ref: ExtendRef,
        delegation: Table<DelegationRequest, DelegationResponse>,
        unbonding_delegation: Table<UnbondingDelegationRequest, UnbondingDelegationResponse>,
        redelegations: Table<RedelegationsRequest, RedelegationsResponse>,
        unbonding_period: u64,
    }

    // must be execute by @0x1
    #[test_only]
    public fun init_module_for_test(chain: &signer) {
        assert!(signer::address_of(chain) == @0x1, 1);
        let constructor_ref = object::create_object(@0x1, false);
        let extend_ref = object::generate_extend_ref(&constructor_ref);
        move_to(
            chain,
            MstakingState {
                extend_ref,
                delegation: table::new(),
                unbonding_delegation: table::new(),
                redelegations: table::new(),
                unbonding_period: 0,
            },
        );
    }

    #[test_only]
    public fun set_unbonding_period(period: u64) acquires MstakingState {
        let state = borrow_global_mut<MstakingState>(@0x1);
        state.unbonding_period = period;
    }

    #[test_only]
    public fun delegate_for_test(
        account: &signer,
        fa: FungibleAsset,
        release_time: u64,
        validator_addr: String
    ) acquires StakingAccount, MstakingState {
        let state = borrow_global_mut<MstakingState>(@0x1);
        let addr = signer::address_of(account);
        let staking_account_addr = get_staking_address(addr);
        let delegator_addr = to_sdk(staking_account_addr);
        let metadata = fungible_asset::metadata_from_asset(&fa);
        let amount = fungible_asset::amount(&fa);
        delegate_internal(
            account,
            fa,
            release_time,
            validator_addr,
        );

        // transfer token to state
        let staking_account_signer = &register(account);
        coin::transfer(
            staking_account_signer,
            object::address_from_extend_ref(&state.extend_ref),
            metadata,
            amount,
        );

        // update query
        let denom = coin::metadata_to_denom(metadata);
        let delegation = get_delegation(
            validator_addr,
            staking_account_addr,
            false,
        );
        let (find, found_index) = vector::find<DecCoin>(
            &delegation.delegation.shares,
            |share| { compare_denom(share, denom) },
        );
        let share_before =
            if (find) {
                let share = vector::borrow(
                    &delegation.delegation.shares,
                    found_index,
                );
                share.amount
            } else {
                decimal128::zero()
            };

        let req = DelegationRequest { delegator_addr, validator_addr };
        let dec_amount = decimal128::from_ratio_u64(amount, 1);
        if (!find) {
            vector::push_back(
                &mut delegation.delegation.shares,
                DecCoin { denom, amount: dec_amount },
            );
            vector::push_back(
                &mut delegation.balance,
                Coin { denom, amount },
            );
        } else {
            let share = vector::borrow_mut(
                &mut delegation.delegation.shares,
                found_index,
            );
            share.amount = decimal128::add(&share.amount, &dec_amount);
            let balance = vector::borrow_mut(
                &mut delegation.balance,
                found_index,
            );
            balance.amount = balance.amount + amount;
        };
        set_query_response(
            b"/initia.mstaking.v1.Query/Delegation",
            marshal(&req),
            marshal(&delegation),
        );
        table::upsert(
            &mut state.delegation,
            req,
            DelegationResponse { delegation_response: delegation },
        );

        // execute hook
        delegate_hook(
            staking_account_signer,
            metadata,
            release_time,
            validator_addr,
            share_before,
        );
        finalize_unbonding();
    }

    #[test_only]
    public fun redelegate_for_test(
        account: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        src_validator_addr: String,
        dst_validator_addr: String,
    ) acquires StakingAccount, MstakingState {
        let state = borrow_global_mut<MstakingState>(@0x1);
        let addr = signer::address_of(account);
        let staking_account_addr = get_staking_address(addr);
        let delegator_addr = to_sdk(staking_account_addr);
        redelegate(
            account,
            metadata,
            release_time,
            src_validator_addr,
            dst_validator_addr,
        );

        // update redeleation query
        let req = RedelegationsRequest {
            delegator_addr,
            src_validator_addr,
            dst_validator_addr
        };
        let res =
            table::borrow_mut_with_default(
                &mut state.redelegations,
                req,
                RedelegationsResponse {
                    redelegation_responses: vector[
                        RedelegationResponse {
                            redelegation: Redelegation {
                                delegator_address: delegator_addr,
                                validator_src_address: src_validator_addr,
                                validator_dst_address: dst_validator_addr,
                                entries: option::none(),
                            },
                            entries: vector[],
                        }],
                    pagination: option::none()
                },
            );

        let (height, curr_time) = block::get_block_info();
        let delegation =
            get_locked_delegation(
                staking_account_addr,
                metadata,
                release_time,
                src_validator_addr,
            );
        let share = floor(&delegation.share);
        let metadata = delegation.metadata;
        let denom = coin::metadata_to_denom(metadata);
        let amount =
            staking::share_to_amount(
                *string::bytes(&delegation.validator),
                &metadata,
                share,
            );

        let new_entry = RedelegationEntryResponse {
            redelegation_entry: RedelegationEntry {
                creation_height: (height as u32),
                completion_time: initia_std::string_utils::to_string(
                    &(curr_time + state.unbonding_period)
                ),
                initial_balance: vector[Coin { denom, amount }],
                shares_dst: vector[DecCoin {
                        denom,
                        amount: decimal128::from_ratio_u64(amount, 1)
                    }],
                unbonding_id: 1,
            },
            balance: vector[Coin { denom, amount }],
        };

        let response = vector::borrow_mut(&mut res.redelegation_responses, 0);
        vector::push_back(&mut response.entries, new_entry);
        set_query_response(
            b"/initia.mstaking.v1.Query/UnbondingDelegation",
            marshal(&req),
            marshal(res),
        );

        // update delegation query
        let denom = coin::metadata_to_denom(metadata);
        let delegation = get_delegation(
            dst_validator_addr,
            staking_account_addr,
            false,
        );
        let (find, found_index) = vector::find<DecCoin>(
            &delegation.delegation.shares,
            |share| { compare_denom(share, denom) },
        );

        let req = DelegationRequest { delegator_addr, validator_addr: dst_validator_addr };
        let dec_amount = decimal128::from_ratio_u64(amount, 1);
        if (!find) {
            vector::push_back(
                &mut delegation.delegation.shares,
                DecCoin { denom, amount: dec_amount },
            );
            vector::push_back(
                &mut delegation.balance,
                Coin { denom, amount },
            );
        } else {
            let share = vector::borrow_mut(
                &mut delegation.delegation.shares,
                found_index,
            );
            share.amount = decimal128::add(&share.amount, &dec_amount);
            let balance = vector::borrow_mut(
                &mut delegation.balance,
                found_index,
            );
            balance.amount = balance.amount + amount;
        };
        set_query_response(
            b"/initia.mstaking.v1.Query/Delegation",
            marshal(&req),
            marshal(&delegation),
        );
        table::upsert(
            &mut state.delegation,
            req,
            DelegationResponse { delegation_response: delegation },
        );

        // execute hook
        redelegate_hook(
            &register(account),
            metadata,
            release_time,
            src_validator_addr,
            dst_validator_addr,
        );
        finalize_unbonding();
    }

    #[test_only]
    public fun undelegate_for_test(
        account: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator_addr: String
    ) acquires StakingAccount, MstakingState {
        let state = borrow_global_mut<MstakingState>(@0x1);
        let addr = signer::address_of(account);
        let staking_account_addr = get_staking_address(addr);
        let delegator_addr = to_sdk(staking_account_addr);
        undelegate(
            account,
            metadata,
            release_time,
            validator_addr,
        );

        // update query
        let req = UnbondingDelegationRequest { delegator_addr, validator_addr };
        let res =
            table::borrow_mut_with_default(
                &mut state.unbonding_delegation,
                req,
                UnbondingDelegationResponse {
                    unbond: UnbondingDelegation {
                        delegator_address: delegator_addr,
                        validator_address: validator_addr,
                        entries: vector[],
                    }
                },
            );

        let (height, curr_time) = block::get_block_info();
        let delegation =
            get_locked_delegation(
                staking_account_addr,
                metadata,
                release_time,
                validator_addr,
            );
        let share = floor(&delegation.share);
        let metadata = delegation.metadata;
        let denom = coin::metadata_to_denom(metadata);
        let amount =
            staking::share_to_amount(
                *string::bytes(&delegation.validator),
                &metadata,
                share,
            );

        let new_entry = UnbondingDelegationEntry {
            creation_height: height,
            completion_time: initia_std::string_utils::to_string(
                &(curr_time + state.unbonding_period)
            ),
            initial_balance: vector[Coin { denom, amount }],
            balance: vector[Coin { denom, amount }],
            unbonding_id: 1,
            unbonding_on_hold_ref_count: 1,
        };
        set_query_response(
            b"/initia.mstaking.v1.Query/Redelegations",
            marshal(&req),
            marshal(res),
        );
        vector::push_back(&mut res.unbond.entries, new_entry);

        // execute hook
        undelegate_hook(
            &register(account),
            metadata,
            release_time,
            validator_addr,
        );
        finalize_unbonding();
    }

    #[test_only]
    public fun finalize_unbonding() {
        // TODO: impl
    }
}
