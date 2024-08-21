module vip::reward {
    use std::string;
    use std::vector;
    use std::error;
    use initia_std::object::{Object};
    use initia_std::fungible_asset::{Metadata};
    use initia_std::primary_fungible_store;
    use initia_std::table;
    use initia_std::table_key;
    use initia_std::coin;
    friend vip::weight_vote;
    friend vip::vesting;
    friend vip::zapping;
    friend vip::vault;
    friend vip::vip;

    //
    // Errors
    //

    const EREWARD_STORE_ALREADY_EXISTS: u64 = 1;

    //
    //  Constants
    //
    const REWARD_SYMBOL: vector<u8> = b"uinit";

    //
    // Resources
    //

    struct ModuleStore has key {
        // sort by bridge id then. sort by stage
        distributed_reward: table::Table<vector<u8> /*bridge id + version + stage key*/, RewardRecord>,
    }

    struct RewardRecord has store {
        user_reward: u64,
        operator_reward: u64,
    }

    fun init_module(vip: &signer) {
        move_to(
            vip,
            ModuleStore { distributed_reward: table::new<vector<u8>, RewardRecord>() },
        );
    }

    fun generate_key(
        bridge_id: u64, version: u64, stage: u64
    ): vector<u8> {
        let key = table_key::encode_u64(bridge_id);
        vector::append(&mut key, table_key::encode_u64(version));
        vector::append(&mut key, table_key::encode_u64(stage));
        key
    }

    //
    // Public Functions
    //

    public fun reward_metadata(): Object<Metadata> {
        coin::metadata(@initia_std, string::utf8(REWARD_SYMBOL))
    }

    public(friend) fun record_distributed_reward(
        bridge_id: u64,
        version: u64,
        stage: u64,
        user_reward: u64,
        operator_reward: u64
    ) acquires ModuleStore {
        let module_store = borrow_global_mut<ModuleStore>(@vip);
        let key = generate_key(bridge_id, version, stage);
        assert!(
            !table::contains(&module_store.distributed_reward, key),
            error::unavailable(EREWARD_STORE_ALREADY_EXISTS),
        );
        table::add(
            &mut module_store.distributed_reward,
            key,
            RewardRecord { user_reward, operator_reward },
        );
    }

    //
    // View Functions
    //

    #[view]
    public fun balance(addr: address): u64 {
        primary_fungible_store::balance(addr, reward_metadata())
    }

    #[view]
    public fun get_user_distrubuted_reward(
        bridge_id: u64, version: u64, stage: u64
    ): u64 acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let key = generate_key(bridge_id, version, stage);

        if (table::contains(&module_store.distributed_reward, key)) {
            let reward_data = table::borrow(
                &module_store.distributed_reward,
                key,
            );
            return reward_data.user_reward
        };

        0
    }

    #[view]
    public fun get_operator_distrubuted_reward(
        bridge_id: u64, version: u64, stage: u64
    ): u64 acquires ModuleStore {
        let module_store = borrow_global<ModuleStore>(@vip);
        let key = generate_key(bridge_id, version, stage);

        if (table::contains(&module_store.distributed_reward, key)) {
            let reward_data = table::borrow(
                &module_store.distributed_reward,
                key,
            );
            return reward_data.operator_reward
        };

        0
    }

    #[test_only]
    public fun init_module_for_test(chain: &signer) {
        init_module(chain);
    }
}
