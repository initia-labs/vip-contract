# Changelog

## [v1.2.0]

### Features

- Add `update_operator_info` to allow changing `commission_max_rate` and `commission_max_change_rate` via governance proposal [`016f117`](https://github.com/initia-labs/vip-contract/commit/016f117c9cf4c5dcb673afb3258ab9076c2138f3)
- Add `get_module_store` to get the module store for the `weight_vote` module [`488a3c4`](https://github.com/initia-labs/vip-contract/commit/488a3c451c36994cd676fcfd53776eb01e0eee9e)
- Add `vote_with_amount` to enable weighted voting with exact amounts [`6d0c3dd`](https://github.com/initia-labs/vip-contract/commit/6d0c3dd48854457131278afc0aa5df7115c32fb4)

### Updates

- As `0x1::dex` support unproportional liquidity provision, calculate and provide a proportional counterparty coin [`a436300`](https://github.com/initia-labs/vip-contract/commit/a436300372dcfc6fdc355c21614cdc167b4b1fb5)

---

## [v1.1.0]

### Features

- Use `get_total_delegation_balance` to reduce gas cost [`faa7946c`](https://github.com/initia-labs/vip-contract/commit/faa7946cab1883d3d52a17d456116f0f6278f49d)
- Add `rollup_challenge` [`a4ac3790`](https://github.com/initia-labs/vip-contract/commit/a4ac3790e81ab9bf018e6653a734516c65c1eecb)
- Add `LockStakeEvent` to index lock staked amount [`f8b9a7fe`](https://github.com/initia-labs/vip-contract/commit/f8b9a7fef024ace362fcddbc09ef35d694e471db)

### Bug Fixes

- Only count bonded validator staking [`e92cc1a4`](https://github.com/initia-labs/vip-contract/commit/e92cc1a4c695d2cfa0519a79ad23c5eee983c8b1)

### Chores

- Set dev address to import from other contract [`f730e20b`](https://github.com/initia-labs/vip-contract/commit/f730e20b34e2f737bff105fa2afcf00f013671d1)

---

## [v1.0.0]

Initial release.
