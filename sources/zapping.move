module vip::zapping {
    use std::error;
    use std::option::Option;
    use std::string::String;
    use std::block;

    use initia_std::dex;
    use initia_std::object::{Self, Object};
    use initia_std::fungible_asset::{Self, FungibleAsset, Metadata};

    use vip::utils;
    use vip::lock_staking;
    friend vip::vip;

    //
    // Errors
    //
    const EINVALID_ZAPPING_AMOUNT: u64 = 1;

    //
    // Constants
    //

    const DEFAULT_LOCK_PERIOD: u64 = 60 * 60 * 24 * 7 * 26; // 26 weeks

    //
    // Resources
    //

    struct ModuleStore has key {
        // lock period for zapping (in seconds)
        lock_period: u64,
    }

    //
    // Helper Functions
    //

    fun init_module(chain: &signer) {
        move_to(
            chain,
            ModuleStore { lock_period: DEFAULT_LOCK_PERIOD, },
        );
    }

    //
    // Entry Functions
    //

    public entry fun update_lock_period_script(
        chain: &signer, lock_period: u64
    ) acquires ModuleStore {
        utils::check_chain_permission(chain);
        let module_store = borrow_global_mut<ModuleStore>(@vip);
        module_store.lock_period = lock_period;
    }

    //
    // Friend Functions
    //

    public(friend) fun zapping(
        account: &signer,
        lp_metadata: Object<Metadata>,
        min_liquidity: Option<u64>,
        validator: String,
        esinit: FungibleAsset,
        stakelisted: FungibleAsset,
    ) acquires ModuleStore {
        assert!(
            fungible_asset::amount(&esinit) > 0 && fungible_asset::amount(&stakelisted) >
            0,
            error::invalid_argument(EINVALID_ZAPPING_AMOUNT),
        );

        let pair = object::convert<Metadata, dex::Config>(lp_metadata);
        let (_height, curr_time) = block::get_block_info();
        let module_store = borrow_global<ModuleStore>(@vip);
        let release_time = curr_time + module_store.lock_period;
        let esinit_metadata = fungible_asset::asset_metadata(&esinit);

        let (coin_a_metadata, _) = dex::pool_metadata(pair);

        // if pair is reversed, swap coin_a and coin_b
        let (coin_a, coin_b) =
            if (coin_a_metadata == esinit_metadata) {
                (esinit, stakelisted)
            } else {
                (stakelisted, esinit)
            };

        let liquidity = dex::provide_liquidity(pair, coin_a, coin_b, min_liquidity);
        lock_staking::delegate_internal(
            account,
            liquidity,
            release_time,
            validator,
        );
    }

    #[test_only]
    public fun init_module_for_test(chain: &signer) {
        init_module(chain);
    }
}
