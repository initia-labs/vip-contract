module vip::tvl_manager {
    use std::error;
    use initia_std::vector;
    use initia_std::table_key;
    use initia_std::table;
    use initia_std::block;
    use initia_std::option;

    use vip::utils;
    friend vip::vip;
    const EINVALID_STAGE: u64 = 1;
    const EINVALID_BRIDGE_ID: u64 = 2;

    struct ModuleStore has key {
        // The average tvl each stage(vip stage) and bridge id
        snapshots: table::Table<vector<u8> /*stage + bridge_id + timestamp*/, u64 /*tvl captured*/>,
        summary: table::Table<vector<u8> /*stage + bridge id*/, TvlSummary>,
    }
    struct TvlSummary has drop, store, copy{
        count: u64, // snapshot count 
        tvl: u64,
    }
    struct TVLSnapshotResponse has drop, store {
        time: u64,
        tvl: u64,
    }

    fun init_module(chain: &signer) {
        move_to(
            chain,
            ModuleStore {
                snapshots: table::new<vector<u8> /*stage + bridge_id + timestamp*/, u64 /*tvl captured*/>(),
                summary: table::new<vector<u8> /*stage + bridge id*/, TvlSummary>(),
            },
        );

    }
    fun get_table_key(stage: u64, bridge_id: u64, timestamp: u64): vector<u8>{
        let key = table_key::encode_u64(stage);
        vector::append(&mut key, table_key::encode_u64(bridge_id));
        vector::append(&mut key, table_key::encode_u64(timestamp));
        key
    }

    fun extract_timestamp(key: vector<u8>) : u64 {
        let time_vec: vector<u8> = vector[];
        // timestamp_vec = key[16:23]
        let i = 16;
        while (i < 24) {
            vector::push_back(&mut time_vec , *vector::borrow(&key, i));
            i = i + 1;
        };
        table_key::decode_u64(time_vec)
    }

    // add the snapshot of the tvl on the bridge at the stage
    public(friend) fun add_snapshot(
        stage: u64, bridge_id: u64, balance: u64
    ) acquires ModuleStore {
        let (_, block_time) = block::get_block_info();
        let module_store = borrow_global_mut<ModuleStore>(@vip);
        let snapshot_table_key = get_table_key(stage, bridge_id, block_time);
        let summary_table_key = get_table_key(stage, bridge_id, 0);
        // add the snapshot of the tvl and block time
        table::upsert(
            &mut module_store.snapshots,
            snapshot_table_key,
            balance,
        );

        // update the average tvl of the bridge at the stage
        let summary =
            table::borrow_mut_with_default(
                &mut module_store.summary,
                summary_table_key,
                TvlSummary {
                    count: 0,
                    tvl: 0,
                }
            );
        // new average tvl = (snapshot_count * average_tvl + balance) / (snapshot_count + 1)
        let new_average_tvl =
            (
                ((summary.count as u128) * (summary.tvl as u128) + (balance as u128))
                    / ((summary.count + 1) as u128)
            );
        let new_count = summary.count + 1;
        table::upsert(
            &mut module_store.summary,
            summary_table_key,
            TvlSummary {
                count: new_count,
                tvl: (new_average_tvl as u64),
            },
        )
    }

    // get the average tvl of the bridge at the stage from accumulated snapshots
    #[view]
    public fun get_average_tvl(stage: u64, bridge_id: u64): u64 acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let average_table_key = get_table_key(stage,bridge_id,0);
        assert!(
            table::contains(&module_store.summary, average_table_key),
            error::not_found(EINVALID_BRIDGE_ID),
        );
        table::borrow(&module_store.summary, average_table_key).tvl
    }

    #[view]
    public fun get_snapshots(stage: u64, bridge_id: u64): vector<TVLSnapshotResponse> acquires ModuleStore {
        let module_store = borrow_global_mut<ModuleStore>(@vip);
        let snapshot_responses = vector::empty<TVLSnapshotResponse>();
        utils::walk(
            &module_store.snapshots,
            option::some(get_table_key(stage,bridge_id,0)),
            option::none(),
            1,
            |key, snapshot_tvl| {
                let time = extract_timestamp(key);
                vector::push_back(
                    &mut snapshot_responses,
                    TVLSnapshotResponse {
                        time,
                        tvl: *snapshot_tvl,
                    },
                );
                false
            },
        );
        snapshot_responses
    }

    #[test_only]
    const DEFAULT_EPOCH_FOR_TEST: u64 = 1;

    #[test_only]
    const DEFAULT_BRIDE_ID_FOR_TEST: u64 = 2;

    #[test_only]
    const DEFAULT_SKIP_FOR_TEST: u64 = 100;
    #[test_only]
    public fun init_module_for_test(chain: &signer) {
        init_module(chain)
    }

    #[test_only]
    fun skip_period(period: u64) {
        let (height, curr_time) = block::get_block_info();
        block::set_block_info(height, curr_time + period);
    }

    #[test(vip = @vip)]
    public fun add_snapshot_for_test(vip: &signer) acquires ModuleStore {
        init_module_for_test(vip);
        let balance = 1_000_000_000_000;
        add_snapshot(
            DEFAULT_EPOCH_FOR_TEST,
            DEFAULT_BRIDE_ID_FOR_TEST,
            balance,
        );

        let average_tvl =
            get_average_tvl(
                DEFAULT_EPOCH_FOR_TEST,
                DEFAULT_BRIDE_ID_FOR_TEST,
            );
        assert!(average_tvl == balance, 0);
    }

    #[test(vip = @vip)]
    public fun add_multi_snapshot_for_test(vip: &signer) acquires ModuleStore {
        init_module_for_test(vip);
        let balance1 = 1_000_000_000_000;
        let balance2 = 2_000_000_000_000;
        let balance3 = 3_000_000_000_000;
        add_snapshot(
            DEFAULT_EPOCH_FOR_TEST,
            DEFAULT_BRIDE_ID_FOR_TEST,
            balance1,
        );
        skip_period(DEFAULT_SKIP_FOR_TEST);
        add_snapshot(
            DEFAULT_EPOCH_FOR_TEST,
            DEFAULT_BRIDE_ID_FOR_TEST,
            balance2,
        );
        skip_period(DEFAULT_SKIP_FOR_TEST);
        add_snapshot(
            DEFAULT_EPOCH_FOR_TEST,
            DEFAULT_BRIDE_ID_FOR_TEST,
            balance3,
        );
        let average_tvl =
            get_average_tvl(
                DEFAULT_EPOCH_FOR_TEST,
                DEFAULT_BRIDE_ID_FOR_TEST,
            );
        assert!(average_tvl == 2_000_000_000_000, 0);
    }

}
