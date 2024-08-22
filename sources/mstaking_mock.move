#[test_only]
module vip::mstaking_mock {
    use std::signer;
    use std::vector;

    use initia_std::address::{to_sdk, from_sdk};
    use initia_std::block;
    use initia_std::coin;
    use initia_std::json::{marshal, unmarshal};
    use initia_std::decimal128::{Self, Decimal128};
    use initia_std::fungible_asset::Metadata;
    use initia_std::object::{Self, Object, ExtendRef};
    use initia_std::option::{Self, Option};
    use initia_std::string::{Self, String};
    use initia_std::query::set_query_response;
    use initia_std::query::query_stargate;
    use initia_std::table::{Self, Table};
    use initia_std::table_key::{encode_u64, decode_u64};

    struct TestState has key {
        extend_ref: ExtendRef, // for store asset
        unbonding_period: u64,
        unbonding_id: u64,

        // for check query is set
        delegation: Table<DelegationRequest, bool>,
        delegator_delegations: Table<DelegatorDelegationsRequest, bool>,
        unbonding_delegation: Table<UnbondingDelegationRequest, bool>,
        redelegations: Table<RedelegationsRequest, bool>,

        // completion time => unbonding mapping
        completion_time_to_unbonding: Table<CompletionTimeKey, UnbondingDelegationRequest>,
        // completion time => redelegation mapping
        completion_time_to_redelegations: Table<CompletionTimeKey, RedelegationsRequest>,
    }

    struct CompletionTimeKey has copy, drop {
        completion_time: vector<u8>,
        unbonding_id: vector<u8>,
    }

    public fun init_module(vip: &signer, unbonding_period: u64) {
        set_pool(vector[], vector[], vector[]);
        let constructor_ref = object::create_object(@0x1, false);
        let extend_ref = object::generate_extend_ref(&constructor_ref);
        move_to(
            vip,
            TestState {
                extend_ref,
                unbonding_period,
                unbonding_id: 0,
                delegation: table::new(),
                delegator_delegations: table::new(),
                unbonding_delegation: table::new(),
                redelegations: table::new(),
                completion_time_to_unbonding: table::new(),
                completion_time_to_redelegations: table::new(),
            },
        )
    }

    public fun delegate(
        account: &signer, validator_addr: String, metadata: Object<Metadata>, amount: u64
    ) acquires TestState {
        delegate_internal(account, validator_addr, metadata, amount, true);
    }

    public fun undelegate(
        account: &signer, validator_addr: String, metadata: Object<Metadata>, amount: u64
    ) acquires TestState {
        undelegate_internal(account, validator_addr, metadata, amount, true);
    }

    public fun redelegate(
        account: &signer,
        src_validator_addr: String,
        dst_validator_addr: String,
        metadata: Object<Metadata>,
        amount: u64,
    ) acquires TestState {
        undelegate_internal(account, src_validator_addr, metadata, amount, false);
        delegate_internal(account, dst_validator_addr, metadata, amount, false);
        let test_state = borrow_global_mut<TestState>(@vip);
        let addr = signer::address_of(account);
        let delegator_addr = to_sdk(addr);
        let denom = coin::metadata_to_denom(metadata);

        // create redelegate
        let redelegations_req = RedelegationsRequest {
            delegator_addr,
            src_validator_addr,
            dst_validator_addr
        };
        let redelegations =
            if (table::contains(&test_state.redelegations, redelegations_req)) {
                get_redelegations(redelegations_req)
            } else {
                table::add(&mut test_state.redelegations, redelegations_req, true);
                RedelegationsResponse {
                    redelegation_responses: vector[],
                    pagination: option::none()
                }
            };

        // update balance
        let (found, redelegation_index) = vector::find(
            &redelegations.redelegation_responses,
            |redelegation_response| {
                let redelegation_response_: RedelegationResponse = *redelegation_response;
                redelegation_response_.redelegation.delegator_address == delegator_addr
                    && redelegation_response_.redelegation.validator_src_address
                        == src_validator_addr
                    && redelegation_response_.redelegation.validator_dst_address
                        == dst_validator_addr
            },
        );

        if (!found) {
            redelegation_index = vector::length(&redelegations.redelegation_responses);
            vector::push_back(
                &mut redelegations.redelegation_responses,
                RedelegationResponse {
                    redelegation: Redelegation {
                        delegator_address: delegator_addr,
                        validator_src_address: src_validator_addr,
                        validator_dst_address: dst_validator_addr,
                        entries: option::none(),
                    },
                    entries: vector[],
                },
            );
        };

        let (height, timestamp) = block::get_block_info();
        test_state.unbonding_id = test_state.unbonding_id + 1;
        let completion_time = timestamp + test_state.unbonding_period;

        table::add(
            &mut test_state.completion_time_to_redelegations,
            gen_key(completion_time, test_state.unbonding_id),
            redelegations_req,
        );

        let redelegation_response = vector::borrow_mut(
            &mut redelegations.redelegation_responses, redelegation_index
        );
        let new_entry = RedelegationEntryResponse {
            redelegation_entry: RedelegationEntry {
                creation_height: (height as u32),
                completion_time: string::utf8(b""),
                initial_balance: vector[Coin { denom, amount }],
                shares_dst: vector[DecCoin {
                        denom,
                        amount: decimal128::from_ratio_u64(amount, 1)
                    }],
                unbonding_id: (test_state.unbonding_id as u32),
            },
            balance: vector[Coin { denom, amount }],
        };
        vector::push_back(&mut redelegation_response.entries, new_entry);

        set_redelegations(&redelegations_req, &redelegations);
    }

    public fun clear_completed_entries() acquires TestState {
        let test_state = borrow_global_mut<TestState>(@vip);
        let test_signer = object::generate_signer_for_extending(&test_state.extend_ref);
        let (_, timestamp) = block::get_block_info();
        let end_key = CompletionTimeKey {
            completion_time: encode_u64(timestamp + 1),
            unbonding_id: encode_u64(0),
        };

        // handle unbonding
        let key_to_delete = vector[];
        let iter =
            table::iter_mut(
                &mut test_state.completion_time_to_unbonding,
                option::none(),
                option::some(end_key),
                2,
            );
        loop {
            if (!table::prepare_mut(iter)) { break };
            let (key, unbonding_delegation_req) = table::next_mut(iter);
            let unbonding_delegation =
                get_unbonding_delegation(*unbonding_delegation_req);
            let unbonding_id = decode_u64(key.unbonding_id);
            let (found, entry_index) = vector::find(
                &unbonding_delegation.unbond.entries,
                |entry| {
                    let entry: UnbondingDelegationEntry = *entry;
                    entry.unbonding_id == unbonding_id
                },
            );
            assert!(found, 1);

            let entry = vector::remove(
                &mut unbonding_delegation.unbond.entries, entry_index
            );

            // release token
            let balance = vector::borrow(&entry.balance, 0);
            let metadata = coin::denom_to_metadata(balance.denom);
            let addr = from_sdk(unbonding_delegation.unbond.delegator_address);
            coin::transfer(&test_signer, addr, metadata, balance.amount);

            // set query
            set_unbonding_delegation(unbonding_delegation_req, &unbonding_delegation);

            // if no entry remove
            if (vector::length(&unbonding_delegation.unbond.entries) == 0) {
                vector::push_back(&mut key_to_delete, key);
            };
        };

        vector::for_each_ref(
            &key_to_delete,
            |key| {
                let req = table::remove(
                    &mut test_state.completion_time_to_unbonding, *key
                );
                unset_unbonding_delegation(&req);
            },
        );

        // handle redelegate
        let key_to_delete = vector[];
        let iter =
            table::iter_mut(
                &mut test_state.completion_time_to_redelegations,
                option::none(),
                option::some(end_key),
                2,
            );
        loop {
            if (!table::prepare_mut(iter)) { break };
            let (key, redelegations_req) = table::next_mut(iter);
            let redelegations = get_redelegations(*redelegations_req);
            let unbonding_id = decode_u64(key.unbonding_id);
            let redelegation = vector::borrow_mut(
                &mut redelegations.redelegation_responses, 0
            );
            let (found, entry_index) = vector::find(
                &redelegation.entries,
                |entry| {
                    let entry: RedelegationEntryResponse = *entry;
                    entry.redelegation_entry.unbonding_id == (unbonding_id as u32)
                },
            );
            assert!(found, 1);

            vector::remove(&mut redelegation.entries, entry_index);

            // if no entry remove
            if (vector::length(&redelegation.entries) == 0) {
                vector::push_back(&mut key_to_delete, key);
            };

            // set query
            set_redelegations(redelegations_req, &redelegations);
        };

        vector::for_each_ref(
            &key_to_delete,
            |key| {
                let req =
                    table::remove(&mut test_state.completion_time_to_redelegations, *key);
                unset_redelegations(&req);
            },
        );
    }

    public fun update_voting_power_weights(
        denoms: vector<String>, weights: vector<Decimal128>
    ) {
        assert!(vector::length(&denoms) == vector::length(&weights), 1);
        let voting_power_weights = vector[];
        let i = 0;
        let length = vector::length(&denoms);
        while (i < length) {
            let denom = *vector::borrow(&denoms, i);
            let amount = *vector::borrow(&weights, i);
            vector::push_back(&mut voting_power_weights, DecCoin { denom, amount });
            i = i + 1;
        };
        let pool = get_pool().pool;
        set_pool(pool.not_bonded_tokens, pool.bonded_tokens, voting_power_weights);
    }

    fun delegate_internal(
        account: &signer,
        validator_addr: String,
        metadata: Object<Metadata>,
        amount: u64,
        with_transfer: bool
    ) acquires TestState {
        let test_state = borrow_global_mut<TestState>(@vip);
        let addr = signer::address_of(account);
        let delegator_addr = to_sdk(addr);
        let denom = coin::metadata_to_denom(metadata);

        // transfer asset to test account
        if (with_transfer) {
            let test_account_addr =
                object::address_from_extend_ref(&test_state.extend_ref);
            coin::transfer(account, test_account_addr, metadata, amount);
        };

        // get and update delegation
        let delegation_req = DelegationRequest { validator_addr, delegator_addr };
        let delegation =
            if (table::contains(&test_state.delegation, delegation_req)) {
                get_delegation(delegation_req)
            } else {
                table::add(&mut test_state.delegation, delegation_req, true);
                DelegationResponse {
                    delegation_response: DelegationResponseInner {
                        delegation: Delegation {
                            delegator_address: delegator_addr,
                            validator_address: validator_addr,
                            shares: vector[]
                        },
                        balance: vector[],
                    },
                }
            };

        // update balance
        let (found, balance_index) = vector::find(
            &delegation.delegation_response.balance,
            |balance| {
                let Coin { denom: coin_denom, amount: _ } = *balance;
                coin_denom == denom
            },
        );
        if (!found) {
            balance_index = vector::length(&delegation.delegation_response.balance);
            vector::push_back(
                &mut delegation.delegation_response.balance, Coin { denom, amount: 0 }
            );
        };
        let balance = vector::borrow_mut(
            &mut delegation.delegation_response.balance, balance_index
        );
        balance.amount = balance.amount + amount;

        // update share
        let (found, share_index) = vector::find(
            &delegation.delegation_response.delegation.shares,
            |share| {
                let DecCoin { denom: coin_denom, amount: _ } = *share;
                coin_denom == denom
            },
        );
        if (!found) {
            share_index = vector::length(
                &delegation.delegation_response.delegation.shares
            );
            vector::push_back(
                &mut delegation.delegation_response.delegation.shares,
                DecCoin { denom, amount: decimal128::zero() },
            );
        };
        let share = vector::borrow_mut(
            &mut delegation.delegation_response.delegation.shares, share_index
        );
        share.amount = decimal128::add(
            &share.amount, &decimal128::from_ratio_u64(amount, 1)
        ); // TODO: support slashing cases

        // set delegation
        set_delegation(&delegation_req, &delegation);

        // get delegator delegations
        let delegator_delegations_req = DelegatorDelegationsRequest {
            delegator_addr,
            pagination: option::none()
        };
        let delegator_delegations =
            if (table::contains(
                    &test_state.delegator_delegations, delegator_delegations_req
                )) {
                get_delegator_delegations(delegator_delegations_req)
            } else {
                table::add(
                    &mut test_state.delegator_delegations, delegator_delegations_req, true
                );
                DelegatorDelegationsResponse {
                    delegation_responses: vector[],
                    pagination: option::none(),
                }
            };

        // update delegator delegations
        let (found, delegation_index) = vector::find(
            &delegator_delegations.delegation_responses,
            |delegation| {
                let DelegationResponseInner { delegation, balance: _ } = *delegation;
                let Delegation { delegator_address, validator_address, shares: _ } =
                    delegation;
                delegator_address == delegator_addr && validator_address == validator_addr
            },
        );

        if (found) {
            let old_delegation = vector::borrow_mut(
                &mut delegator_delegations.delegation_responses, delegation_index
            );
            *old_delegation = delegation.delegation_response;
        } else {
            vector::push_back(
                &mut delegator_delegations.delegation_responses,
                delegation.delegation_response,
            );
        };

        // set delegator delegations
        set_delegator_delegations(&delegator_delegations_req, &delegator_delegations);
    }

    fun undelegate_internal(
        account: &signer,
        validator_addr: String,
        metadata: Object<Metadata>,
        amount: u64,
        create_unbonding: bool
    ) acquires TestState {
        let test_state = borrow_global_mut<TestState>(@vip);
        let addr = signer::address_of(account);
        let delegator_addr = to_sdk(addr);
        let denom = coin::metadata_to_denom(metadata);

        // transfer asset to test account
        let test_account_addr = object::address_from_extend_ref(&test_state.extend_ref);
        coin::transfer(account, test_account_addr, metadata, amount);

        // get and update delegation
        let delegation_req = DelegationRequest { validator_addr, delegator_addr };
        assert!(table::contains(&test_state.delegation, delegation_req), 1);
        let delegation = get_delegation(delegation_req);

        // update balance
        let (found, balance_index) = vector::find(
            &delegation.delegation_response.balance,
            |balance| {
                let Coin { denom: coin_denom, amount: _ } = *balance;
                coin_denom == denom
            },
        );
        assert!(found, 1);
        let balance = vector::borrow_mut(
            &mut delegation.delegation_response.balance, balance_index
        );
        balance.amount = balance.amount - amount;
        if (balance.amount == 0) {
            vector::remove(&mut delegation.delegation_response.balance, balance_index);
        };

        // update share
        let (found, share_index) = vector::find(
            &delegation.delegation_response.delegation.shares,
            |share| {
                let DecCoin { denom: coin_denom, amount: _ } = *share;
                coin_denom == denom
            },
        );
        assert!(found, 1);
        let share = vector::borrow_mut(
            &mut delegation.delegation_response.delegation.shares, share_index
        );
        share.amount = decimal128::sub(
            &share.amount, &decimal128::from_ratio_u64(amount, 1)
        ); // TODO: support slashing cases
        if (share.amount == decimal128::zero()) {
            vector::remove<DecCoin>(
                &mut delegation.delegation_response.delegation.shares, share_index
            );
        };

        let delegation_deleted =
            if (vector::length(&mut delegation.delegation_response.delegation.shares) == 0) {
                table::remove(&mut test_state.delegation, delegation_req);
                unset_delegation(&delegation_req);
                true
            } else { false };

        // get delegator delegations
        let delegator_delegations_req = DelegatorDelegationsRequest {
            delegator_addr,
            pagination: option::none()
        };
        assert!(
            table::contains(&test_state.delegator_delegations, delegator_delegations_req),
            1,
        );
        let delegator_delegations = get_delegator_delegations(delegator_delegations_req);

        // update delegator delegations
        let (found, delegation_index) = vector::find(
            &delegator_delegations.delegation_responses,
            |delegation| {
                let DelegationResponseInner { delegation, balance: _ } = *delegation;
                let Delegation { delegator_address, validator_address, shares: _ } =
                    delegation;
                delegator_address == delegator_addr && validator_address == validator_addr
            },
        );

        assert!(found, 1);
        if (delegation_deleted) {
            vector::remove(
                &mut delegator_delegations.delegation_responses, delegation_index
            );
        } else {
            let old_delegation = vector::borrow_mut(
                &mut delegator_delegations.delegation_responses, delegation_index
            );
            *old_delegation = delegation.delegation_response;
        };

        if (vector::length(&delegator_delegations.delegation_responses) == 0) {
            table::remove(
                &mut test_state.delegator_delegations, delegator_delegations_req
            );
            unset_delegator_delegations(&delegator_delegations_req);
        } else {
            // set delegator delegations
            set_delegator_delegations(&delegator_delegations_req, &delegator_delegations);
        };

        // set unbonding
        if (create_unbonding) {
            let unbonding_delegation_req = UnbondingDelegationRequest {
                delegator_addr,
                validator_addr
            };
            let unbonding_delegation =
                if (table::contains(
                        &test_state.unbonding_delegation, unbonding_delegation_req
                    )) {
                    get_unbonding_delegation(unbonding_delegation_req)
                } else {
                    table::add(
                        &mut test_state.unbonding_delegation,
                        unbonding_delegation_req,
                        true,
                    );
                    UnbondingDelegationResponse {
                        unbond: UnbondingDelegation {
                            delegator_address: delegator_addr,
                            validator_address: validator_addr,
                            entries: vector[]
                        }
                    }
                };

            let (height, timestamp) = block::get_block_info();
            test_state.unbonding_id = test_state.unbonding_id + 1;
            let completion_time = timestamp + test_state.unbonding_period;

            table::add(
                &mut test_state.completion_time_to_unbonding,
                gen_key(completion_time, test_state.unbonding_id),
                unbonding_delegation_req,
            );

            let new_entry = UnbondingDelegationEntry {
                creation_height: height,
                completion_time: string::utf8(b""),
                initial_balance: vector[Coin { denom, amount }],
                balance: vector[Coin { denom, amount }],
                unbonding_id: test_state.unbonding_id,
                unbonding_on_hold_ref_count: 0,
            };

            vector::push_back(&mut unbonding_delegation.unbond.entries, new_entry);
            set_unbonding_delegation(&unbonding_delegation_req, &unbonding_delegation);
        }
    }

    fun set_delegation(req: &DelegationRequest, res: &DelegationResponse) {
        set_query_response(
            b"/initia.mstaking.v1.Query/Delegation",
            marshal(req),
            marshal(res),
        );
    }

    fun unset_delegation(req: &DelegationRequest) {
        set_query_response(
            b"/initia.mstaking.v1.Query/Delegation",
            marshal(req),
            vector[],
        );
    }

    fun set_unbonding_delegation(
        req: &UnbondingDelegationRequest, res: &UnbondingDelegationResponse
    ) {
        set_query_response(
            b"/initia.mstaking.v1.Query/UnbondingDelegation",
            marshal(req),
            marshal(res),
        );
    }

    fun unset_unbonding_delegation(req: &UnbondingDelegationRequest) {
        set_query_response(
            b"/initia.mstaking.v1.Query/UnbondingDelegation",
            marshal(req),
            vector[],
        );
    }

    fun set_redelegations(
        req: &RedelegationsRequest, res: &RedelegationsResponse
    ) {
        set_query_response(
            b"/initia.mstaking.v1.Query/Redelegations",
            marshal(req),
            marshal(res),
        );
    }

    fun unset_redelegations(req: &RedelegationsRequest) {
        set_query_response(
            b"/initia.mstaking.v1.Query/Redelegations",
            marshal(req),
            vector[],
        );
    }

    fun set_delegator_delegations(
        req: &DelegatorDelegationsRequest, res: &DelegatorDelegationsResponse
    ) {
        set_query_response(
            b"/initia.mstaking.v1.Query/DelegatorDelegations",
            marshal(req),
            marshal(res),
        );
    }

    fun unset_delegator_delegations(req: &DelegatorDelegationsRequest) {
        set_query_response(
            b"/initia.mstaking.v1.Query/DelegatorDelegations",
            marshal(req),
            vector[],
        );
    }

    fun set_pool(
        not_bonded_tokens: vector<Coin>,
        bonded_tokens: vector<Coin>,
        voting_power_weights: vector<DecCoin>
    ) {
        let req = PoolRequest {};

        let res = PoolResponse {
            pool: Pool { not_bonded_tokens, bonded_tokens, voting_power_weights, },
        };

        set_query_response(
            b"/initia.mstaking.v1.Query/Pool",
            marshal(&req),
            marshal(&res),
        );
    }

    fun get_delegation(req: DelegationRequest): DelegationResponse {
        let path = b"/initia.mstaking.v1.Query/Delegation";
        let response = query_stargate(path, marshal(&req));
        unmarshal<DelegationResponse>(response)
    }

    fun get_unbonding_delegation(req: UnbondingDelegationRequest): UnbondingDelegationResponse {
        let path = b"/initia.mstaking.v1.Query/UnbondingDelegation";
        let response = query_stargate(path, marshal(&req));
        unmarshal<UnbondingDelegationResponse>(response)
    }

    fun get_redelegations(req: RedelegationsRequest): RedelegationsResponse {
        let path = b"/initia.mstaking.v1.Query/Redelegations";
        let response = query_stargate(path, marshal(&req));
        unmarshal<RedelegationsResponse>(response)
    }

    fun get_delegator_delegations(req: DelegatorDelegationsRequest)
        : DelegatorDelegationsResponse {
        let path = b"/initia.mstaking.v1.Query/DelegatorDelegations";
        let response = query_stargate(path, marshal(&req));
        unmarshal<DelegatorDelegationsResponse>(response)
    }

    fun get_pool(): PoolResponse {
        let path = b"/initia.mstaking.v1.Query/Pool";
        let response = query_stargate(path, b"{}");
        unmarshal<PoolResponse>(response)
        // TODO: use below when json marshal fixed
        // query<PoolRequest, PoolResponse>(path, PoolRequest {})
    }

    fun gen_key(completion_time: u64, unbonding_id: u64): CompletionTimeKey {
        CompletionTimeKey {
            completion_time: initia_std::table_key::encode_u64(completion_time),
            unbonding_id: initia_std::table_key::encode_u64(unbonding_id),
        }
    }

    // query req/res types
    struct DelegatorDelegationsRequest has copy, drop, store {
        delegator_addr: String,
        pagination: Option<PageRequest>
    }

    struct DelegatorDelegationsResponse has copy, drop, store {
        delegation_responses: vector<DelegationResponseInner>,
        pagination: Option<PageResponse>,
    }

    struct PoolRequest has copy, drop, store {}

    struct PoolResponse has copy, drop, store {
        pool: Pool,
    }

    struct DelegationRequest has copy, drop, store {
        validator_addr: String,
        delegator_addr: String,
    }

    struct DelegationResponse has copy, drop, store {
        delegation_response: DelegationResponseInner
    }

    struct UnbondingDelegationRequest has copy, drop, store {
        delegator_addr: String,
        validator_addr: String,
    }

    struct UnbondingDelegationResponse has copy, drop, store {
        unbond: UnbondingDelegation,
    }

    // only allow single redelegation query
    struct RedelegationsRequest has copy, drop, store {
        delegator_addr: String,
        src_validator_addr: String,
        dst_validator_addr: String,
    }

    struct RedelegationsResponse has copy, drop, store {
        redelegation_responses: vector<RedelegationResponse>, // Always contains exactly one item, as only single redelegation queries are allowed
        pagination: Option<PageResponse>, // Always None, as only single redelegation queries are allowed
    }

    // cosmos types
    struct Pool has copy, drop, store {
        not_bonded_tokens: vector<Coin>,
        bonded_tokens: vector<Coin>,
        voting_power_weights: vector<DecCoin>,
    }

    struct PageRequest has copy, drop, store {
        key: Option<String>,
        offset: Option<u64>,
        limit: Option<u64>,
        count_total: Option<bool>,
        reverse: Option<bool>,
    }

    struct PageResponse has copy, drop, store {
        next_key: Option<String>,
        total: Option<u64>,
    }

    struct DelegationResponseInner has copy, drop, store {
        delegation: Delegation,
        balance: vector<Coin>
    }

    struct Delegation has copy, drop, store {
        delegator_address: String,
        validator_address: String,
        shares: vector<DecCoin>
    }

    struct Coin has copy, drop, store {
        denom: String,
        amount: u64,
    }

    struct DecCoin has copy, drop, store {
        denom: String,
        amount: Decimal128,
    }

    struct UnbondingDelegation has copy, drop, store {
        delegator_address: String,
        validator_address: String,
        entries: vector<UnbondingDelegationEntry>
    }

    struct UnbondingDelegationEntry has copy, drop, store {
        creation_height: u64,
        completion_time: String,
        initial_balance: vector<Coin>,
        balance: vector<Coin>,
        unbonding_id: u64,
        unbonding_on_hold_ref_count: u64,
    }

    struct RedelegationResponse has copy, drop, store {
        redelegation: Redelegation,
        entries: vector<RedelegationEntryResponse>,
    }

    struct Redelegation has copy, drop, store {
        delegator_address: String,
        validator_src_address: String,
        validator_dst_address: String,
        entries: Option<vector<RedelegationEntry>>, // Always None for query response
    }

    struct RedelegationEntry has copy, drop, store {
        creation_height: u32,
        completion_time: String,
        initial_balance: vector<Coin>,
        shares_dst: vector<DecCoin>,
        unbonding_id: u32,
    }

    struct RedelegationEntryResponse has copy, drop, store {
        redelegation_entry: RedelegationEntry,
        balance: vector<Coin>,
    }
}
