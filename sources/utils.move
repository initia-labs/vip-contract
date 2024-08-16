module publisher::vip_utils {
    use std::signer;
    use std::error;

    use initia_std::table::{Self, Table};
    use initia_std::option;

    const EUNAUTHORIZED: u64 = 1;

    public inline fun table_loop_mut<K: copy + drop, V>(
        mut_table: &mut Table<K, V>,
        f: |K, &mut V| bool
    ) {
        let iter = table::iter_mut(
            mut_table,
            option::none(),
            option::none(),
            1
        );
        loop {
            if (!table::prepare_mut<K, V>(iter)) { break };
            let (key, value) = table::next_mut<K, V>(iter);
            let stop = f(key, value);
            if (stop) { break }
        }
    }

    public inline fun table_loop<K: copy + drop, V>(mut_table: &Table<K, V>, f: |K, &V| bool) {
        let iter = table::iter(
            mut_table,
            option::none(),
            option::none(),
            1
        );
        loop {
            if (!table::prepare<K, V>(iter)) { break };
            let (key, value) = table::next<K, V>(iter);
            let stop = f(key, value);
            if (stop) { break }
        }
    }

    public fun check_chain_permission(chain: &signer) {
        let addr = signer::address_of(chain);
        assert!(
            addr == @initia_std || addr == @publisher,
            error::permission_denied(EUNAUTHORIZED),
        );
    }
}