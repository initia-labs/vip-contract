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

    const EUNAUTHORIZED: u64 = 1;
    const EDELEGATION_NOT_FOUND: u64 = 2;
    // length of redelegation_responses must be 1
    const EREDELEGATION_LENGTH: u64 = 3;
    const ECREATION_HEIGHT_MISMATCH: u64 = 4;
    const ENOT_SINGLE_COIN: u64 = 5;
    const EDENOM_MISMATCH: u64 = 6;
    const ENOT_ENOUGH_BALANCE: u64 = 7;
    const ESMALL_RLEASE_TIME: u64 = 8;

    friend vip::zapping;

    struct LockedDelegation has store {
        metadata: Object<Metadata>,
        validator: String,
        share: Decimal128,
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

        let iter = table::iter(
            &staking_account.validators,
            option::none(),
            option::none(),
            1
        );

        loop {
            if (!table::prepare<String, u16>(iter)) { break };
            let (validator, _) = table::next<String, u16>(iter);
            let type = b"/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward";
            let data = MsgWithdrawDelegatorReward {
                delegator_address: to_sdk(staking_account_addr),
                validator_address: validator,
            };
            execute<MsgWithdrawDelegatorReward>(&staking_account_signer, type, data);
        };
        
        // withdraw uinit from staking account
        withdraw_uinit(&staking_account_signer);
    }

    public entry fun withdraw_asset(
        staking_account_signer: &signer,
        metadata: Object<Metadata>,
        amount: Option<u64>,
    ) {
        let staking_account_addr = signer::address_of(staking_account_signer);
        assert_staking_account(staking_account_addr);
        let object = object::address_to_object<StakingAccount>(staking_account_addr);
        let owner = object::owner(object);

        let balance = coin::balance(staking_account_addr, metadata);

        let withdraw_amount = if (option::is_none(&amount)) {
            balance
        } else {
            let withdraw_amount = *option::borrow(&amount);
            assert!(withdraw_amount <= balance, error::invalid_argument(ENOT_ENOUGH_BALANCE));
            withdraw_amount
        };

        if (withdraw_amount == 0) return

        coin::transfer(staking_account_signer, owner, metadata, withdraw_amount);
    }

    // stargate msgs
    struct Msg<T> has drop {
        _type_: String,
        data: T,
    }

    struct MsgDelegate has drop {
        delegator_address: String,
        validator_address: String,
        amount: vector<Coin>, 
    }

    struct MsgBeginRedelegate has drop {
        delegator_address: String,
        validator_src_address: String,
        validator_dst_address: String,
        amount: vector<Coin>, 
    }

    struct MsgUndelegate has drop {
        delegator_address: String,
        validator_address: String,
        amount: vector<Coin>,
    }

    struct MsgWithdrawDelegatorReward has drop {
        delegator_address: String,
        validator_address: String,
    }

    public(friend) fun delegate(account: &signer, fa: FungibleAsset, release_time: u64, validator_address: String) acquires StakingAccount {
        let (_, timestamp) = block::get_block_info();
        assert!(release_time > timestamp, error::invalid_argument(ESMALL_RLEASE_TIME));

        let staking_account_signer = register(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let metadata = fungible_asset::metadata_from_asset(&fa);
        let amount = fungible_asset::amount(&fa);
        let denom = coin::metadata_to_denom(metadata);
        let coin = Coin { denom, amount };

        // deposit token to staking account addr
        coin::deposit(staking_account_addr, fa);

        // delegate
        let type = b"/initia.mstaking.v1.MsgDelegate";
        let data = MsgDelegate {
            delegator_address: to_sdk(staking_account_addr),
            validator_address,
            amount: vector[coin]
        };
        execute<MsgDelegate>(&staking_account_signer, type, data);

        // execute hook
        let delegation = get_delegation(validator_address, to_sdk(staking_account_addr));
        let (find, found_index) = vector::find<DecCoin>(&delegation.delegation.shares, |share| { compare_denom(share, denom) });
        let share_before = if (find) {
            let share = vector::borrow(&delegation.delegation.shares, found_index);
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
                to_bytes(&share_before),
            ]
        )
    }

    public(friend) fun redelegate(
        account: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator_src_address: String,
        validator_dst_address: String,
    ) acquires StakingAccount {
        let staking_account_signer = register(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let delegation = get_locked_delegation(staking_account_addr, metadata, release_time, validator_src_address);
        let share = floor(&delegation.share);
        let metadata = delegation.metadata;
        let amount = staking::share_to_amount(*string::bytes(&delegation.validator), &metadata, share);
        let coin = create_coin(metadata, amount);

        let type = b"/initia.mstaking.v1.MsgBeginRedelegate";
        let data = MsgBeginRedelegate {
            delegator_address: to_sdk(staking_account_addr),
            validator_src_address: delegation.validator,
            validator_dst_address,
            amount: vector[coin]
        };

        execute<MsgBeginRedelegate>(&staking_account_signer, type, data);

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
                to_bytes(&validator_dst_address),
            ]
        )
    }

    public(friend) fun undelegate(
        account: &signer,
        metadata: Object<Metadata>,
        release_time: u64,
        validator: String,
    ) acquires StakingAccount {
        let staking_account_signer = register(account);
        let staking_account_addr = signer::address_of(&staking_account_signer);
        let delegation = get_locked_delegation(staking_account_addr, metadata, release_time, validator);
        let share = floor(&delegation.share);
        let metadata = delegation.metadata;
        let amount = staking::share_to_amount(*string::bytes(&delegation.validator), &metadata, share);
        let coin = create_coin(metadata, amount);

        let type = b"/initia.mstaking.v1.MsgUndelegate";
        let data = MsgUndelegate {
            delegator_address: to_sdk(staking_account_addr),
            validator_address: delegation.validator,
            amount: vector[coin]
        };

        execute<MsgUndelegate>(&staking_account_signer, type, data);
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
        let delegation = get_delegation(validator, to_sdk(staking_account_addr));
        let (find, found_index) = vector::find<DecCoin>(&delegation.delegation.shares, |share| { compare_denom(share, denom) });
        assert!(find, error::not_found(EDELEGATION_NOT_FOUND));
        let share_after = vector::borrow(&delegation.delegation.shares, found_index);
        let share = decimal128::new(decimal128::val(&share_after.amount) - decimal128::val(&share_before));

        // store delegation
        add_locked_delegation(staking_account_addr, metadata, release_time, validator, share);

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
        let (metadata, validator_src_address, _) = remove_locked_delegation(staking_account_addr, metadata, release_time, validator_src_address);
        let (height, _) = block::get_block_info();
        let denom = coin::metadata_to_denom(metadata);

        // get redelegation
        let redelegations = get_redelegations(to_sdk(staking_account_addr), validator_src_address, validator_dst_address);
        assert!(vector::length(&redelegations.redelegation_responses) == 1, error::internal(EREDELEGATION_LENGTH));
        let redelegation_response = vector::borrow_mut(&mut redelegations.redelegation_responses, 0);

        // the last entry is the most recent creation
        let RedelegationEntryResponse{ redelegation_entry, balance: _ } = vector::pop_back(&mut redelegation_response.entries);

        // check redelegation for prevent query ordering changed
        assert!(redelegation_entry.creation_height == height, error::internal(ECREATION_HEIGHT_MISMATCH));
        assert!(vector::length(&redelegation_entry.shares_dst) == 1, error::internal(ENOT_SINGLE_COIN));
        let share = vector::borrow(&redelegation_entry.shares_dst, 0);
        assert!(share.denom == denom, error::internal(EDENOM_MISMATCH));

        // store delegation
        add_locked_delegation(staking_account_addr, metadata, release_time, validator_dst_address, share.amount);

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
        let (metadata, validator, _) = remove_locked_delegation(staking_account_addr, metadata, release_time, validator);
        let (height, _) = block::get_block_info();
        let denom = coin::metadata_to_denom(metadata);

        // get undelegation
        let UnbondingDelegationResponse{ unbond } = get_unbonding_delegation(to_sdk(staking_account_addr), validator);

        // the last entry is the most recent creation
        let unbond_entry = vector::pop_back(&mut unbond.entries);

        // check redelegation to check query ordering changed
        assert!(unbond_entry.creation_height == height, error::internal(ECREATION_HEIGHT_MISMATCH));
        assert!(vector::length(&unbond_entry.initial_balance) == 1, error::internal(ENOT_SINGLE_COIN));
        let initial_balance = vector::borrow(&unbond_entry.initial_balance, 0);
        assert!(initial_balance.denom == denom, error::internal(EDENOM_MISMATCH));

        // withdraw uinit from staking account
        withdraw_uinit(staking_account_signer);
    }

    fun execute<T: drop>(sender: &signer, type: vector<u8>, data: T) {
        let msg = Msg<T> {
            _type_: string::utf8(type),
            data,
        };
        stargate(sender, marshal(&msg))
    }

    // stargate queries
    struct DelegationRequest has drop {
        validator_addr: String,
        delegator_addr: String,
    }

    struct DelegationResponse has drop {
        delegation: Delegation,
        balance: vector<Coin>
    }

    struct UnbondingDelegationRequest has drop {
        delegator_addr: String,
        validator_addr: String,
    }

    struct UnbondingDelegationResponse has drop {
        unbond: UnbondingDelegation,
    }

    // only allow single redelegation query
    struct RedelegationsRequest has drop {
        delegator_addr: String,
        src_validator_addr: String,
        dst_validator_addr: String,
    }

    struct RedelegationsResponse has drop {
        redelegation_responses: vector<RedelegationResponse>, // Always contains exactly one item, as only single redelegation queries are allowed
        pagination: Option<PageResponse>, // Always None, as only single redelegation queries are allowed
    }

    fun get_delegation(validator_addr: String, delegator_addr: String): DelegationResponse {
        let path = b"/initia.mstaking.v1.Query/Delegation";
        let request = DelegationRequest { validator_addr, delegator_addr };
        query<DelegationRequest, DelegationResponse>(path, request)
    }

    fun get_unbonding_delegation(delegator_addr: String, validator_addr: String): UnbondingDelegationResponse {
        let path = b"/initia.mstaking.v1.Query/UnbondingDelegation";
        let request = UnbondingDelegationRequest { validator_addr, delegator_addr };
        query<UnbondingDelegationRequest, UnbondingDelegationResponse>(path, request)
    }

    fun get_redelegations(delegator_addr: String, src_validator_addr: String, dst_validator_addr: String): RedelegationsResponse {
        let path = b"/initia.mstaking.v1.Query/Redelegations";
        let request = RedelegationsRequest { delegator_addr, src_validator_addr, dst_validator_addr };
        query<RedelegationsRequest, RedelegationsResponse>(path, request)
    }

    fun query<Request: drop, Response: drop>(path: vector<u8>, data: Request): Response {
        let response = query_stargate(path, marshal(&data));
        unmarshal<Response>(response)
    }

    // common cosmos types
    struct Delegation has drop {
        delegator_address: String,
        validator_address: String,
        shares: vector<DecCoin>
    }

    struct Coin has drop {
        denom: String,
        amount: u64,
    }

    struct DecCoin has drop {
        denom: String,
        amount: Decimal128,
    }

    struct UnbondingDelegation has drop {
        delegator_address: String,
        validator_address: String,
        entries: vector<UnbondingDelegationEntry>
    }

    struct UnbondingDelegationEntry has drop {
        creation_height: u64,
        completion_time: String,
        initial_balance: vector<Coin>,
        balance: vector<Coin>,
        unbonding_id: u64,
        unbonding_on_hold_ref_count: u64,
    }

    struct RedelegationResponse has drop {
        redelegation: Redelegation,
	    entries: vector<RedelegationEntryResponse>,
    }

    struct Redelegation has drop {
        delegator_address: String,
        validator_src_address: String,
        validator_dst_address: String,
        entries: Option<vector<RedelegationEntry>>, // Always None for query response
    }

    struct RedelegationEntry has drop {
        creation_height: u64,
        completion_time: String,
        initial_balance: vector<Coin>,
        shares_dst: vector<DecCoin>,
        unbonding_id: u64,
        unbonding_on_hold_ref_count: u64,
    }

    struct RedelegationEntryResponse has drop {
        redelegation_entry: RedelegationEntry,
        balance: vector<Coin>,
    }

    struct PageResponse has drop {
        next_key: String, // hex string
        total: u64,
    }

    // util functions
    public fun is_registered(addr: address): bool {
        let staking_account_addr = get_staking_address(addr);
        exists<StakingAccount>(staking_account_addr)
    }

    public fun get_staking_address(addr: address): address {
        object::create_object_address(&addr, generate_staking_account_seed(copy addr))
    }

    fun register(account: &signer): signer acquires StakingAccount {
        let addr = signer::address_of(account);
        if (!is_registered(addr)) {
            let constructor_ref = object::create_named_object(account, generate_staking_account_seed(addr));
            let extend_ref = object::generate_extend_ref(&constructor_ref);
            let transfer_ref = object::generate_transfer_ref(&constructor_ref);
            let staking_account_signer = object::generate_signer(&constructor_ref);
            move_to(
                &staking_account_signer,
                StakingAccount{
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
        assert!(exists<StakingAccount>(staking_account_addr), error::permission_denied(EUNAUTHORIZED))
    }

    fun compare_denom(dec_coin: &DecCoin, denom: String): bool {
        dec_coin.denom == denom
    }

    fun generate_delegation_key(metadata: Object<Metadata>, release_time: u64, validator: String): DelegationKey {
        DelegationKey {
            metadata,
            release_time: table_key::encode_u64(release_time),
            validator,
        }
    }

    inline fun get_locked_delegation(addr: address, metadata: Object<Metadata>, release_time: u64, validator: String): &LockedDelegation acquires StakingAccount {
        let staking_account = borrow_global<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
        assert!(table::contains(&staking_account.delegations, key), error::not_found(EDELEGATION_NOT_FOUND));
        table::borrow(&staking_account.delegations, key)
    }

    fun remove_locked_delegation(addr: address, metadata: Object<Metadata>, release_time: u64, validator: String): (Object<Metadata>, String, Decimal128) acquires StakingAccount {
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
        assert!(table::contains(&staking_account.delegations, key), error::not_found(EDELEGATION_NOT_FOUND));
        let LockedDelegation { metadata, validator, share } = table::remove(&mut staking_account.delegations, key);
        let count = table::borrow_mut(&mut staking_account.validators, validator);
        *count = *count - 1;
        if (count == &0) {
            table::remove(&mut staking_account.validators, validator);
        };
        (metadata, validator, share)
    }

    fun add_locked_delegation(addr: address, metadata: Object<Metadata>, release_time: u64, validator: String, share: Decimal128) acquires StakingAccount {
        // store delegation
        let staking_account = borrow_global_mut<StakingAccount>(addr);
        let key = generate_delegation_key(metadata, release_time, validator);
        if (!table::contains(&staking_account.delegations, key)) {
            let count = table::borrow_mut_with_default(&mut staking_account.validators, validator, 0);
            *count = *count + 1;
            table::add(&mut staking_account.delegations, key, LockedDelegation { metadata, validator, share: decimal128::zero() })
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
            string::utf8(b"withdraw_asset"),
            vector[],
            vector[
                to_bytes(&coin::metadata(@initia_std, string::utf8(b"uinit"))),
                to_bytes(&option::none<u64>()),
            ]
        )
    }

    #[test_only]
    use initia_std::query::set_query_response;

    #[test_only]
    public fun set_delegation_query(
        validator_addr: String,
        delegator_addr: String,
        denoms: vector<String>,
        balance_: vector<u64>,
        shares_: vector<Decimal128>,
    ) {
        let path = b"/initia.mstaking.v1.Query/Delegation";
        let request = DelegationRequest { validator_addr, delegator_addr };

        let len = vector::length(&denoms);
        let i = 0;
        let shares: vector<DecCoin> = vector[];
        let balance: vector<Coin> = vector[];
        while (i < len) {
            let denom = *vector::borrow(&denoms, i);
            let s = *vector::borrow(&shares_, i);
            let b = *vector::borrow(&balance_, i);
            vector::push_back(&mut shares, DecCoin { denom, amount: s });
            vector::push_back(&mut balance, Coin { denom, amount: b });
            i = i + 1;
        };
        let response = DelegationResponse {
            delegation: Delegation { 
                delegator_address: delegator_addr,
                validator_address: validator_addr,
                shares,
            },
            balance
        };
        set_query_response(path, marshal(&request), marshal(&response));
    }
}

// // this modlue will be merged to weight vote after PR #101 merged
// module vip::vip_voting_power {
//     use std::string::String;
//     use std::vector;
//     use initia_std::decimal128::{Self, Decimal128};
//     use initia_std::option::{Self, Option};
//     use initia_std::simple_map;
//     use initia_std::query::query_stargate;

//     // stargate queries
//     struct DelegatorDelegationsRequest has drop {
//         delegator_addr: String,
//         pagination: Option<PageRequest>
//     }

//     struct DelegatorDelegationsResponse has drop {
//         delegation_responses: vector<DelegationResponse>,
//         pagination: Option<PageResponse>,
//     }

//     struct PoolRequest has drop {}

//     struct PoolResponse has drop {
//         pool: Pool,
//     }

//     fun calculate_voting_power(delegator_addr: String): u64 {
//         let PoolResponse { pool } = get_pool();
//         let weight_map = simple_map::create<String, Decimal128>();
//         vector::for_each_ref(&pool.voting_power_weights, |weight| {
//             let DecCoin { denom, amount } = *weight;
//             simple_map::add(&mut weight_map, denom, amount);
//         });

//         let total_voting_power = 0;

//         let delegations = get_delegations(delegator_addr);
//         vector::for_each_ref(&delegations, |delegation| {
//             let DelegationResponse { delegation: _, balance } = *delegation;
//             vector::for_each_ref(&balance, |coin| {
//                 let Coin { denom, amount } = *coin;
//                 let weight = simple_map::borrow(&weight_map, &denom);
//                 let voting_power = decimal128::mul_u64(weight, amount);
//                 total_voting_power = total_voting_power + voting_power;
//             });
//         });

//         total_voting_power
//     }

//     fun get_delegations(delegator_addr: String): vector<DelegationResponse> {
//         let delegation_responses: vector<DelegationResponse> = vector[];
//         let pagination = PageRequest {
//             key: option::none(),
//             offset: option::none(),
//             limit: option::none(),
//             count_total: option::none(),
//             reverse: option::none(),
//         };

//         let path = b"/initia.mstaking.v1.Query/DelegatorDelegations";

//         loop {
//             let request = DelegatorDelegationsRequest { delegator_addr, pagination: option::some(pagination) };
//             let response = query<DelegatorDelegationsRequest, DelegatorDelegationsResponse>(path, request);
//             vector::append(&mut delegation_responses, response.delegation_responses);
            
//             if (option::is_none(&response.pagination)) {
//                 break
//             };

//             let pagination_res = option::borrow(&response.pagination);

//             if (option::is_none(&pagination_res.next_key)) {
//                 break
//             };

//             pagination.key = pagination_res.next_key;
//         };

//         delegation_responses
//     }

//     fun get_pool(): PoolResponse {
//         let path = b"/initia.mstaking.v1.Query/Pool";
//         query<PoolRequest, PoolResponse>(path, PoolRequest{})
//     }

//     fun query<Request: drop, Response: drop>(path: vector<u8>, data: Request): Response {
//         let response = query_stargate(path, marshal(&data));
//         unmarshal<Response>(response)
//     }

//     // cosmos types
//     struct Pool has drop {
//         not_bonded_tokens: vector<Coin>,
//         bonded_tokens: vector<Coin>,
//         voting_power_weights: vector<DecCoin>,
//     }

//     struct PageRequest has copy, drop {
//         key: Option<String>,
//         offset: Option<u64>,
//         limit: Option<u64>,
//         count_total: Option<bool>,
//         reverse: Option<bool>,
//     }

//     struct PageResponse has drop {
//         next_key: Option<String>,
//         total: Option<u64>,
//     }

//     struct DelegationResponse has copy, drop {
//         delegation: Delegation,
//         balance: vector<Coin>
//     }

//     struct Delegation has copy, drop {
//         delegator_address: String,
//         validator_address: String,
//         shares: vector<DecCoin>
//     }

//     struct Coin has copy, drop {
//         denom: String,
//         amount: u64,
//     }

//     struct DecCoin has copy, drop {
//         denom: String,
//         amount: Decimal128,
//     }

//     // temp, will replace after core update
//     native public fun marshal<T: drop>(value: &T): vector<u8>;
//     native public fun unmarshal<T: drop>(json: vector<u8>): T;
//     native public fun stargate(sender: &signer, data: vector<u8>);
// }