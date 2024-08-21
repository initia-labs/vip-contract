#[test_only] 
module vip::mstaking_mock {
    use std::vector;
    use initia_std::json::{marshal, unmarshal};
    use initia_std::decimal128::Decimal128;
    use initia_std::option::{Self, Option};
    use initia_std::string::{Self, String};
    use initia_std::query::set_query_response;
    use initia_std::query::query_stargate;
    use initia_std::table::Table;

    struct TestState {
        delegations: Table<DelegationRequest, bool> //
    }

    public fun init_module(vip: &signer) {
        set_pool(vector[], vector[], vector[]);
    }

    public fun update_voting_power_weights(denoms: vector<String>, weights: vector<Decimal128>) {
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

    fun set_delegation(validator_addr: String, delegator_addr: String, shares: vector<DecCoin>, balance: vector<Coin>) {
        let req = DelegationRequest { validator_addr, delegator_addr };
        let res = DelegationResponse { 
            delegation_response: DelegationResponseInner {
                delegation: Delegation {
                    delegator_address: delegator_addr,
                    validator_address: validator_addr,
                    shares,
                },
                balance,
            }
        };

        set_query_response(
            b"/initia.mstaking.v1.Query/Delegation",
            marshal(&req),
            marshal(&res)
        );
    }

    fun set_unbonding_delegation(validator_addr: String, delegator_addr: String, entries: vector<UnbondingDelegationEntry>) {
        let req = UnbondingDelegationRequest { validator_addr, delegator_addr };
        let res = UnbondingDelegationResponse { 
            unbond: UnbondingDelegation {
                delegator_address: delegator_addr,
                validator_address: validator_addr,
                entries,
            }
        };

        set_query_response(
            b"/initia.mstaking.v1.Query/UnbondingDelegation",
            marshal(&req),
            marshal(&res)
        );
    }

    fun set_redelegations(src_validator_addr: String, dst_validator_addr: String, delegator_addr: String, entries: vector<RedelegationEntryResponse>) {
        let req = RedelegationsRequest { src_validator_addr, dst_validator_addr, delegator_addr };
        let res = RedelegationsResponse {
            redelegation_responses: vector [
                RedelegationResponse {
                    redelegation: Redelegation {
                        delegator_address: delegator_addr,
                        validator_src_address: src_validator_addr,
                        validator_dst_address: dst_validator_addr,
                        entries: option::none(),
                    },
                    entries,
                }
            ],
            pagination: option::none()
        };

        set_query_response(
            b"/initia.mstaking.v1.Query/Redelegations",
            marshal(&req),
            marshal(&res)
        );
    }

    fun set_delegator_delegations(delegator_addr: String, delegation_responses: vector<DelegationResponseInner>) {
        let req = DelegatorDelegationsRequest {
            delegator_addr,
            pagination: option::none(), // impossible to make mock query that support pagination
        };

        let res = DelegatorDelegationsResponse {
            delegation_responses,
            pagination: option::none(), // impossible to make mock query that support pagination
        };

        set_query_response(
            b"/initia.mstaking.v1.Query/DelegatorDelegations",
            marshal(&req),
            marshal(&res)
        );
    }

    fun set_pool(not_bonded_tokens: vector<Coin>, bonded_tokens: vector<Coin>, voting_power_weights: vector<DecCoin>) {
        let req = PoolRequest {};

        let res = PoolResponse {
            pool: Pool {
                not_bonded_tokens,
                bonded_tokens,
                voting_power_weights,
            },
        };

        set_query_response(
            b"/initia.mstaking.v1.Query/Pool",
            marshal(&req),
            marshal(&res)
        );
    }

    fun get_pool(): PoolResponse {
        let path = b"/initia.mstaking.v1.Query/Pool";
        let response = query_stargate(path, b"{}");
        unmarshal<PoolResponse>(response)
        // TODO: use below when json marshal fixed
        // query<PoolRequest, PoolResponse>(path, PoolRequest {}) 
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