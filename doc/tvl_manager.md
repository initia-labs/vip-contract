
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::tvl_manager`



-  [Resource `ModuleStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore)
-  [Struct `TvlSummary`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TvlSummary)
-  [Struct `TVLSnapshotEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TVLSnapshotEvent)
-  [Constants](#@Constants_0)
-  [Function `update_snapshot_interval`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_update_snapshot_interval)
-  [Function `is_snapshot_addable`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_is_snapshot_addable)
-  [Function `add_snapshot`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_add_snapshot)
-  [Function `get_average_tvl`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_get_average_tvl)


<pre><code><b>use</b> <a href="">0x1::block</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::table</a>;
<b>use</b> <a href="">0x1::table_key</a>;
<b>use</b> <a href="">0x1::vector</a>;
<b>use</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore"></a>

## Resource `ModuleStore`



<pre><code><b>struct</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>last_snapshot_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>last_snapshot_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>snapshot_interval: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>summary: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TvlSummary">tvl_manager::TvlSummary</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TvlSummary"></a>

## Struct `TvlSummary`



<pre><code><b>struct</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TvlSummary">TvlSummary</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>count: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>tvl: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TVLSnapshotEvent"></a>

## Struct `TVLSnapshotEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TVLSnapshotEvent">TVLSnapshotEvent</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>bridge_id: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>tvl: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_DEFAULT_SNAPSHOT_INTERVAL"></a>



<pre><code><b>const</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_DEFAULT_SNAPSHOT_INTERVAL">DEFAULT_SNAPSHOT_INTERVAL</a>: u64 = 14400;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_EINVALID_BRIDGE_ID"></a>



<pre><code><b>const</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_EINVALID_BRIDGE_ID">EINVALID_BRIDGE_ID</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_update_snapshot_interval"></a>

## Function `update_snapshot_interval`



<pre><code><b>public</b> entry <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_update_snapshot_interval">update_snapshot_interval</a>(chain: &<a href="">signer</a>, new_snapshot_interval: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_update_snapshot_interval">update_snapshot_interval</a>(
    chain: &<a href="">signer</a>, new_snapshot_interval: u64
) <b>acquires</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    module_store.snapshot_interval = new_snapshot_interval;
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_is_snapshot_addable"></a>

## Function `is_snapshot_addable`



<pre><code><b>public</b> <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_is_snapshot_addable">is_snapshot_addable</a>(stage: u64): bool
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_is_snapshot_addable">is_snapshot_addable</a>(stage: u64): bool <b>acquires</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (_, curr_time) = <a href="_get_block_info">block::get_block_info</a>();
    // <b>return</b> <b>true</b> <b>if</b> either of the following two conditions is met
    // - the current stage is beyond the last snapshot stage
    // - past the snapshot interval since the last snapshot
    <b>let</b> is_addable_stage = stage &gt; module_store.last_snapshot_stage;
    <b>let</b> is_addable_time =
        curr_time
            &gt;= module_store.snapshot_interval + module_store.last_snapshot_time;
    is_addable_stage || is_addable_time
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_add_snapshot"></a>

## Function `add_snapshot`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_add_snapshot">add_snapshot</a>(stage: u64, bridge_ids: <a href="">vector</a>&lt;u64&gt;, tvls: <a href="">vector</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_add_snapshot">add_snapshot</a>(
    stage: u64, bridge_ids: <a href="">vector</a>&lt;u64&gt;, tvls: <a href="">vector</a>&lt;u64&gt;
) <b>acquires</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a> {
    <b>let</b> (_, curr_time) = <a href="_get_block_info">block::get_block_info</a>();
    <b>if</b> (!<a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_is_snapshot_addable">is_snapshot_addable</a>(stage)) { <b>return</b> };

    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    module_store.last_snapshot_time = curr_time;
    module_store.last_snapshot_stage = stage;
    <a href="_enumerate_ref">vector::enumerate_ref</a>(
        &bridge_ids,
        |i, bridge_id| {
            <b>let</b> tvl = <a href="_borrow">vector::borrow</a>(&tvls, i);
            <b>let</b> summary_table_key = <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_generate_key">generate_key</a>(stage, *bridge_id);
            <b>let</b> summary =
                <a href="_borrow_mut_with_default">table::borrow_mut_with_default</a>(
                    &<b>mut</b> module_store.summary,
                    summary_table_key,
                    <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TvlSummary">TvlSummary</a> { count: 0, tvl: 0 }
                );
            // new average tvl = (snapshot_count * average_tvl + balance) / (snapshot_count + 1)
            <b>let</b> new_count = summary.count + 1;
            <b>let</b> new_average_tvl =
                (((summary.count <b>as</b> u128) * (summary.tvl <b>as</b> u128) + (*tvl <b>as</b> u128))
                    / (new_count <b>as</b> u128));
            <a href="_upsert">table::upsert</a>(
                &<b>mut</b> module_store.summary,
                summary_table_key,
                <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TvlSummary">TvlSummary</a> { count: new_count, tvl: (new_average_tvl <b>as</b> u64) }
            );
            <a href="_emit">event::emit</a>(
                <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_TVLSnapshotEvent">TVLSnapshotEvent</a> {
                    stage,
                    bridge_id: *bridge_id,
                    time: curr_time,
                    tvl: *tvl
                }
            );
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_get_average_tvl"></a>

## Function `get_average_tvl`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_get_average_tvl">get_average_tvl</a>(stage: u64, bridge_id: u64): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_get_average_tvl">get_average_tvl</a>(stage: u64, bridge_id: u64): u64 <b>acquires</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> summary_table_key = <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_generate_key">generate_key</a>(stage, bridge_id);
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(&module_store.summary, summary_table_key),
        <a href="_not_found">error::not_found</a>(<a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager_EINVALID_BRIDGE_ID">EINVALID_BRIDGE_ID</a>)
    );
    <a href="_borrow">table::borrow</a>(&module_store.summary, summary_table_key).tvl
}
</code></pre>
