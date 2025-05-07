
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::vault`



-  [Resource `ModuleStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore)
-  [Constants](#@Constants_0)
-  [Function `withdraw`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_withdraw)
-  [Function `deposit`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_deposit)
-  [Function `update_reward_per_stage`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_update_reward_per_stage)
-  [Function `reward_per_stage`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_per_stage)
-  [Function `reward_metadata`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_metadata)
-  [Function `get_vault_store_address`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_get_vault_store_address)


<pre><code><b>use</b> <a href="">0x1::coin</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::fungible_asset</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::primary_fungible_store</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore"></a>

## Resource `ModuleStore`



<pre><code><b>struct</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>extend_ref: <a href="_ExtendRef">object::ExtendRef</a></code>
</dt>
<dd>

</dd>
<dt>
<code>reward_per_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>vault_store_addr: <b>address</b></code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_EINVALID_AMOUNT"></a>



<pre><code><b>const</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_EINVALID_AMOUNT">EINVALID_AMOUNT</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_EINVALID_REWARD_PER_STAGE"></a>



<pre><code><b>const</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_EINVALID_REWARD_PER_STAGE">EINVALID_REWARD_PER_STAGE</a>: u64 = 2;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_withdraw"></a>

## Function `withdraw`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_withdraw">withdraw</a>(amount: u64): <a href="_FungibleAsset">fungible_asset::FungibleAsset</a>
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_withdraw">withdraw</a>(amount: u64): FungibleAsset <b>acquires</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>assert</b>!(
        module_store.reward_per_stage &gt; 0,
        <a href="_invalid_state">error::invalid_state</a>(<a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_EINVALID_REWARD_PER_STAGE">EINVALID_REWARD_PER_STAGE</a>)
    );
    <b>let</b> vault_signer =
        <a href="_generate_signer_for_extending">object::generate_signer_for_extending</a>(&module_store.extend_ref);
    <a href="_withdraw">primary_fungible_store::withdraw</a>(&vault_signer, <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_metadata">reward_metadata</a>(), amount)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_deposit"></a>

## Function `deposit`



<pre><code><b>public</b> entry <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_deposit">deposit</a>(funder: &<a href="">signer</a>, amount: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_deposit">deposit</a>(funder: &<a href="">signer</a>, amount: u64) <b>acquires</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a> {
    <b>let</b> vault_store_addr = <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_get_vault_store_address">get_vault_store_address</a>();
    <b>assert</b>!(
        amount &gt; 0,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_EINVALID_AMOUNT">EINVALID_AMOUNT</a>)
    );
    <a href="_transfer">primary_fungible_store::transfer</a>(
        funder,
        <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_metadata">reward_metadata</a>(),
        vault_store_addr,
        amount
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_update_reward_per_stage"></a>

## Function `update_reward_per_stage`



<pre><code><b>public</b> entry <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_update_reward_per_stage">update_reward_per_stage</a>(chain: &<a href="">signer</a>, reward_per_stage: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_update_reward_per_stage">update_reward_per_stage</a>(
    chain: &<a href="">signer</a>, reward_per_stage: u64
) <b>acquires</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);

    <b>let</b> vault_store = <b>borrow_global_mut</b>&lt;<a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>assert</b>!(
        reward_per_stage &gt; 0,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_EINVALID_REWARD_PER_STAGE">EINVALID_REWARD_PER_STAGE</a>)
    );
    vault_store.reward_per_stage = reward_per_stage;
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_per_stage"></a>

## Function `reward_per_stage`



<pre><code><b>public</b> <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_per_stage">reward_per_stage</a>(): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_per_stage">reward_per_stage</a>(): u64 <b>acquires</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a> {
    <b>let</b> vault_store = <b>borrow_global</b>&lt;<a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    vault_store.reward_per_stage
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_metadata"></a>

## Function `reward_metadata`



<pre><code><b>public</b> <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_metadata">reward_metadata</a>(): <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_metadata">reward_metadata</a>(): Object&lt;Metadata&gt; {
    <a href="_metadata">coin::metadata</a>(@initia_std, <a href="_utf8">string::utf8</a>(b"uinit"))
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_get_vault_store_address"></a>

## Function `get_vault_store_address`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_get_vault_store_address">get_vault_store_address</a>(): <b>address</b>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_get_vault_store_address">get_vault_store_address</a>(): <b>address</b> <b>acquires</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a> {
    <b>borrow_global</b>&lt;<a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>).vault_store_addr
}
</code></pre>
