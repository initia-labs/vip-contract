
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::operator`



-  [Resource `ModuleStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore)
-  [Struct `OperatorInfo`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_OperatorInfo)
-  [Struct `UpdateCommissionEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_UpdateCommissionEvent)
-  [Constants](#@Constants_0)
-  [Function `register_operator_store`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_register_operator_store)
-  [Function `update_operator_commission`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_commission)
-  [Function `update_operator_addr`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_addr)
-  [Function `check_operator_permission`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_check_operator_permission)
-  [Function `get_operator_commission`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_get_operator_commission)
-  [Function `is_bridge_registered`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_is_bridge_registered)


<pre><code><b>use</b> <a href="">0x1::bigdecimal</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::table</a>;
<b>use</b> <a href="">0x1::table_key</a>;
<b>use</b> <a href="">0x1::vector</a>;
<b>use</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore"></a>

## Resource `ModuleStore`



<pre><code><b>struct</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>operator_infos: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_OperatorInfo">operator::OperatorInfo</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_OperatorInfo"></a>

## Struct `OperatorInfo`



<pre><code><b>struct</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_OperatorInfo">OperatorInfo</a> <b>has</b> store
</code></pre>



##### Fields


<dl>
<dt>
<code>operator_addr: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>last_changed_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>commission_max_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>commission_max_change_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>commission_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_UpdateCommissionEvent"></a>

## Struct `UpdateCommissionEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_UpdateCommissionEvent">UpdateCommissionEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>bridge_id: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>version: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>commission_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EUNAUTHORIZED"></a>



<pre><code><b>const</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EUNAUTHORIZED">EUNAUTHORIZED</a>: u64 = 7;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_COMMISSION_CHANGE_RATE"></a>



<pre><code><b>const</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_COMMISSION_CHANGE_RATE">EINVALID_COMMISSION_CHANGE_RATE</a>: u64 = 3;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_COMMISSION_RATE"></a>



<pre><code><b>const</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_COMMISSION_RATE">EINVALID_COMMISSION_RATE</a>: u64 = 6;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_STAGE"></a>



<pre><code><b>const</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_STAGE">EINVALID_STAGE</a>: u64 = 5;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOPERATOR_STORE_ALREADY_EXISTS"></a>



<pre><code><b>const</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOPERATOR_STORE_ALREADY_EXISTS">EOPERATOR_STORE_ALREADY_EXISTS</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOPERATOR_STORE_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOPERATOR_STORE_NOT_FOUND">EOPERATOR_STORE_NOT_FOUND</a>: u64 = 2;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOVER_MAX_COMMISSION_RATE"></a>



<pre><code><b>const</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOVER_MAX_COMMISSION_RATE">EOVER_MAX_COMMISSION_RATE</a>: u64 = 4;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_register_operator_store"></a>

## Function `register_operator_store`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_register_operator_store">register_operator_store</a>(chain: &<a href="">signer</a>, operator_addr: <b>address</b>, bridge_id: u64, version: u64, stage: u64, commission_max_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>, commission_max_change_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>, commission_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_register_operator_store">register_operator_store</a>(
    chain: &<a href="">signer</a>,
    operator_addr: <b>address</b>,
    bridge_id: u64,
    version: u64,
    stage: u64,
    commission_max_rate: BigDecimal,
    commission_max_change_rate: BigDecimal,
    commission_rate: BigDecimal
) <b>acquires</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> key = <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_generate_key">generate_key</a>(bridge_id, version);
    <b>assert</b>!(
        !<a href="_contains">table::contains</a>(&module_store.operator_infos, key),
        <a href="_already_exists">error::already_exists</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOPERATOR_STORE_ALREADY_EXISTS">EOPERATOR_STORE_ALREADY_EXISTS</a>)
    );

    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_check_valid_commission_rates">check_valid_commission_rates</a>(
        &commission_max_rate,
        &commission_max_change_rate,
        &commission_rate
    );

    <a href="_add">table::add</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_OperatorInfo">OperatorInfo</a>&gt;(
        &<b>mut</b> module_store.operator_infos,
        key,
        <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_OperatorInfo">OperatorInfo</a> {
            operator_addr,
            last_changed_stage: stage,
            commission_max_rate,
            commission_max_change_rate,
            commission_rate
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_commission"></a>

## Function `update_operator_commission`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_commission">update_operator_commission</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, version: u64, stage: u64, commission_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_commission">update_operator_commission</a>(
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    stage: u64,
    commission_rate: BigDecimal
) <b>acquires</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a> {
    <b>let</b> operator_addr = <a href="_address_of">signer::address_of</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>);
    <b>let</b> key = <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_generate_key">generate_key</a>(bridge_id, version);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);

    <b>let</b> operator_info = <a href="_borrow_mut">table::borrow_mut</a>(&<b>mut</b> module_store.operator_infos, key);
    <b>assert</b>!(
        operator_addr == operator_info.operator_addr,
        <a href="_permission_denied">error::permission_denied</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EUNAUTHORIZED">EUNAUTHORIZED</a>)
    );
    // commission can be updated once per a stage.
    <b>assert</b>!(
        stage &gt; operator_info.last_changed_stage,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_STAGE">EINVALID_STAGE</a>)
    );

    <b>assert</b>!(
        <a href="_le">bigdecimal::le</a>(commission_rate, operator_info.commission_max_rate),
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOVER_MAX_COMMISSION_RATE">EOVER_MAX_COMMISSION_RATE</a>)
    );

    // <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a> max change rate limits
    <b>let</b> change =
        <b>if</b> (<a href="_gt">bigdecimal::gt</a>(operator_info.commission_rate, commission_rate)) {
            <a href="_sub">bigdecimal::sub</a>(operator_info.commission_rate, commission_rate)
        } <b>else</b> {
            <a href="_sub">bigdecimal::sub</a>(commission_rate, operator_info.commission_rate)
        };

    <b>assert</b>!(
        <a href="_le">bigdecimal::le</a>(change, operator_info.commission_max_change_rate),
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EINVALID_COMMISSION_CHANGE_RATE">EINVALID_COMMISSION_CHANGE_RATE</a>)
    );

    operator_info.commission_rate = commission_rate;
    operator_info.last_changed_stage = stage;

    <a href="_emit">event::emit</a>(
        <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_UpdateCommissionEvent">UpdateCommissionEvent</a> {
            <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: operator_addr,
            bridge_id,
            version,
            stage: operator_info.last_changed_stage,
            commission_rate
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_addr"></a>

## Function `update_operator_addr`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_addr">update_operator_addr</a>(old_operator: &<a href="">signer</a>, bridge_id: u64, version: u64, new_operator_addr: <b>address</b>)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_addr">update_operator_addr</a>(
    old_operator: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    new_operator_addr: <b>address</b>
) <b>acquires</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a> {
    <b>let</b> key = <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_generate_key">generate_key</a>(bridge_id, version);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> operator_info = <a href="_borrow_mut">table::borrow_mut</a>(&<b>mut</b> module_store.operator_infos, key);
    <b>assert</b>!(
        operator_info.operator_addr == <a href="_address_of">signer::address_of</a>(old_operator),
        <a href="_permission_denied">error::permission_denied</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EUNAUTHORIZED">EUNAUTHORIZED</a>)
    );

    operator_info.operator_addr = new_operator_addr;
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_check_operator_permission"></a>

## Function `check_operator_permission`



<pre><code><b>public</b> <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_check_operator_permission">check_operator_permission</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, version: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_check_operator_permission">check_operator_permission</a>(
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, version: u64
) <b>acquires</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a> {
    <b>let</b> key = <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_generate_key">generate_key</a>(bridge_id, version);
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> operator_info = <a href="_borrow">table::borrow</a>(&module_store.operator_infos, key);

    <b>assert</b>!(
        operator_info.operator_addr == <a href="_address_of">signer::address_of</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>),
        <a href="_permission_denied">error::permission_denied</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EUNAUTHORIZED">EUNAUTHORIZED</a>)
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_get_operator_commission"></a>

## Function `get_operator_commission`



<pre><code><b>public</b> <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_get_operator_commission">get_operator_commission</a>(bridge_id: u64, version: u64): <a href="_BigDecimal">bigdecimal::BigDecimal</a>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_get_operator_commission">get_operator_commission</a>(bridge_id: u64, version: u64): BigDecimal <b>acquires</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(
            &module_store.operator_infos,
            <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_generate_key">generate_key</a>(bridge_id, version)
        ),
        <a href="_not_found">error::not_found</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_EOPERATOR_STORE_NOT_FOUND">EOPERATOR_STORE_NOT_FOUND</a>)
    );
    <b>let</b> operator_info =
        <a href="_borrow">table::borrow</a>(
            &module_store.operator_infos,
            <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_generate_key">generate_key</a>(bridge_id, version)
        );
    operator_info.commission_rate
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_is_bridge_registered"></a>

## Function `is_bridge_registered`



<pre><code><b>public</b> <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_is_bridge_registered">is_bridge_registered</a>(bridge_id: u64, version: u64): bool
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_is_bridge_registered">is_bridge_registered</a>(bridge_id: u64, version: u64): bool <b>acquires</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="_contains">table::contains</a>(
        &module_store.operator_infos,
        <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_generate_key">generate_key</a>(bridge_id, version)
    )
}
</code></pre>
