
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils`



-  [Struct `DelegatorDelegationsRequest`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequest)
-  [Struct `DelegatorDelegationsRequestV2`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequestV2)
-  [Struct `DelegatorDelegationsResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsResponse)
-  [Struct `PoolRequest`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PoolRequest)
-  [Struct `PoolResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PoolResponse)
-  [Struct `Pool`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Pool)
-  [Struct `PageRequest`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageRequest)
-  [Struct `PageResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageResponse)
-  [Struct `DelegationResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse)
-  [Struct `Delegation`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation)
-  [Struct `Coin`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin)
-  [Struct `DecCoin`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin)
-  [Constants](#@Constants_0)
-  [Function `walk_mut`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk_mut)
-  [Function `walk`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk)
-  [Function `check_chain_permission`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission)
-  [Function `mul_div_u64`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u64)
-  [Function `mul_div_u128`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u128)
-  [Function `get_voting_power`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_voting_power)
-  [Function `unpack_delegation_response`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation_response)
-  [Function `unpack_delegation`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation)
-  [Function `unpack_coin`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_coin)
-  [Function `unpack_dec_coin`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_dec_coin)
-  [Function `get_customized_voting_power`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_customized_voting_power)
-  [Function `get_weight_map`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_weight_map)
-  [Function `get_delegations`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_delegations)


<pre><code><b>use</b> <a href="">0x1::address</a>;
<b>use</b> <a href="">0x1::bigdecimal</a>;
<b>use</b> <a href="">0x1::coin</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::fungible_asset</a>;
<b>use</b> <a href="">0x1::json</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::query</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::simple_map</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::vector</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequest"></a>

## Struct `DelegatorDelegationsRequest`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequest">DelegatorDelegationsRequest</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>pagination: <a href="_Option">option::Option</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageRequest">utils::PageRequest</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequestV2"></a>

## Struct `DelegatorDelegationsRequestV2`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequestV2">DelegatorDelegationsRequestV2</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>pagination: <a href="_Option">option::Option</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageRequest">utils::PageRequest</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>status: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsResponse"></a>

## Struct `DelegatorDelegationsResponse`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsResponse">DelegatorDelegationsResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegation_responses: <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse">utils::DelegationResponse</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>pagination: <a href="_Option">option::Option</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageResponse">utils::PageResponse</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PoolRequest"></a>

## Struct `PoolRequest`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PoolRequest">PoolRequest</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>dummy_field: bool</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PoolResponse"></a>

## Struct `PoolResponse`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PoolResponse">PoolResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>pool: <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Pool">utils::Pool</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Pool"></a>

## Struct `Pool`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Pool">Pool</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>not_bonded_tokens: <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">utils::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>bonded_tokens: <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">utils::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_power_weights: <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">utils::DecCoin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageRequest"></a>

## Struct `PageRequest`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageRequest">PageRequest</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>key: <a href="_Option">option::Option</a>&lt;<a href="_String">string::String</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>offset: <a href="_Option">option::Option</a>&lt;u64&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>limit: <a href="_Option">option::Option</a>&lt;u64&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>count_total: <a href="_Option">option::Option</a>&lt;bool&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>reverse: <a href="_Option">option::Option</a>&lt;bool&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageResponse"></a>

## Struct `PageResponse`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageResponse">PageResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>next_key: <a href="_Option">option::Option</a>&lt;<a href="_String">string::String</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>total: <a href="_Option">option::Option</a>&lt;u64&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse"></a>

## Struct `DelegationResponse`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse">DelegationResponse</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegation: <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation">utils::Delegation</a></code>
</dt>
<dd>

</dd>
<dt>
<code>balance: <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">utils::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation"></a>

## Struct `Delegation`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation">Delegation</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>validator_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>shares: <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">utils::DecCoin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin"></a>

## Struct `Coin`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">Coin</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>denom: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>amount: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin"></a>

## Struct `DecCoin`



<pre><code><b>struct</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">DecCoin</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>denom: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>amount: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_EUNAUTHORIZED"></a>



<pre><code><b>const</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_EUNAUTHORIZED">EUNAUTHORIZED</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk_mut"></a>

## Function `walk_mut`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk_mut">walk_mut</a>&lt;K: <b>copy</b>, drop, V&gt;(mut_table: &<b>mut</b> <a href="_Table">table::Table</a>&lt;K, V&gt;, start: <a href="_Option">option::Option</a>&lt;K&gt;, end: <a href="_Option">option::Option</a>&lt;K&gt;, order: u8, f: |(K, &<b>mut</b> V)|bool)
</code></pre>



##### Implementation


<pre><code><b>public</b> inline <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk_mut">walk_mut</a>&lt;K: <b>copy</b> + drop, V&gt;(
    mut_table: &<b>mut</b> Table&lt;K, V&gt;,
    start: Option&lt;K&gt;,
    end: Option&lt;K&gt;,
    order: u8,
    f: |K, &<b>mut</b> V| bool
) {
    <b>let</b> iter = <a href="_iter_mut">table::iter_mut</a>(mut_table, start, end, order);
    <b>loop</b> {
        <b>if</b> (!<a href="_prepare_mut">table::prepare_mut</a>&lt;K, V&gt;(iter)) { <b>break</b> };
        <b>let</b> (key, value) = <a href="_next_mut">table::next_mut</a>&lt;K, V&gt;(iter);
        <b>let</b> stop = f(key, value);
        <b>if</b> (stop) { <b>break</b> }
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk"></a>

## Function `walk`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk">walk</a>&lt;K: <b>copy</b>, drop, V&gt;(<a href="">table</a>: &<a href="_Table">table::Table</a>&lt;K, V&gt;, start: <a href="_Option">option::Option</a>&lt;K&gt;, end: <a href="_Option">option::Option</a>&lt;K&gt;, order: u8, f: |(K, &V)|bool)
</code></pre>



##### Implementation


<pre><code><b>public</b> inline <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk">walk</a>&lt;K: <b>copy</b> + drop, V&gt;(
    <a href="">table</a>: &Table&lt;K, V&gt;,
    start: Option&lt;K&gt;,
    end: Option&lt;K&gt;,
    order: u8,
    f: |K, &V| bool
) {
    <b>let</b> iter = <a href="_iter">table::iter</a>(<a href="">table</a>, start, end, order);
    <b>loop</b> {
        <b>if</b> (!<a href="_prepare">table::prepare</a>&lt;K, V&gt;(iter)) { <b>break</b> };
        <b>let</b> (key, value) = <a href="_next">table::next</a>&lt;K, V&gt;(iter);
        <b>let</b> stop = f(key, value);
        <b>if</b> (stop) { <b>break</b> }
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission"></a>

## Function `check_chain_permission`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">check_chain_permission</a>(chain: &<a href="">signer</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">check_chain_permission</a>(chain: &<a href="">signer</a>) {
    <b>let</b> addr = <a href="_address_of">signer::address_of</a>(chain);
    <b>assert</b>!(
        addr == @initia_std || addr == @<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>,
        <a href="_permission_denied">error::permission_denied</a>(<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_EUNAUTHORIZED">EUNAUTHORIZED</a>)
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u64"></a>

## Function `mul_div_u64`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u64">mul_div_u64</a>(a: u64, b: u64, c: u64): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u64">mul_div_u64</a>(a: u64, b: u64, c: u64): u64 {
    ((a <b>as</b> u128) * (b <b>as</b> u128) / (c <b>as</b> u128) <b>as</b> u64)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u128"></a>

## Function `mul_div_u128`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u128">mul_div_u128</a>(a: u128, b: u128, c: u128): u128
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u128">mul_div_u128</a>(a: u128, b: u128, c: u128): u128 {
    ((a <b>as</b> u256) * (b <b>as</b> u256) / (c <b>as</b> u256) <b>as</b> u128)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_voting_power"></a>

## Function `get_voting_power`



<pre><code>#[deprecated]
<b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_voting_power">get_voting_power</a>(delegator_addr: <a href="_String">string::String</a>): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_voting_power">get_voting_power</a>(delegator_addr: String): u64 {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_customized_voting_power">get_customized_voting_power</a>(
        initia_std::address::from_sdk(delegator_addr),
        |_metadata, voting_power| { voting_power }
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation_response"></a>

## Function `unpack_delegation_response`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation_response">unpack_delegation_response</a>(delegation_response: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse">utils::DelegationResponse</a>): (<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation">utils::Delegation</a>, <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">utils::Coin</a>&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation_response">unpack_delegation_response</a>(
    delegation_response: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse">DelegationResponse</a>
): (<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation">Delegation</a>, <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">Coin</a>&gt;) {
    (delegation_response.delegation, delegation_response.balance)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation"></a>

## Function `unpack_delegation`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation">unpack_delegation</a>(delegation: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation">utils::Delegation</a>): (<a href="_String">string::String</a>, <a href="_String">string::String</a>, <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">utils::DecCoin</a>&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation">unpack_delegation</a>(delegation: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Delegation">Delegation</a>): (String, String, <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">DecCoin</a>&gt;) {
    (delegation.delegator_address, delegation.validator_address, delegation.shares)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_coin"></a>

## Function `unpack_coin`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_coin">unpack_coin</a>(<a href="">coin</a>: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">utils::Coin</a>): (<a href="_String">string::String</a>, u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_coin">unpack_coin</a>(<a href="">coin</a>: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_Coin">Coin</a>): (String, u64) {
    (<a href="">coin</a>.denom, <a href="">coin</a>.amount)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_dec_coin"></a>

## Function `unpack_dec_coin`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_dec_coin">unpack_dec_coin</a>(<a href="">coin</a>: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">utils::DecCoin</a>): (<a href="_String">string::String</a>, <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_dec_coin">unpack_dec_coin</a>(<a href="">coin</a>: &<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">DecCoin</a>): (String, BigDecimal) {
    (<a href="">coin</a>.denom, <a href="">coin</a>.amount)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_customized_voting_power"></a>

## Function `get_customized_voting_power`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_customized_voting_power">get_customized_voting_power</a>(delegator_addr: <b>address</b>, f: |(<a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, u64)|u64): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> inline <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_customized_voting_power">get_customized_voting_power</a>(
    delegator_addr: <b>address</b>, f: |Object&lt;Metadata&gt;, u64| u64
): u64 {
    <b>let</b> delegator_addr = to_sdk(delegator_addr);
    <b>let</b> delegations = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_delegations">get_delegations</a>(delegator_addr);

    // denom =&gt; voting power map
    <b>let</b> weight_map = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_weight_map">get_weight_map</a>();
    // denom =&gt; delegate amount map
    <b>let</b> delegate_amount_map = <a href="_new">simple_map::new</a>&lt;String, u64&gt;();
    // initialize
    <a href="_for_each_ref">vector::for_each_ref</a>(
        &<a href="_keys">simple_map::keys</a>(&weight_map),
        |denom| {
            <a href="_add">simple_map::add</a>(&<b>mut</b> delegate_amount_map, *denom, 0);
        }
    );

    // get total delegated amounts
    <a href="_for_each_ref">vector::for_each_ref</a>(
        &delegations,
        |delegation| {
            <b>let</b> (_, balance) = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_delegation_response">unpack_delegation_response</a>(delegation);
            <a href="_for_each_ref">vector::for_each_ref</a>(
                &balance,
                |<a href="">coin</a>| {
                    <b>let</b> (denom, amount) = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_unpack_coin">unpack_coin</a>(<a href="">coin</a>);
                    <b>let</b> amount_before =
                        <a href="_borrow_mut">simple_map::borrow_mut</a>(&<b>mut</b> delegate_amount_map, &denom);
                    *amount_before = *amount_before + amount;
                }
            );
        }
    );

    // get total voting power
    <b>let</b> total_voting_power = 0;
    <a href="_for_each_ref">vector::for_each_ref</a>(
        &<a href="_keys">simple_map::keys</a>(&weight_map),
        |denom| {
            <b>let</b> metadata = <a href="_denom_to_metadata">coin::denom_to_metadata</a>(*denom);
            <b>let</b> amount = *<a href="_borrow">simple_map::borrow</a>(&delegate_amount_map, denom);
            <b>let</b> weight = <a href="_borrow">simple_map::borrow</a>(&weight_map, denom);
            <b>let</b> voting_power = <a href="_mul_by_u64_truncate">bigdecimal::mul_by_u64_truncate</a>(*weight, amount);
            total_voting_power = total_voting_power + f(metadata, voting_power);
        }
    );

    total_voting_power
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_weight_map"></a>

## Function `get_weight_map`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_weight_map">get_weight_map</a>(): <a href="_SimpleMap">simple_map::SimpleMap</a>&lt;<a href="_String">string::String</a>, <a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_weight_map">get_weight_map</a>(): SimpleMap&lt;String, BigDecimal&gt; {
    <b>let</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PoolResponse">PoolResponse</a> { pool } = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_pool">get_pool</a>();
    <b>let</b> weight_map = <a href="_new">simple_map::new</a>&lt;String, BigDecimal&gt;();
    <a href="_for_each_ref">vector::for_each_ref</a>(
        &pool.voting_power_weights,
        |weight| {
            <b>let</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DecCoin">DecCoin</a> { denom, amount } = *weight;
            <a href="_add">simple_map::add</a>(&<b>mut</b> weight_map, denom, amount);
        }
    );
    weight_map
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_delegations"></a>

## Function `get_delegations`



<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_delegations">get_delegations</a>(delegator_addr: <a href="_String">string::String</a>): <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse">utils::DelegationResponse</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_delegations">get_delegations</a>(delegator_addr: String): <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse">DelegationResponse</a>&gt; {
    <b>let</b> delegation_responses: <a href="">vector</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegationResponse">DelegationResponse</a>&gt; = <a href="">vector</a>[];
    <b>let</b> pagination = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_PageRequest">PageRequest</a> {
        key: <a href="_none">option::none</a>(),
        offset: <a href="_none">option::none</a>(),
        limit: <a href="_none">option::none</a>(),
        count_total: <a href="_none">option::none</a>(),
        reverse: <a href="_none">option::none</a>()
    };

    <b>let</b> path = b"/initia.mstaking.v1.Query/DelegatorDelegations";

    <b>loop</b> {
        <b>let</b> request = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequestV2">DelegatorDelegationsRequestV2</a> {
            delegator_addr,
            pagination: <a href="_some">option::some</a>(pagination),
            status: <a href="_utf8">string::utf8</a>(b"BOND_STATUS_BONDED")
        };
        <b>let</b> response =
            <a href="">query</a>&lt;<a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsRequestV2">DelegatorDelegationsRequestV2</a>, <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_DelegatorDelegationsResponse">DelegatorDelegationsResponse</a>&gt;(
                path, request
            );
        <a href="_append">vector::append</a>(
            &<b>mut</b> delegation_responses,
            response.delegation_responses
        );

        <b>if</b> (<a href="_is_none">option::is_none</a>(&response.pagination)) { <b>break</b> };

        <b>let</b> pagination_res = <a href="_borrow">option::borrow</a>(&response.pagination);

        <b>if</b> (<a href="_is_none">option::is_none</a>(&pagination_res.next_key)) { <b>break</b> };

        pagination.key = pagination_res.next_key;
    };

    delegation_responses
}
</code></pre>
