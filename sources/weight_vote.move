module vip::weight_vote {
    use std::error;
    use std::signer;
    use std::vector;
    use std::option::{Self, Option};

    use initia_std::block::get_block_info;
    use initia_std::coin;
    use initia_std::decimal128::{Self, Decimal128};
    use initia_std::decimal256::{Self, Decimal256};
    use initia_std::event;
    use initia_std::fungible_asset::Metadata;
    use initia_std::object::Object;
    use initia_std::simple_map;
    use initia_std::table::{Self, Table};
    use initia_std::table_key;

    use vip::vip;
    use vip::utils;
    use vip::lock_staking;

    //
    // Errors
    //

    const EMODULE_STORE_ALREADY_EXISTS: u64 = 1;
    const EINVALID_MERKLE_PROOFS: u64 = 2;
    const EINVALID_PROOF_LENGTH: u64 = 3;
    const ECYCLE_NOT_FOUND: u64 = 4;
    const EVECTOR_LENGTH: u64 = 5;
    const EVOTING_END: u64 = 6;
    const ECYCLE_NOT_END: u64 = 7;
    const EUNAUTHORIZED: u64 = 8;
    const ECANNOT_CREATE_CHALLENGE_PROPOSAL: u64 = 9;
    const EVOTE_NOT_FOUND: u64 = 10;
    const EPROPOSAL_IN_PROGRESS: u64 = 11;
    const EPROPOSAL_ALREADY_EXECUTED: u64 = 12;
    const EBRIDGE_NOT_FOUND: u64 = 13;
    const ECHALLENGE_NOT_FOUND: u64 = 14;
    const ECHALLENGE_IN_PROGRESS: u64 = 15;
    const ECHALLENGE_ALREADY_EXECUTED: u64 = 16;
    const EINVALID_PARAMETER: u64 = 17;
    const EINVALID_BRIDGE: u64 = 18;
    const ENOT_FOUND: u64 = 101;
    //
    //  Constants
    //

    const PROOF_LENGTH: u64 = 32;

    const VOTE_YES: u64 = 1;
    const VOTE_NO: u64 = 0;

    struct ModuleStore has key {
        // current cycle
        current_cycle: u64,
        // cycle interval
        cycle_interval: u64,
        // current cycle start timestamp
        cycle_start_timestamp: u64,
        // current cycle end timestamp
        cycle_end_timestamp: u64,
        // change bridge weights proposals
        proposals: Table<vector<u8> /* cycle */, Proposal>,
        // voting period
        voting_period: u64,
        // pair weight
        pair_weights: Table<Object<Metadata>, Decimal128>,
    }

    struct Proposal has store {
        votes: Table<address, WeightVote>,
        total_tally: u64,
        tally: Table<vector<u8> /* bridge id */, u64 /* tally */ >,
        voting_end_time: u64,
        executed: bool,
    }

    struct WeightVote has store {
        voting_power: u64,
        weights: vector<Weight>
    }

    struct Weight has copy, drop, store {
        bridge_id: u64,
        weight: Decimal128,
    }

    struct Vote has store {
        vote_option: bool,
        voting_power: u64,
    }

    //
    // responses
    //

    struct ModuleResponse has drop {
        current_cycle: u64,
        cycle_start_timestamp: u64,
        cycle_end_timestamp: u64,
        cycle_interval: u64,
        voting_period: u64,
    }

    struct ProposalResponse has drop {
        total_tally: u64,
        voting_end_time: u64,
        executed: bool,
    }

    struct WeightVoteResponse has drop {
        voting_power: u64,
        weights: vector<Weight>,
    }

    struct TallyResponse has drop {
        bridge_id: u64,
        tally: u64
    }

    // events

    #[event]
    struct VoteEvent has drop, store {
        account: address,
        cycle: u64,
        voting_power: u64,
        weights: vector<Weight>,
    }

    #[event]
    struct ExecuteProposalEvent has drop, store {
        cycle: u64,
        bridge_ids: vector<u64>,
        weights: vector<Decimal256>,
    }

    // initialize function

    public entry fun initialize(
        chain: &signer,
        cycle_start_timestamp: u64,
        cycle_interval: u64,
        voting_period: u64,
    ) {
        assert!(
            signer::address_of(chain) == @vip,
            error::permission_denied(EUNAUTHORIZED),
        );
        assert!(
            !exists<ModuleStore>(@vip),
            error::already_exists(EMODULE_STORE_ALREADY_EXISTS),
        );

        move_to(
            chain,
            ModuleStore {
                current_cycle: 0,
                cycle_interval,
                cycle_start_timestamp,
                cycle_end_timestamp: cycle_start_timestamp,
                proposals: table::new(),
                voting_period,
                pair_weights: table::new(),
            },
        )
    }

    public entry fun update_params(
        chain: &signer,
        cycle_interval: Option<u64>,
        voting_period: Option<u64>,
    ) acquires ModuleStore {
        utils::check_chain_permission(chain);
        let module_store = borrow_global_mut<ModuleStore>(@vip);

        if (option::is_some(&cycle_interval)) {
            module_store.cycle_interval = option::extract(&mut cycle_interval);
        };

        if (option::is_some(&voting_period)) {
            module_store.voting_period = option::extract(&mut voting_period);
        };

        // voting period must be less than cycle interval
        assert!(
            module_store.voting_period < module_store.cycle_interval,
            error::invalid_argument(EINVALID_PARAMETER),
        );
    }

    //
    // entry functions
    //

    // weight vote

    public entry fun vote(
        account: &signer,
        cycle: u64,
        bridge_ids: vector<u64>,
        weights: vector<Decimal128>,
    ) acquires ModuleStore {
        create_proposal();
        let addr = signer::address_of(account);
        let max_voting_power = calculate_voting_power(addr);
        let module_store = borrow_global_mut<ModuleStore>(@vip);
        let (_, timestamp) = get_block_info();

        // check bridge valid
        vector::for_each(
            bridge_ids,
            |bridge_id| {
                assert!(
                    vip::is_registered(bridge_id),
                    error::invalid_argument(EINVALID_BRIDGE),
                );
            },
        );
        let weight_sum = decimal128::new(0);
        vector::for_each_ref(
            &weights,
            |weight| {
                weight_sum = decimal128::add(&weight_sum, weight);
            },
        );
        assert!(
            decimal128::val(&weight_sum) <= decimal128::val(&decimal128::one()),
            error::invalid_argument(EINVALID_PARAMETER),
        );
        let voting_power_used = decimal128::mul_u64(&weight_sum, max_voting_power);
        // check vote condition
        let cycle_key = table_key::encode_u64(cycle);
        assert!(
            table::contains(&module_store.proposals, cycle_key),
            error::not_found(ECYCLE_NOT_FOUND),
        );
        let proposal = table::borrow_mut(
            &mut module_store.proposals,
            cycle_key
        );
        assert!(
            timestamp < proposal.voting_end_time,
            error::invalid_state(EVOTING_END),
        );

        // remove former vote
        if (table::contains(&proposal.votes, addr)) {
            let WeightVote {voting_power: _, weights} = table::remove(&mut proposal.votes, addr);
            remove_vote(proposal, max_voting_power, weights);
        };

        let weight_vector = vector[];
        vector::zip_reverse(
            bridge_ids,
            weights,
            |bridge_id, weight| {
                vector::push_back(
                    &mut weight_vector,
                    Weight {
                        bridge_id: bridge_id,
                        weight: weight,
                    },
                );
            },
        );

        // apply vote
        apply_vote(
            proposal,
            max_voting_power,
            weight_vector,
        );

        // store user votes
        table::add(
            &mut proposal.votes,
            addr,
            WeightVote {
                voting_power: voting_power_used,
                weights: weight_vector
            },
        );

        // emit event
        event::emit(
            VoteEvent {
                account: addr,
                cycle,
                voting_power: voting_power_used, //TODO: max voting power
                weights: weight_vector,
            },
        )
    }

    // it will be executed by agent; but there is no permission to execute proposal
    public entry fun execute_proposal() acquires ModuleStore {
        let module_store = borrow_global_mut<ModuleStore>(@vip);
        let (_, timestamp) = get_block_info();

        // get the last voting proposal
        // check vote state
        let proposal = table::borrow_mut(
            &mut module_store.proposals,
            table_key::encode_u64(module_store.current_cycle),
        );
        assert!(
            proposal.voting_end_time < timestamp,
            error::invalid_state(EPROPOSAL_IN_PROGRESS),
        );
        assert!(
            !proposal.executed,
            error::invalid_state(EPROPOSAL_ALREADY_EXECUTED),
        );

        execute_proposal_internal(
            proposal,
            module_store.current_cycle
        );
    }

    fun execute_proposal_internal(
        proposal: &mut Proposal,
        current_cycle: u64
    ) {
        // update vip weights
        let bridge_ids = vip::get_whitelisted_bridge_ids();

        let index = 0;
        let len = vector::length(&bridge_ids);
        let weights: vector<Decimal256> = vector[];
        while (index < len) {
            let bridge_id = *vector::borrow(&bridge_ids, index);
            let tally = table::borrow_with_default(
                &proposal.tally,
                table_key::encode_u64(bridge_id),
                &0,
            );
            let weight = if (proposal.total_tally == 0) {
                decimal256::from_ratio(1,(len as u256))
            } else {
                decimal256::from_ratio(
                    (*tally as u256),
                    (proposal.total_tally as u256),
                )
            };
            vector::push_back(&mut weights, weight);
            index = index + 1;
        };

        vip::update_vip_weights_for_friend(bridge_ids, weights);

        // emit event
        event::emit(
            ExecuteProposalEvent {
                cycle: current_cycle,
                bridge_ids,
                weights,
            },
        );

        // update proposal state
        proposal.executed = true;
    }

    // helper functions
    fun last_finalized_proposal(
        module_store: &ModuleStore,
        timestamp: u64
    ): (u64, &Proposal) {
        let iter = table::iter(
            &module_store.proposals,
            option::none(),
            option::none(),
            2,
        );
        assert!(
            table::prepare<vector<u8>, Proposal>(iter),
            error::not_found(ECYCLE_NOT_FOUND),
        );
        let (cycle_key, proposal) = table::next<vector<u8>, Proposal>(iter);

        // if last proposal is in progress, use former proposal
        if (proposal.voting_end_time > timestamp) {
            assert!(
                table::prepare<vector<u8>, Proposal>(iter),
                error::not_found(ECYCLE_NOT_FOUND),
            );
            (cycle_key, _) = table::next<vector<u8>, Proposal>(iter);
        };

        let last_finalized_proposal_cycle = table_key::decode_u64(cycle_key);
        let last_finalized_proposal = table::borrow(&module_store.proposals, cycle_key);
        (
            last_finalized_proposal_cycle,
            last_finalized_proposal
        )
    }

    // weight vote

    fun remove_vote(
        proposal: &mut Proposal,
        max_voting_power: u64,
        weights: vector<Weight>
    ) {
        let voting_power_removed = 0;
        vector::for_each(
            weights,
            |w| {
                use_weight(w);
                let bridge_vp = decimal128::mul_u64(&w.weight, max_voting_power);
                voting_power_removed = voting_power_removed + bridge_vp;
                let tally = table::borrow_mut_with_default(
                    &mut proposal.tally,
                    table_key::encode_u64(w.bridge_id),
                    0,
                );
                *tally = *tally - (bridge_vp as u64);
            },
        );
        proposal.total_tally = proposal.total_tally - voting_power_removed;

    }

    fun apply_vote(
        proposal: &mut Proposal,
        max_voting_power: u64,
        weights: vector<Weight>
    ) {
        let voting_power_used = 0;
        vector::for_each(
            weights,
            |w| {
                use_weight(w);
                let bridge_vp = decimal128::mul_u64(&w.weight, max_voting_power);
                voting_power_used = voting_power_used + bridge_vp;
                let tally = table::borrow_mut_with_default(
                    &mut proposal.tally,
                    table_key::encode_u64(w.bridge_id),
                    0,
                );
                *tally = *tally + (bridge_vp as u64);
            },
        );
        proposal.total_tally = proposal.total_tally + voting_power_used

    }

    // if submitter submit merkle root after grace period, set voting end time to current timestamp + voting period
    // else set it to former cycle end time + grace period + voting period
    fun calculate_voting_end_time(module_store: &ModuleStore): u64 {
        module_store.cycle_end_timestamp + module_store.voting_period
    }

    fun calculate_voting_power(addr: address): u64 acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let cosmos_voting_power = utils::get_customized_voting_power(
            addr,
            |metadata, voting_power| {
                let weight = table::borrow_with_default(
                    &module_store.pair_weights,
                    metadata,
                    &decimal128::one()
                );
                decimal128::mul_u64(weight, voting_power)
            }
        );

        // TODO: adjust lock period
        let lock_staking_voting_power = 0;
        let locked_delegations = lock_staking::get_locked_delegations(addr);
        let weight_map = utils::get_weight_map();
        vector::for_each_ref(
            &locked_delegations,
            |delegation| {
                let (metadata, _, amount, _) = lock_staking::unpack_locked_delegation(
                    delegation
                );
                let denom = coin::metadata_to_denom(metadata);
                let voting_power_weight = simple_map::borrow(&weight_map, &denom);
                let voting_power = decimal128::mul_u64(voting_power_weight, amount);
                let pair_weight = table::borrow_with_default(
                    &module_store.pair_weights,
                    metadata,
                    &decimal128::one()
                );
                lock_staking_voting_power = lock_staking_voting_power + decimal128::mul_u64(
                    pair_weight, voting_power
                );
            }
        );

        // TODO: add vesting

        cosmos_voting_power + lock_staking_voting_power
    }

    fun create_proposal() acquires ModuleStore {
        let module_store = borrow_global_mut<ModuleStore>(@vip);
        let (_, timestamp) = get_block_info();

        // cycle not end
        if (module_store.cycle_end_timestamp >= timestamp) {
             return
        };

        // get the last voted proposal
        // execute proposal not executed
        if (module_store.current_cycle != 0) {
            let proposal = table::borrow_mut(
                &mut module_store.proposals,
                table_key::encode_u64(module_store.current_cycle),
            );
            if (!proposal.executed && proposal.voting_end_time < timestamp) {
                execute_proposal_internal(
                    proposal,
                    module_store.current_cycle,
                );
            };
        };

        let voting_end_time = calculate_voting_end_time(module_store);

        // update cycle
        module_store.current_cycle = module_store.current_cycle + 1;

        // To handle case that proposal not create more than one cycle period
        // set cycle start time to former cycle end time + skipped cycle count * cycle interval
        if (voting_end_time > module_store.cycle_end_timestamp) {
            let skipped_cycle_count = (
                voting_end_time - module_store.cycle_end_timestamp
            ) / module_store.cycle_interval;
            module_store.cycle_start_timestamp = module_store.cycle_end_timestamp + skipped_cycle_count
                * module_store.cycle_interval;
        };

        // set cycle end time
        module_store.cycle_end_timestamp = module_store.cycle_start_timestamp + module_store
            .cycle_interval;

        // initiate weight vote
        table::add(
            &mut module_store.proposals,
            table_key::encode_u64(module_store.current_cycle),
            Proposal {
                votes: table::new(),
                total_tally: 0,
                tally: table::new(),
                voting_end_time,
                executed: false,
            },
        );
    }

    //
    // views
    //

    #[view]
    public fun get_module_store(): ModuleResponse acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);

        ModuleResponse {
            current_cycle: module_store.current_cycle,
            cycle_start_timestamp: module_store.cycle_start_timestamp,
            cycle_end_timestamp: module_store.cycle_end_timestamp,
            cycle_interval: module_store.cycle_interval,
            voting_period: module_store.voting_period,
        }
    }

    #[view]
    public fun get_total_tally(cycle: u64): u64 acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let cycle_key = table_key::encode_u64(cycle);
        assert!(
            table::contains(&module_store.proposals, cycle_key),
            error::not_found(ECYCLE_NOT_FOUND),
        );
        let proposal = table::borrow(&module_store.proposals, cycle_key);
        proposal.total_tally
    }

    #[view]
    public fun get_tally(cycle: u64, bridge_id: u64): u64 acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let cycle_key = table_key::encode_u64(cycle);
        assert!(
            table::contains(&module_store.proposals, cycle_key),
            error::not_found(ECYCLE_NOT_FOUND),
        );
        let proposal = table::borrow(&module_store.proposals, cycle_key);
        *table::borrow_with_default(
            &proposal.tally,
            table_key::encode_u64(bridge_id),
            &0,
        )
    }

    #[view]
    public fun get_tally_infos(cycle: u64): vector<TallyResponse> acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let cycle_key = table_key::encode_u64(cycle);
        assert!(
            table::contains(&module_store.proposals, cycle_key),
            error::not_found(ECYCLE_NOT_FOUND),
        );
        let proposal = table::borrow(&module_store.proposals, cycle_key);

        let tally_responses: vector<TallyResponse> = vector[];

        let bridge_ids = vip::get_whitelisted_bridge_ids();

        vector::for_each(
            bridge_ids,
            |bridge_id| {
                let tally = table::borrow_with_default(
                    &proposal.tally,
                    table_key::encode_u64(bridge_id),
                    &0,
                );
                vector::push_back(
                    &mut tally_responses,
                    TallyResponse {bridge_id, tally: *tally},
                )
            },
        );

        return tally_responses

    }

    #[view]
    public fun get_proposal(cycle: u64): ProposalResponse acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let cycle_key = table_key::encode_u64(cycle);
        assert!(
            table::contains(&module_store.proposals, cycle_key),
            error::not_found(ECYCLE_NOT_FOUND),
        );
        let proposal = table::borrow(&module_store.proposals, cycle_key);

        ProposalResponse {
            total_tally: proposal.total_tally,
            voting_end_time: proposal.voting_end_time,
            executed: proposal.executed,
        }
    }

    #[view]
    public fun get_weight_vote(cycle: u64, user: address): WeightVoteResponse acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let cycle_key = table_key::encode_u64(cycle);
        assert!(
            table::contains(&module_store.proposals, cycle_key),
            error::not_found(ECYCLE_NOT_FOUND),
        );
        let proposal = table::borrow(&module_store.proposals, cycle_key);
        let vote = table::borrow(&proposal.votes, user);

        WeightVoteResponse {
            voting_power: vote.voting_power,
            weights: vote.weights,
        }
    }

    inline fun use_weight(_v: Weight) {
    }

    // #[test_only]
    // use initia_std::block::set_block_info;

    // #[test_only]
    // use initia_std::coin;
    // #[test_only]
    // use initia_std::string;

    // #[test_only]
    // use initia_std::block;
    // #[test_only]
    // const DEFAULT_VIP_L2_CONTRACT_FOR_TEST: vector<u8> = (b"vip_l2_contract");

    // #[test_only]
    // fun skip_period(period: u64) {
    //     let (height, curr_time) = block::get_block_info();
    //     block::set_block_info(height, curr_time + period);
    // }

    // #[test_only]
    // fun init_test(chain: &signer, vip: &signer): coin::MintCapability {
    //     initialize(
    //         vip,
    //         @0x2,
    //         100,
    //         100,
    //         10,
    //         50,
    //         1,
    //         100,
    //         decimal128::from_ratio(3, 10),
    //         100,
    //     );
    //     set_block_info(100, 101);
    //     primary_fungible_store::init_module_for_test();
    //     let (mint_cap, _, _) =
    //         coin::initialize(
    //             chain,
    //             option::none(),
    //             string::utf8(b"uinit"),
    //             string::utf8(b"uinit"),
    //             6,
    //             string::utf8(b""),
    //             string::utf8(b""),
    //         );
    //     vip::init_module_for_test(vip);
    //     vip::register(
    //         vip,
    //         @0x2,
    //         1,
    //         @0x12,
    //         string::utf8(DEFAULT_VIP_L2_CONTRACT_FOR_TEST),
    //         decimal256::zero(),
    //         decimal256::zero(),
    //         decimal256::zero(),
    //     );
    //     vip::register(
    //         vip,
    //         @0x2,
    //         2,
    //         @0x12,
    //         string::utf8(DEFAULT_VIP_L2_CONTRACT_FOR_TEST),
    //         decimal256::zero(),
    //         decimal256::zero(),
    //         decimal256::zero(),
    //     );
    //     mint_cap
    // }

    // #[test_only]
    // fun get_merkle_root(tree: vector<vector<vector<u8>>>): vector<u8> {
    //     let len = vector::length(&tree);
    //     *vector::borrow(vector::borrow(&tree, len - 1), 0)
    // }

    // #[test_only]
    // fun get_proofs(
    //     tree: vector<vector<vector<u8>>>, idx: u64
    // ): vector<vector<u8>> {
    //     let len = vector::length(&tree);
    //     let i = 0;
    //     let proofs = vector[];
    //     while (i < len - 1) {
    //         let leaves = vector::borrow(&tree, i);
    //         let leaf =
    //             if (idx % 2 == 1) {
    //                 *vector::borrow(leaves, idx - 1)
    //             } else {
    //                 *vector::borrow(leaves, idx + 1)
    //             };
    //         vector::push_back(&mut proofs, leaf);
    //         idx = idx / 2;
    //         i = i + 1;
    //     };

    //     proofs
    // }

    // #[test(chain = @0x1, vip = @vip, submitter = @0x2, u1 = @0x101, u2 = @0x102, u3 = @0x103, u4 = @0x104)]
    // fun proposal_end_to_end(
    //     chain: &signer,
    //     vip: &signer,
    //     submitter: &signer,
    //     u1: &signer,
    //     u2: &signer,
    //     u3: &signer,
    //     u4: &signer,
    // ) acquires ModuleStore {
    //     init_test(chain, vip);
    //     let addresses = vector[
    //         signer::address_of(u1),
    //         signer::address_of(u2),
    //         signer::address_of(u3),
    //         signer::address_of(u4),];
    //     let voting_powers = vector[10, 20, 30, 40];
    //     let cycle = 1;
    //     let tree = create_merkle_tree(cycle, addresses, voting_powers);
    //     let merkle_root = get_merkle_root(tree);

    //     submit_snapshot(
    //         submitter,
    //         merkle_root,
    //         string::utf8(b"https://abc.com"),
    //         100,
    //     );
    //     vote(
    //         u1,
    //         cycle,
    //         get_proofs(tree, 0),
    //         10,
    //         vector[1, 2],
    //         vector[decimal128::from_ratio(1, 5), decimal128::from_ratio(4, 5)], // 2, 8
    //     );

    //     vote(
    //         u2,
    //         cycle,
    //         get_proofs(tree, 1),
    //         20,
    //         vector[1, 2],
    //         vector[decimal128::from_ratio(2, 5), decimal128::from_ratio(3, 5)], // 8, 12
    //     );

    //     vote(
    //         u3,
    //         cycle,
    //         get_proofs(tree, 2),
    //         30,
    //         vector[1, 2],
    //         vector[decimal128::from_ratio(2, 5), decimal128::from_ratio(2, 5)], // 12, 12
    //     );

    //     vote(
    //         u4,
    //         cycle,
    //         get_proofs(tree, 3),
    //         40,
    //         vector[1, 2],
    //         vector[decimal128::from_ratio(3, 5), decimal128::from_ratio(1, 5)], // 24, 8 // user can vote with
    //     );

    //     let proposal = get_proposal(1);
    //     assert!(proposal.total_tally == 86, 0);
    //     let vote1 = get_tally(1, 1);
    //     let vote2 = get_tally(1, 2);
    //     let total_tally = get_total_tally(1);
    //     assert!(vote1 == 46, 1);
    //     assert!(vote2 == 40, 2);
    //     assert!(total_tally == 86, 3);

    //     let weight_vote = get_weight_vote(1, signer::address_of(u1));
    //     assert!(weight_vote.voting_power == 10, 4);
    //     assert!(
    //         vector::length(&weight_vote.weights) == 2, 5
    //     );
    //     // update vote of u4
    //     vote(
    //         u4,
    //         cycle,
    //         get_proofs(tree, 3),
    //         40,
    //         vector[1, 2],
    //         vector[decimal128::from_ratio(4, 5), decimal128::from_ratio(1, 5)], // 32, 8 // user can vote with
    //     );

    //     vote1 = get_tally(1, 1);
    //     vote2 = get_tally(1, 2);
    //     total_tally = get_total_tally(1);
    //     assert!(vote1 == 54, 6);
    //     assert!(vote2 == 40, 7);
    //     assert!(total_tally == 94, 8);

    //     // update vote of u3
    //     vote(
    //         u3,
    //         cycle,
    //         get_proofs(tree, 2),
    //         30,
    //         vector[1, 2],
    //         vector[decimal128::zero(), decimal128::zero()], // 0, 0
    //     );

    //     vote1 = get_tally(1, 1);
    //     vote2 = get_tally(1, 2);
    //     total_tally = get_total_tally(1);
    //     assert!(vote1 == 42, 9);
    //     assert!(vote2 == 28, 10);
    //     assert!(total_tally == 70, 11);
    //     let weight_vote = get_weight_vote(1, signer::address_of(u1));
    //     assert!(weight_vote.voting_power == 10, 12);
    //     assert!(
    //         vector::length(&weight_vote.weights) == 2, 13
    //     );

    //     skip_period(60);
    //     execute_proposal();
    // }

    // #[test(chain = @0x1, vip = @vip, submitter = @0x2, u1 = @0x101, u2 = @0x102, u3 = @0x103, u4 = @0x104)]
    // fun challenge_end_to_end(
    //     chain: &signer,
    //     vip: &signer,
    //     submitter: &signer,
    //     u1: &signer,
    //     u2: &signer,
    //     u3: &signer,
    //     u4: &signer,
    // ) acquires ModuleStore {
    //     // fund
    //     let mint_cap = init_test(chain, vip);
    //     coin::mint_to(
    //         &mint_cap,
    //         signer::address_of(u1),
    //         100,
    //     );
    //     coin::mint_to(
    //         &mint_cap,
    //         signer::address_of(u2),
    //         100,
    //     );

    //     // submit root
    //     let cycle = 1;
    //     let addresses = vector[
    //         signer::address_of(u1),
    //         signer::address_of(u2),
    //         signer::address_of(u3),
    //         signer::address_of(u4),];
    //     let voting_powers = vector[10, 20, 30, 40];
    //     let tree = create_merkle_tree(cycle, addresses, voting_powers);
    //     let merkle_root = get_merkle_root(tree);
    //     submit_snapshot(
    //         submitter,
    //         merkle_root,
    //         string::utf8(b"https://abc.com"),
    //         100,
    //     );
    //     // votes
    //     vote(
    //         u1,
    //         cycle,
    //         get_proofs(tree, 0),
    //         10,
    //         vector[1, 2],
    //         vector[decimal128::from_ratio(1, 5), decimal128::from_ratio(4, 5)], // 2, 8
    //     );

    //     vote(
    //         u2,
    //         cycle,
    //         get_proofs(tree, 1),
    //         20,
    //         vector[1, 2],
    //         vector[decimal128::from_ratio(2, 5), decimal128::from_ratio(3, 5)], // 8, 12
    //     );

    //     // execute
    //     skip_period(60); // skip voting period(60)
    //     execute_proposal();

    //     // after grace period
    //     skip_period(50); // skip voting period(50)

    //     // create challenge
    //     let voting_powers = vector[15, 25, 35, 45];
    //     let tree = create_merkle_tree(cycle, addresses, voting_powers);
    //     create_challenge(
    //         u1,
    //         string::utf8(b"challenge"),
    //         string::utf8(b"challenge"),
    //         get_merkle_root(tree),
    //         string::utf8(b"https://abc2.com"),
    //         100u64,
    //     );

    //     // vote proposal
    //     vote_challenge(u1, 1, true);

    //     // after min_voting_period
    //     skip_period(10);

    //     // execute challenge
    //     execute_challenge(1);

    //     let module_response = get_module_store();
    //     let vote = get_proposal(2);

    //     assert!(module_response.current_cycle == 2, 1);
    //     assert!(
    //         module_response.submitter == signer::address_of(u1),
    //         2,
    //     );
    //     assert!(
    //         vote.merkle_root == get_merkle_root(tree), 3
    //     );
    //     assert!(
    //         vote.api_uri == string::utf8(b"https://abc2.com"),
    //         4,
    //     );

    //     set_block_info(100, 251);

    //     // create challenge
    //     let voting_powers = vector[10, 25, 35, 45];
    //     let tree = create_merkle_tree(cycle, addresses, voting_powers);
    //     create_challenge(
    //         u2,
    //         string::utf8(b"challenge"),
    //         string::utf8(b"challenge"),
    //         get_merkle_root(tree),
    //         string::utf8(b"https://abc3.com"),
    //         100u64,
    //     );

    //     // vote proposal
    //     vote_challenge(u2, 2, true);

    //     // after min_voting_period
    //     skip_period(10);

    //     // execute proposal
    //     execute_challenge(2);

    //     module_response = get_module_store();
    //     vote = get_proposal(2);

    //     assert!(module_response.current_cycle == 2, 5);
    //     assert!(
    //         module_response.submitter == signer::address_of(u2),
    //         6,
    //     );
    //     assert!(
    //         vote.merkle_root == get_merkle_root(tree), 7
    //     );
    //     assert!(
    //         vote.api_uri == string::utf8(b"https://abc3.com"),
    //         8,
    //     );

    //     let challenge = get_challenge(2);
    //     assert!(
    //         challenge.title == string::utf8(b"challenge"),
    //         9,
    //     );
    //     assert!(
    //         challenge.summary == string::utf8(b"challenge"),
    //         10,
    //     );
    //     assert!(
    //         challenge.api_uri == string::utf8(b"https://abc3.com"),
    //         11,
    //     );
    //     assert!(challenge.cycle == 2, 12);
    //     assert!(challenge.yes_tally == 20, 13);
    //     assert!(challenge.no_tally == 0, 14);
    //     assert!(challenge.quorum == 9, 15);
    //     assert!(challenge.is_executed == true, 16);
    // }
}
