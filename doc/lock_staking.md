
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::lock_staking`



-  [Struct `DepositDelegationEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DepositDelegationEvent)
-  [Struct `WithdrawDelegationEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_WithdrawDelegationEvent)
-  [Struct `LockedDelegationResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse)
-  [Struct `DelegationBalanceResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationBalanceResponse)
-  [Resource `StakingAccount`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount)
-  [Struct `DelegationKey`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationKey)
-  [Struct `LockedShareKey`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedShareKey)
-  [Resource `ModuleStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore)
-  [Struct `MsgDelegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgDelegate)
-  [Struct `MsgBeginRedelegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgBeginRedelegate)
-  [Struct `MsgUndelegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgUndelegate)
-  [Struct `MsgWithdrawDelegatorReward`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgWithdrawDelegatorReward)
-  [Struct `DelegationRequest`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationRequest)
-  [Struct `DelegationResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationResponse)
-  [Struct `DelegationResponseInner`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationResponseInner)
-  [Struct `UnbondingDelegationRequest`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationRequest)
-  [Struct `UnbondingDelegationResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationResponse)
-  [Struct `RedelegationsRequest`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationsRequest)
-  [Struct `TotalDelegationBalanceRequest`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceRequest)
-  [Struct `TotalDelegationBalanceRequestV2`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceRequestV2)
-  [Struct `TotalDelegationBalanceResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceResponse)
-  [Struct `RedelegationsResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationsResponse)
-  [Struct `Delegation`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Delegation)
-  [Struct `Coin`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin)
-  [Struct `DecCoin`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DecCoin)
-  [Struct `UnbondingDelegation`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegation)
-  [Struct `UnbondingDelegationEntry`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationEntry)
-  [Struct `RedelegationResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationResponse)
-  [Struct `Redelegation`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Redelegation)
-  [Struct `RedelegationEntry`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntry)
-  [Struct `RedelegationEntryResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntryResponse)
-  [Struct `PageResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_PageResponse)
-  [Constants](#@Constants_0)
-  [Function `update_params`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_update_params)
-  [Function `withdraw_delegator_reward`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_delegator_reward)
-  [Function `vote_gov_proposal`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_vote_gov_proposal)
-  [Function `withdraw_asset`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset)
-  [Function `withdraw_asset_for_staking_account`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account)
-  [Function `delegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate)
-  [Function `provide_delegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_provide_delegate)
-  [Function `single_asset_provide_delegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_single_asset_provide_delegate)
-  [Function `stableswap_provide_delegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_stableswap_provide_delegate)
-  [Function `redelegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate)
-  [Function `undelegate`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate)
-  [Function `extend`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_extend)
-  [Function `batch_extend`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_batch_extend)
-  [Function `delegate_internal`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal)
-  [Function `delegate_hook`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_hook)
-  [Function `redelegate_hook`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook)
-  [Function `redelegate_hook_v2`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook_v2)
-  [Function `undelegate_hook`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate_hook)
-  [Function `is_registered`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_is_registered)
-  [Function `unpack_locked_delegation`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_unpack_locked_delegation)
-  [Function `get_lock_period_limits`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_lock_period_limits)
-  [Function `get_staking_address`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address)
-  [Function `get_locked_delegations`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_delegations)
-  [Function `get_bonded_locked_delegations`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_bonded_locked_delegations)
-  [Function `get_total_delegation_balance`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_total_delegation_balance)


<pre><code><b>use</b> <a href="">0x1::address</a>;
<b>use</b> <a href="">0x1::bcs</a>;
<b>use</b> <a href="">0x1::bigdecimal</a>;
<b>use</b> <a href="">0x1::block</a>;
<b>use</b> <a href="">0x1::coin</a>;
<b>use</b> <a href="">0x1::cosmos</a>;
<b>use</b> <a href="">0x1::dex</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::fungible_asset</a>;
<b>use</b> <a href="">0x1::json</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::query</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::simple_map</a>;
<b>use</b> <a href="">0x1::stableswap</a>;
<b>use</b> <a href="">0x1::staking</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::table</a>;
<b>use</b> <a href="">0x1::table_key</a>;
<b>use</b> <a href="">0x1::type_info</a>;
<b>use</b> <a href="">0x1::vector</a>;
<b>use</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DepositDelegationEvent"></a>

## Struct `DepositDelegationEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DepositDelegationEvent">DepositDelegationEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>staking_account: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>release_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>validator: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>locked_share: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_WithdrawDelegationEvent"></a>

## Struct `WithdrawDelegationEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_WithdrawDelegationEvent">WithdrawDelegationEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>staking_account: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>release_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>validator: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>locked_share: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse"></a>

## Struct `LockedDelegationResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse">LockedDelegationResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>validator: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>locked_share: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>amount: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>release_time: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationBalanceResponse"></a>

## Struct `DelegationBalanceResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationBalanceResponse">DelegationBalanceResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>addr: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>staking_account: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount"></a>

## Resource `StakingAccount`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>extend_ref: <a href="_ExtendRef">object::ExtendRef</a></code>
</dt>
<dd>

</dd>
<dt>
<code>last_height: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>validators: <a href="_Table">table::Table</a>&lt;<a href="_String">string::String</a>, u16&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>delegations: <a href="_Table">table::Table</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationKey">lock_staking::DelegationKey</a>, <a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>total_locked_shares: <a href="_Table">table::Table</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedShareKey">lock_staking::LockedShareKey</a>, <a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationKey"></a>

## Struct `DelegationKey`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationKey">DelegationKey</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>release_time: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>validator: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedShareKey"></a>

## Struct `LockedShareKey`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedShareKey">LockedShareKey</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>validator: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore"></a>

## Resource `ModuleStore`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>min_lock_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>max_lock_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>max_delegation_slot: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgDelegate"></a>

## Struct `MsgDelegate`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgDelegate">MsgDelegate</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>_type_: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
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
<code>amount: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgBeginRedelegate"></a>

## Struct `MsgBeginRedelegate`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgBeginRedelegate">MsgBeginRedelegate</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>_type_: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>delegator_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>validator_src_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>validator_dst_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>amount: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgUndelegate"></a>

## Struct `MsgUndelegate`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgUndelegate">MsgUndelegate</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>_type_: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
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
<code>amount: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgWithdrawDelegatorReward"></a>

## Struct `MsgWithdrawDelegatorReward`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgWithdrawDelegatorReward">MsgWithdrawDelegatorReward</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>_type_: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
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
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationRequest"></a>

## Struct `DelegationRequest`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationRequest">DelegationRequest</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>validator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>delegator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationResponse"></a>

## Struct `DelegationResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationResponse">DelegationResponse</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>delegation_response: <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationResponseInner">lock_staking::DelegationResponseInner</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationResponseInner"></a>

## Struct `DelegationResponseInner`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationResponseInner">DelegationResponseInner</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>delegation: <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Delegation">lock_staking::Delegation</a></code>
</dt>
<dd>

</dd>
<dt>
<code>balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationRequest"></a>

## Struct `UnbondingDelegationRequest`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationRequest">UnbondingDelegationRequest</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>validator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationResponse"></a>

## Struct `UnbondingDelegationResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationResponse">UnbondingDelegationResponse</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>unbond: <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegation">lock_staking::UnbondingDelegation</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationsRequest"></a>

## Struct `RedelegationsRequest`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationsRequest">RedelegationsRequest</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>src_validator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>dst_validator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceRequest"></a>

## Struct `TotalDelegationBalanceRequest`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceRequest">TotalDelegationBalanceRequest</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceRequestV2"></a>

## Struct `TotalDelegationBalanceRequestV2`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceRequestV2">TotalDelegationBalanceRequestV2</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_addr: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>status: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceResponse"></a>

## Struct `TotalDelegationBalanceResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TotalDelegationBalanceResponse">TotalDelegationBalanceResponse</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationsResponse"></a>

## Struct `RedelegationsResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationsResponse">RedelegationsResponse</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>redelegation_responses: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationResponse">lock_staking::RedelegationResponse</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>pagination: <a href="_Option">option::Option</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_PageResponse">lock_staking::PageResponse</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Delegation"></a>

## Struct `Delegation`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Delegation">Delegation</a> <b>has</b> <b>copy</b>, drop, store
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
<code>shares: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DecCoin">lock_staking::DecCoin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin"></a>

## Struct `Coin`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">Coin</a> <b>has</b> <b>copy</b>, drop, store
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


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DecCoin"></a>

## Struct `DecCoin`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DecCoin">DecCoin</a> <b>has</b> <b>copy</b>, drop, store
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


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegation"></a>

## Struct `UnbondingDelegation`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegation">UnbondingDelegation</a> <b>has</b> <b>copy</b>, drop, store
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
<code>entries: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationEntry">lock_staking::UnbondingDelegationEntry</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationEntry"></a>

## Struct `UnbondingDelegationEntry`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationEntry">UnbondingDelegationEntry</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>creation_height: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>completion_time: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>initial_balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>unbonding_id: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>unbonding_on_hold_ref_count: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationResponse"></a>

## Struct `RedelegationResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationResponse">RedelegationResponse</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>redelegation: <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Redelegation">lock_staking::Redelegation</a></code>
</dt>
<dd>

</dd>
<dt>
<code>entries: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntryResponse">lock_staking::RedelegationEntryResponse</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Redelegation"></a>

## Struct `Redelegation`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Redelegation">Redelegation</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>delegator_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>validator_src_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>validator_dst_address: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>entries: <a href="_Option">option::Option</a>&lt;<a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntry">lock_staking::RedelegationEntry</a>&gt;&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntry"></a>

## Struct `RedelegationEntry`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntry">RedelegationEntry</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>creation_height: u32</code>
</dt>
<dd>

</dd>
<dt>
<code>completion_time: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>initial_balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>shares_dst: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DecCoin">lock_staking::DecCoin</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>unbonding_id: u32</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntryResponse"></a>

## Struct `RedelegationEntryResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntryResponse">RedelegationEntryResponse</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>redelegation_entry: <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_RedelegationEntry">lock_staking::RedelegationEntry</a></code>
</dt>
<dd>

</dd>
<dt>
<code>balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">lock_staking::Coin</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_PageResponse"></a>

## Struct `PageResponse`



<pre><code><b>struct</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_PageResponse">PageResponse</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>next_key: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>total: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EUNAUTHORIZED"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EUNAUTHORIZED">EUNAUTHORIZED</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDEPRECATED"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDEPRECATED">EDEPRECATED</a>: u64 = 256;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_ENOUGH_BALANCE"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_ENOUGH_BALANCE">ENOT_ENOUGH_BALANCE</a>: u64 = 7;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDELEGATION_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDELEGATION_NOT_FOUND">EDELEGATION_NOT_FOUND</a>: u64 = 2;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DELEGATING_AMOUNT"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DELEGATING_AMOUNT">DELEGATING_AMOUNT</a>: u64 = 1000;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ECREATION_HEIGHT_MISMATCH"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ECREATION_HEIGHT_MISMATCH">ECREATION_HEIGHT_MISMATCH</a>: u64 = 4;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDENOM_MISMATCH"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDENOM_MISMATCH">EDENOM_MISMATCH</a>: u64 = 6;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EINVALID_ARGS_LENGTH"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EINVALID_ARGS_LENGTH">EINVALID_ARGS_LENGTH</a>: u64 = 16;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EINVALID_MIN_MAX"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EINVALID_MIN_MAX">EINVALID_MIN_MAX</a>: u64 = 15;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EMAX_LOCK_PERIOD"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EMAX_LOCK_PERIOD">EMAX_LOCK_PERIOD</a>: u64 = 12;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EMAX_SLOT"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EMAX_SLOT">EMAX_SLOT</a>: u64 = 13;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_ENOUGH_DELEGATION"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_ENOUGH_DELEGATION">ENOT_ENOUGH_DELEGATION</a>: u64 = 11;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_RELEASE"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_RELEASE">ENOT_RELEASE</a>: u64 = 9;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_SINGLE_COIN"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_SINGLE_COIN">ENOT_SINGLE_COIN</a>: u64 = 5;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EREDELEGATION_LENGTH"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EREDELEGATION_LENGTH">EREDELEGATION_LENGTH</a>: u64 = 3;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EREENTER"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EREENTER">EREENTER</a>: u64 = 10;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ESMALL_RELEASE_TIME"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ESMALL_RELEASE_TIME">ESMALL_RELEASE_TIME</a>: u64 = 8;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EZERO_AMOUNT"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EZERO_AMOUNT">EZERO_AMOUNT</a>: u64 = 14;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TEST_RELEASE_PERIOD"></a>



<pre><code><b>const</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_TEST_RELEASE_PERIOD">TEST_RELEASE_PERIOD</a>: u64 = 1000;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_update_params"></a>

## Function `update_params`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_update_params">update_params</a>(chain: &<a href="">signer</a>, min_lock_period: <a href="_Option">option::Option</a>&lt;u64&gt;, max_lock_period: <a href="_Option">option::Option</a>&lt;u64&gt;, max_delegation_slot: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_update_params">update_params</a>(
    chain: &<a href="">signer</a>,
    min_lock_period: Option&lt;u64&gt;,
    max_lock_period: Option&lt;u64&gt;,
    max_delegation_slot: Option&lt;u64&gt;
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);

    <b>if</b> (<a href="_is_some">option::is_some</a>(&min_lock_period)) {
        module_store.min_lock_period = <a href="_extract">option::extract</a>(&<b>mut</b> min_lock_period);
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&max_lock_period)) {
        module_store.max_lock_period = <a href="_extract">option::extract</a>(&<b>mut</b> max_lock_period);
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&max_delegation_slot)) {
        module_store.max_delegation_slot = <a href="_extract">option::extract</a>(&<b>mut</b> max_delegation_slot);
    };

    <b>assert</b>!(
        module_store.max_lock_period &gt; module_store.min_lock_period,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EINVALID_MIN_MAX">EINVALID_MIN_MAX</a>)
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_delegator_reward"></a>

## Function `withdraw_delegator_reward`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_delegator_reward">withdraw_delegator_reward</a>(<a href="">account</a>: &<a href="">signer</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_delegator_reward">withdraw_delegator_reward</a>(<a href="">account</a>: &<a href="">signer</a>) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(&staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);

    <b>let</b> iter =
        <a href="_iter">table::iter</a>(
            &staking_account.validators,
            <a href="_none">option::none</a>(),
            <a href="_none">option::none</a>(),
            1
        );

    <b>loop</b> {
        <b>if</b> (!<a href="_prepare">table::prepare</a>&lt;String, u16&gt;(iter)) { <b>break</b> };
        <b>let</b> (validator, _) = <a href="_next">table::next</a>&lt;String, u16&gt;(iter);
        // execute withdraw delegator reward for each validator
        <b>let</b> msg = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgWithdrawDelegatorReward">MsgWithdrawDelegatorReward</a> {
            _type_: <a href="_utf8">string::utf8</a>(
                b"/<a href="">cosmos</a>.distribution.v1beta1.<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgWithdrawDelegatorReward">MsgWithdrawDelegatorReward</a>"
            ),
            delegator_address: to_sdk(staking_account_addr),
            validator_address: validator
        };
        stargate(&staking_account_signer, marshal(&msg))
    };

    // withdraw uinit from <a href="">staking</a> <a href="">account</a>
    move_execute(
        &staking_account_signer,
        @<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>,
        <a href="_utf8">string::utf8</a>(b"<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking">lock_staking</a>"),
        <a href="_utf8">string::utf8</a>(b"withdraw_asset_for_staking_account"),
        <a href="">vector</a>[],
        <a href="">vector</a>[
            to_bytes(&<a href="_metadata">coin::metadata</a>(@initia_std, <a href="_utf8">string::utf8</a>(b"uinit"))),
            to_bytes(&<a href="_none">option::none</a>&lt;u64&gt;())
        ]
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_vote_gov_proposal"></a>

## Function `vote_gov_proposal`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_vote_gov_proposal">vote_gov_proposal</a>(<a href="">account</a>: &<a href="">signer</a>, proposal_id: u64, <a href="">option</a>: u64, metadata: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_vote_gov_proposal">vote_gov_proposal</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    proposal_id: u64,
    <a href="">option</a>: u64,
    metadata: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> addr = <a href="_address_of">signer::address_of</a>(<a href="">account</a>);
    <b>if</b> (!<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_is_registered">is_registered</a>(addr)) { <b>return</b> };

    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(&staking_account_signer);
    stargate_vote(
        &staking_account_signer,
        proposal_id,
        to_sdk(staking_account_addr),
        <a href="">option</a>,
        metadata
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset"></a>

## Function `withdraw_asset`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset">withdraw_asset</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, amount: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset">withdraw_asset</a>(
    <a href="">account</a>: &<a href="">signer</a>, metadata: Object&lt;Metadata&gt;, amount: Option&lt;u64&gt;
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account">withdraw_asset_for_staking_account</a>(&staking_account_signer, metadata, amount);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account"></a>

## Function `withdraw_asset_for_staking_account`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account">withdraw_asset_for_staking_account</a>(staking_account_signer: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, amount: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account">withdraw_asset_for_staking_account</a>(
    staking_account_signer: &<a href="">signer</a>, metadata: Object&lt;Metadata&gt;, amount: Option&lt;u64&gt;
) {
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(staking_account_signer);
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_assert_staking_account">assert_staking_account</a>(staking_account_addr);
    <b>let</b> <a href="">object</a> = <a href="_address_to_object">object::address_to_object</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);
    <b>let</b> owner = <a href="_owner">object::owner</a>(<a href="">object</a>);

    <b>let</b> balance = <a href="_balance">coin::balance</a>(staking_account_addr, metadata);

    <b>let</b> withdraw_amount =
        <b>if</b> (<a href="_is_none">option::is_none</a>(&amount)) {
            balance
        } <b>else</b> {
            <b>let</b> withdraw_amount = *<a href="_borrow">option::borrow</a>(&amount);
            <b>assert</b>!(withdraw_amount &gt; 0, <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EZERO_AMOUNT">EZERO_AMOUNT</a>));
            <b>assert</b>!(
                withdraw_amount &lt;= balance,
                <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_ENOUGH_BALANCE">ENOT_ENOUGH_BALANCE</a>)
            );
            withdraw_amount
        };

    <b>if</b> (withdraw_amount == 0) { <b>return</b> };

    <a href="_transfer">coin::transfer</a>(
        staking_account_signer,
        owner,
        metadata,
        withdraw_amount
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate"></a>

## Function `delegate`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate">delegate</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, amount: u64, release_time: u64, validator_address: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate">delegate</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    amount: u64,
    release_time: u64,
    validator_address: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> fa = <a href="_withdraw">coin::withdraw</a>(<a href="">account</a>, metadata, amount);
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal">delegate_internal</a>(<a href="">account</a>, fa, release_time, validator_address);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_provide_delegate"></a>

## Function `provide_delegate`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_provide_delegate">provide_delegate</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, coin_a_amount_in: u64, coin_b_amount_in: u64, min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;, release_time: u64, validator_address: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_provide_delegate">provide_delegate</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    coin_a_amount_in: u64,
    coin_b_amount_in: u64,
    min_liquidity: Option&lt;u64&gt;,
    release_time: u64,
    validator_address: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> pair = <a href="_convert">object::convert</a>(metadata);
    <b>let</b> (coin_a_amount_in, coin_b_amount_in) =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_exact_provide_amount">get_exact_provide_amount</a>(pair, coin_a_amount_in, coin_b_amount_in);
    <b>let</b> (metadata_a, metadata_b) = <a href="_pool_metadata">dex::pool_metadata</a>(pair);
    <b>let</b> coin_a = <a href="_withdraw">coin::withdraw</a>(<a href="">account</a>, metadata_a, coin_a_amount_in);
    <b>let</b> coin_b = <a href="_withdraw">coin::withdraw</a>(<a href="">account</a>, metadata_b, coin_b_amount_in);
    <b>let</b> fa = <a href="_provide_liquidity">dex::provide_liquidity</a>(pair, coin_a, coin_b, min_liquidity);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal">delegate_internal</a>(<a href="">account</a>, fa, release_time, validator_address);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_single_asset_provide_delegate"></a>

## Function `single_asset_provide_delegate`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_single_asset_provide_delegate">single_asset_provide_delegate</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, offer_asset_metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, amount_in: u64, min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;, release_time: u64, validator_address: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_single_asset_provide_delegate">single_asset_provide_delegate</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    offer_asset_metadata: Object&lt;Metadata&gt;,
    amount_in: u64,
    min_liquidity: Option&lt;u64&gt;,
    release_time: u64,
    validator_address: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> pair = <a href="_convert">object::convert</a>(metadata);
    <b>let</b> fa =
        <a href="_single_asset_provide_liquidity">dex::single_asset_provide_liquidity</a>(
            pair,
            <a href="_withdraw">coin::withdraw</a>(<a href="">account</a>, offer_asset_metadata, amount_in),
            min_liquidity
        );

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal">delegate_internal</a>(<a href="">account</a>, fa, release_time, validator_address);

}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_stableswap_provide_delegate"></a>

## Function `stableswap_provide_delegate`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_stableswap_provide_delegate">stableswap_provide_delegate</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, coin_amounts: <a href="">vector</a>&lt;u64&gt;, min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;, release_time: u64, validator_address: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_stableswap_provide_delegate">stableswap_provide_delegate</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    coin_amounts: <a href="">vector</a>&lt;u64&gt;,
    min_liquidity: Option&lt;u64&gt;,
    release_time: u64,
    validator_address: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> pool = <a href="_convert">object::convert</a>(metadata);
    <b>let</b> (coin_metadata, _, _, _) = <a href="_pool_info">stableswap::pool_info</a>(pool);
    <b>let</b> coins: <a href="">vector</a>&lt;FungibleAsset&gt; = <a href="">vector</a>[];

    <b>let</b> i = 0;
    <b>let</b> n = <a href="_length">vector::length</a>(&coin_amounts);
    <b>while</b> (i &lt; n) {
        <b>let</b> metadata = *<a href="_borrow">vector::borrow</a>(&coin_metadata, i);
        <b>let</b> amount = *<a href="_borrow">vector::borrow</a>(&coin_amounts, i);
        <a href="_push_back">vector::push_back</a>(
            &<b>mut</b> coins,
            <a href="_withdraw">coin::withdraw</a>(<a href="">account</a>, metadata, amount)
        );
        i = i + 1;
    };

    <b>let</b> fa = <a href="_provide_liquidity">stableswap::provide_liquidity</a>(pool, coins, min_liquidity);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal">delegate_internal</a>(<a href="">account</a>, fa, release_time, validator_address);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate"></a>

## Function `redelegate`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate">redelegate</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, amount: <a href="_Option">option::Option</a>&lt;u64&gt;, src_release_time: u64, validator_src_address: <a href="_String">string::String</a>, dst_release_time: u64, validator_dst_address: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate">redelegate</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    amount: Option&lt;u64&gt;, // <b>if</b> none, redelegate all
    src_release_time: u64,
    validator_src_address: String,
    dst_release_time: u64,
    validator_dst_address: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(&staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_reentry_check">reentry_check</a>(staking_account, <b>true</b>);
    <b>assert</b>!(
        dst_release_time &gt;= src_release_time,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ESMALL_RELEASE_TIME">ESMALL_RELEASE_TIME</a>)
    );
    // get current delegation shares
    <b>let</b> src_delegation =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_delegation">get_delegation</a>(
            staking_account,
            validator_src_address,
            staking_account_addr,
            <b>false</b>
        );
    <b>let</b> locked_share =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_share">get_locked_share</a>(
            staking_account,
            metadata,
            src_release_time,
            validator_src_address
        );
    <b>let</b> src_share_before =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_share">get_share</a>(
            &src_delegation.delegation.shares,
            <a href="_metadata_to_denom">coin::metadata_to_denom</a>(metadata),
            <b>true</b>
        );
    <b>let</b> dst_delegation =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_delegation">get_delegation</a>(
            staking_account,
            validator_dst_address,
            staking_account_addr,
            <b>false</b>
        );
    <b>let</b> dst_share_before =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_share">get_share</a>(
            &dst_delegation.delegation.shares,
            <a href="_metadata_to_denom">coin::metadata_to_denom</a>(metadata),
            <b>false</b>
        );
    <b>let</b> locked_amount =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_locked_share_to_amount">locked_share_to_amount</a>(
            staking_account,
            validator_src_address,
            metadata,
            &src_share_before,
            &locked_share
        );

    // get redelegate amount and share before
    <b>let</b> (amount, src_share_before) =
        <b>if</b> (<a href="_is_none">option::is_none</a>(&amount)) {
            // redelegate all
            (locked_amount, <a href="_none">option::none</a>())
        } <b>else</b> {
            <b>let</b> redelegate_amount = <a href="_extract">option::extract</a>(&<b>mut</b> amount);
            <b>assert</b>!(redelegate_amount &gt; 0, <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EZERO_AMOUNT">EZERO_AMOUNT</a>));
            <b>assert</b>!(
                locked_amount &gt;= redelegate_amount,
                <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_ENOUGH_DELEGATION">ENOT_ENOUGH_DELEGATION</a>)
            );

            <b>if</b> (redelegate_amount == locked_amount) {
                (locked_amount, <a href="_none">option::none</a>())
            } <b>else</b> {
                (redelegate_amount, <a href="_some">option::some</a>(src_share_before))
            }
        };

    // execute begin redelegate
    <b>let</b> <a href="">coin</a> = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_create_coin">create_coin</a>(metadata, amount);
    <b>let</b> msg = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgBeginRedelegate">MsgBeginRedelegate</a> {
        _type_: <a href="_utf8">string::utf8</a>(b"/initia.mstaking.v1.<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgBeginRedelegate">MsgBeginRedelegate</a>"),
        delegator_address: to_sdk(staking_account_addr),
        validator_src_address,
        validator_dst_address,
        amount: <a href="">vector</a>[<a href="">coin</a>]
    };

    stargate(&staking_account_signer, marshal(&msg));

    // execute redelegate hook
    move_execute(
        &staking_account_signer,
        @<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>,
        <a href="_utf8">string::utf8</a>(b"<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking">lock_staking</a>"),
        <a href="_utf8">string::utf8</a>(b"redelegate_hook_v2"),
        <a href="">vector</a>[],
        <a href="">vector</a>[
            to_bytes(&metadata),
            to_bytes(&src_release_time),
            to_bytes(&validator_src_address),
            to_bytes(&src_share_before),
            to_bytes(&dst_release_time),
            to_bytes(&validator_dst_address),
            to_bytes(&dst_share_before)
        ]
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate"></a>

## Function `undelegate`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate">undelegate</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, amount: <a href="_Option">option::Option</a>&lt;u64&gt;, release_time: u64, validator: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate">undelegate</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    amount: Option&lt;u64&gt;, // <b>if</b> none, undelegte all
    release_time: u64,
    validator: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(&staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_reentry_check">reentry_check</a>(staking_account, <b>true</b>);

    // check can undelegate
    <b>let</b> (_, curr_time) = <a href="_get_block_info">block::get_block_info</a>();
    <b>assert</b>!(
        curr_time &gt; release_time,
        <a href="_invalid_state">error::invalid_state</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_RELEASE">ENOT_RELEASE</a>)
    );
    // get current delegation share
    <b>let</b> delegation =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_delegation">get_delegation</a>(
            staking_account,
            validator,
            staking_account_addr,
            <b>false</b>
        );
    <b>let</b> locked_share =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_share">get_locked_share</a>(
            staking_account,
            metadata,
            release_time,
            validator
        );
    <b>let</b> share_before =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_share">get_share</a>(
            &delegation.delegation.shares,
            <a href="_metadata_to_denom">coin::metadata_to_denom</a>(metadata),
            <b>true</b>
        );

    <b>let</b> locked_amount =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_locked_share_to_amount">locked_share_to_amount</a>(
            staking_account,
            validator,
            metadata,
            &share_before,
            &locked_share
        );

    // get undelegate amount and share before
    <b>let</b> (amount, share_before) =
        <b>if</b> (<a href="_is_none">option::is_none</a>(&amount)) {
            // undelegate all
            (locked_amount, <a href="_none">option::none</a>())
        } <b>else</b> {
            <b>let</b> undelegate_amount = <a href="_extract">option::extract</a>(&<b>mut</b> amount);
            <b>assert</b>!(undelegate_amount &gt; 0, <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EZERO_AMOUNT">EZERO_AMOUNT</a>));
            <b>assert</b>!(
                locked_amount &gt;= undelegate_amount,
                <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_ENOUGH_DELEGATION">ENOT_ENOUGH_DELEGATION</a>)
            );

            <b>if</b> (undelegate_amount == locked_amount) {
                (locked_amount, <a href="_none">option::none</a>())
            } <b>else</b> {
                (undelegate_amount, <a href="_some">option::some</a>(share_before))
            }
        };

    // execute undelegate
    <b>let</b> <a href="">coin</a> = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_create_coin">create_coin</a>(metadata, amount);
    <b>let</b> msg = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgUndelegate">MsgUndelegate</a> {
        _type_: <a href="_utf8">string::utf8</a>(b"/initia.mstaking.v1.<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgUndelegate">MsgUndelegate</a>"),
        delegator_address: to_sdk(staking_account_addr),
        validator_address: validator,
        amount: <a href="">vector</a>[<a href="">coin</a>]
    };

    stargate(&staking_account_signer, marshal(&msg));

    // execute undelegate hook
    move_execute(
        &staking_account_signer,
        @<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>,
        <a href="_utf8">string::utf8</a>(b"<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking">lock_staking</a>"),
        <a href="_utf8">string::utf8</a>(b"undelegate_hook"),
        <a href="">vector</a>[],
        <a href="">vector</a>[
            to_bytes(&metadata),
            to_bytes(&release_time),
            to_bytes(&validator),
            to_bytes(&share_before)
        ]
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_extend"></a>

## Function `extend`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_extend">extend</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, amount: <a href="_Option">option::Option</a>&lt;u64&gt;, release_time: u64, validator: <a href="_String">string::String</a>, new_release_time: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_extend">extend</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    amount: Option&lt;u64&gt;, // <b>if</b> none, extend all
    release_time: u64,
    validator: String,
    new_release_time: u64
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(&staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_reentry_check">reentry_check</a>(staking_account, <b>false</b>);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_extend_internal">extend_internal</a>(
        staking_account_addr,
        staking_account,
        metadata,
        amount,
        release_time,
        validator,
        new_release_time
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_batch_extend"></a>

## Function `batch_extend`



<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_batch_extend">batch_extend</a>(<a href="">account</a>: &<a href="">signer</a>, metadata: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;&gt;, amounts: <a href="">vector</a>&lt;<a href="_Option">option::Option</a>&lt;u64&gt;&gt;, release_times: <a href="">vector</a>&lt;u64&gt;, validators: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, new_release_times: <a href="">vector</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_batch_extend">batch_extend</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    metadata: <a href="">vector</a>&lt;Object&lt;Metadata&gt;&gt;,
    amounts: <a href="">vector</a>&lt;Option&lt;u64&gt;&gt;, // <b>if</b> none, extend all
    release_times: <a href="">vector</a>&lt;u64&gt;,
    validators: <a href="">vector</a>&lt;String&gt;,
    new_release_times: <a href="">vector</a>&lt;u64&gt;
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(&staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_reentry_check">reentry_check</a>(staking_account, <b>false</b>);

    <b>let</b> len = <a href="_length">vector::length</a>(&metadata);
    <b>assert</b>!(
        len == <a href="_length">vector::length</a>(&amounts)
            && len == <a href="_length">vector::length</a>(&release_times)
            && len == <a href="_length">vector::length</a>(&validators)
            && len == <a href="_length">vector::length</a>(&new_release_times),
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EINVALID_ARGS_LENGTH">EINVALID_ARGS_LENGTH</a>)
    );

    <b>let</b> i = 0;
    <b>while</b> (i &lt; len) {
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_extend_internal">extend_internal</a>(
            staking_account_addr,
            staking_account,
            *<a href="_borrow">vector::borrow</a>(&metadata, i),
            *<a href="_borrow">vector::borrow</a>(&amounts, i),
            *<a href="_borrow">vector::borrow</a>(&release_times, i),
            *<a href="_borrow">vector::borrow</a>(&validators, i),
            *<a href="_borrow">vector::borrow</a>(&new_release_times, i)
        );
        i = i + 1;
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal"></a>

## Function `delegate_internal`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal">delegate_internal</a>(<a href="">account</a>: &<a href="">signer</a>, fa: <a href="_FungibleAsset">fungible_asset::FungibleAsset</a>, release_time: u64, validator_address: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_internal">delegate_internal</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    fa: FungibleAsset,
    release_time: u64,
    validator_address: String
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> (_, curr_time) = <a href="_get_block_info">block::get_block_info</a>();
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>assert</b>!(
        release_time &gt; curr_time + module_store.min_lock_period,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ESMALL_RELEASE_TIME">ESMALL_RELEASE_TIME</a>)
    );

    <b>let</b> staking_account_signer = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_account_signer">get_staking_account_signer</a>(<a href="">account</a>);
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(&staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_reentry_check">reentry_check</a>(staking_account, <b>true</b>);
    <b>let</b> metadata = <a href="_metadata_from_asset">fungible_asset::metadata_from_asset</a>(&fa);
    <b>let</b> amount = <a href="_amount">fungible_asset::amount</a>(&fa);
    <b>let</b> denom = <a href="_metadata_to_denom">coin::metadata_to_denom</a>(metadata);
    <b>let</b> <a href="">coin</a> = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">Coin</a> { denom, amount };

    // deposit token <b>to</b> <a href="">staking</a> <a href="">account</a> addr
    <a href="_deposit">coin::deposit</a>(staking_account_addr, fa);

    // delegate
    <b>let</b> msg = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgDelegate">MsgDelegate</a> {
        _type_: <a href="_utf8">string::utf8</a>(b"/initia.mstaking.v1.<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_MsgDelegate">MsgDelegate</a>"),
        delegator_address: to_sdk(staking_account_addr),
        validator_address,
        amount: <a href="">vector</a>[<a href="">coin</a>]
    };

    // execute hook
    <b>let</b> delegation =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_delegation">get_delegation</a>(
            staking_account,
            validator_address,
            staking_account_addr,
            <b>false</b>
        );

    <b>let</b> share_before = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_share">get_share</a>(&delegation.delegation.shares, denom, <b>false</b>);

    stargate(&staking_account_signer, marshal(&msg));

    move_execute(
        &staking_account_signer,
        @<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>,
        <a href="_utf8">string::utf8</a>(b"<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking">lock_staking</a>"),
        <a href="_utf8">string::utf8</a>(b"delegate_hook"),
        <a href="">vector</a>[],
        <a href="">vector</a>[
            to_bytes(&metadata),
            to_bytes(&release_time),
            to_bytes(&validator_address),
            to_bytes(&share_before)
        ]
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_hook"></a>

## Function `delegate_hook`



<pre><code>entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_hook">delegate_hook</a>(staking_account_signer: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, release_time: u64, validator: <a href="_String">string::String</a>, share_before: <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code>entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_hook">delegate_hook</a>(
    staking_account_signer: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    release_time: u64,
    validator: String,
    share_before: BigDecimal
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_assert_staking_account">assert_staking_account</a>(staking_account_addr);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_hook_internal">delegate_hook_internal</a>(
        staking_account,
        staking_account_addr,
        metadata,
        release_time,
        validator,
        share_before
    );

    // withdraw uinit from <a href="">staking</a> <a href="">account</a>
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account">withdraw_asset_for_staking_account</a>(
        staking_account_signer,
        <a href="_metadata">coin::metadata</a>(@initia_std, <a href="_utf8">string::utf8</a>(b"uinit")),
        <a href="_none">option::none</a>()
    );

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_unlock_reentry_check">unlock_reentry_check</a>(staking_account);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook"></a>

## Function `redelegate_hook`



<pre><code>#[deprecated]
entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook">redelegate_hook</a>(_staking_account_signer: &<a href="">signer</a>, _metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, _src_release_time: u64, _validator_src_address: <a href="_String">string::String</a>, _dst_release_time: u64, _validator_dst_address: <a href="_String">string::String</a>, _src_share_before: <a href="_Option">option::Option</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;)
</code></pre>



##### Implementation


<pre><code>entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook">redelegate_hook</a>(
    _staking_account_signer: &<a href="">signer</a>,
    _metadata: Object&lt;Metadata&gt;,
    _src_release_time: u64,
    _validator_src_address: String,
    _dst_release_time: u64,
    _validator_dst_address: String,
    _src_share_before: Option&lt;BigDecimal&gt; // <b>if</b> none, redelegate all
) {
    <b>abort</b>(<a href="_unavailable">error::unavailable</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDEPRECATED">EDEPRECATED</a>));
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook_v2"></a>

## Function `redelegate_hook_v2`



<pre><code>entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook_v2">redelegate_hook_v2</a>(staking_account_signer: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, src_release_time: u64, validator_src_address: <a href="_String">string::String</a>, src_share_before: <a href="_Option">option::Option</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;, dst_release_time: u64, validator_dst_address: <a href="_String">string::String</a>, dst_share_before: <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code>entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_redelegate_hook_v2">redelegate_hook_v2</a>(
    staking_account_signer: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    src_release_time: u64,
    validator_src_address: String,
    src_share_before: Option&lt;BigDecimal&gt;, // <b>if</b> none, redelegate all
    dst_release_time: u64,
    validator_dst_address: String,
    dst_share_before: BigDecimal
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_assert_staking_account">assert_staking_account</a>(staking_account_addr);

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate_hook_internal">undelegate_hook_internal</a>(
        staking_account,
        staking_account_addr,
        metadata,
        src_release_time,
        validator_src_address,
        src_share_before
    );
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_delegate_hook_internal">delegate_hook_internal</a>(
        staking_account,
        staking_account_addr,
        metadata,
        dst_release_time,
        validator_dst_address,
        dst_share_before
    );

    // withdraw uinit from <a href="">staking</a> <a href="">account</a>
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account">withdraw_asset_for_staking_account</a>(
        staking_account_signer,
        <a href="_metadata">coin::metadata</a>(@initia_std, <a href="_utf8">string::utf8</a>(b"uinit")),
        <a href="_none">option::none</a>()
    );

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_unlock_reentry_check">unlock_reentry_check</a>(staking_account);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate_hook"></a>

## Function `undelegate_hook`



<pre><code>entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate_hook">undelegate_hook</a>(staking_account_signer: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, release_time: u64, validator: <a href="_String">string::String</a>, share_before: <a href="_Option">option::Option</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;)
</code></pre>



##### Implementation


<pre><code>entry <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate_hook">undelegate_hook</a>(
    staking_account_signer: &<a href="">signer</a>,
    metadata: Object&lt;Metadata&gt;,
    release_time: u64,
    validator: String,
    share_before: Option&lt;BigDecimal&gt; // <b>if</b> none, undelegate all
) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> staking_account_addr = <a href="_address_of">signer::address_of</a>(staking_account_signer);
    <b>let</b> staking_account = <b>borrow_global_mut</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr);
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_assert_staking_account">assert_staking_account</a>(staking_account_addr);

    <b>let</b> (height, _) = <a href="_get_block_info">block::get_block_info</a>();
    <b>let</b> denom = <a href="_metadata_to_denom">coin::metadata_to_denom</a>(metadata);

    // get undelegation
    <b>let</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_UnbondingDelegationResponse">UnbondingDelegationResponse</a> { unbond } =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_unbonding_delegation">get_unbonding_delegation</a>(staking_account_addr, validator);

    // the last entry is the most recent creation
    <b>let</b> unbond_entry = <a href="_pop_back">vector::pop_back</a>(&<b>mut</b> unbond.entries);

    // check unbond <b>to</b> check <a href="">query</a> ordering changed
    <b>assert</b>!(
        unbond_entry.creation_height == height,
        <a href="_internal">error::internal</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ECREATION_HEIGHT_MISMATCH">ECREATION_HEIGHT_MISMATCH</a>)
    );
    <b>assert</b>!(
        <a href="_length">vector::length</a>(&unbond_entry.initial_balance) == 1,
        <a href="_internal">error::internal</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ENOT_SINGLE_COIN">ENOT_SINGLE_COIN</a>)
    );
    <b>let</b> initial_balance = <a href="_borrow">vector::borrow</a>(&unbond_entry.initial_balance, 0);
    <b>assert</b>!(
        initial_balance.denom == denom,
        <a href="_internal">error::internal</a>(<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_EDENOM_MISMATCH">EDENOM_MISMATCH</a>)
    );

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_undelegate_hook_internal">undelegate_hook_internal</a>(
        staking_account,
        staking_account_addr,
        metadata,
        release_time,
        validator,
        share_before
    );

    // withdraw uinit from <a href="">staking</a> <a href="">account</a>
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_withdraw_asset_for_staking_account">withdraw_asset_for_staking_account</a>(
        staking_account_signer,
        <a href="_metadata">coin::metadata</a>(@initia_std, <a href="_utf8">string::utf8</a>(b"uinit")),
        <a href="_none">option::none</a>()
    );

    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_unlock_reentry_check">unlock_reentry_check</a>(staking_account);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_is_registered"></a>

## Function `is_registered`



<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_is_registered">is_registered</a>(addr: <b>address</b>): bool
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_is_registered">is_registered</a>(addr: <b>address</b>): bool {
    <b>let</b> staking_account_addr = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address">get_staking_address</a>(addr);
    <b>exists</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_unpack_locked_delegation"></a>

## Function `unpack_locked_delegation`



<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_unpack_locked_delegation">unpack_locked_delegation</a>(locked_delegation: &<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse">lock_staking::LockedDelegationResponse</a>): (<a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, <a href="_String">string::String</a>, u64, u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_unpack_locked_delegation">unpack_locked_delegation</a>(
    locked_delegation: &<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse">LockedDelegationResponse</a>
): (Object&lt;Metadata&gt;, String, u64, u64) {
    (
        locked_delegation.metadata,
        locked_delegation.validator,
        locked_delegation.amount,
        locked_delegation.release_time
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_lock_period_limits"></a>

## Function `get_lock_period_limits`



<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_lock_period_limits">get_lock_period_limits</a>(): (u64, u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_lock_period_limits">get_lock_period_limits</a>(): (u64, u64) <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    (module_store.min_lock_period, module_store.max_lock_period)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address"></a>

## Function `get_staking_address`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address">get_staking_address</a>(addr: <b>address</b>): <b>address</b>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address">get_staking_address</a>(addr: <b>address</b>): <b>address</b> {
    <a href="_create_object_address">object::create_object_address</a>(
        &addr,
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_generate_staking_account_seed">generate_staking_account_seed</a>(<b>copy</b> addr)
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_delegations"></a>

## Function `get_locked_delegations`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_delegations">get_locked_delegations</a>(addr: <b>address</b>): <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse">lock_staking::LockedDelegationResponse</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_delegations">get_locked_delegations</a>(
    addr: <b>address</b>
): <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse">LockedDelegationResponse</a>&gt; <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> res = <a href="">vector</a>[];
    <b>let</b> staking_account_addr = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address">get_staking_address</a>(addr);
    <b>if</b> (!<b>exists</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr)) {
        <b>return</b> res
    };
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_delegations_internal">get_locked_delegations_internal</a>(
        &<b>mut</b> res,
        staking_account_addr,
        <a href="_new">simple_map::new</a>(),
        |delegation_map, staking_account, validator, staking_account_addr| {
            <b>let</b> delegation =
                <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_delegation">get_delegation</a>(
                    staking_account,
                    validator,
                    staking_account_addr,
                    <b>false</b>
                );
            <a href="_add">simple_map::add</a>(delegation_map, validator, delegation);
            <b>false</b>
        }
    );

    res
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_bonded_locked_delegations"></a>

## Function `get_bonded_locked_delegations`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_bonded_locked_delegations">get_bonded_locked_delegations</a>(addr: <b>address</b>): <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse">lock_staking::LockedDelegationResponse</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_bonded_locked_delegations">get_bonded_locked_delegations</a>(
    addr: <b>address</b>
): <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_LockedDelegationResponse">LockedDelegationResponse</a>&gt; <b>acquires</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a> {
    <b>let</b> res = <a href="">vector</a>[];
    <b>let</b> staking_account_addr = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address">get_staking_address</a>(addr);
    <b>if</b> (!<b>exists</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(staking_account_addr)) {
        <b>return</b> res
    };

    <b>let</b> delegation_map = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_bonded_delegation_map">get_bonded_delegation_map</a>(staking_account_addr);
    <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_locked_delegations_internal">get_locked_delegations_internal</a>(
        &<b>mut</b> res,
        staking_account_addr,
        delegation_map,
        |_, _, _, _| { <b>true</b> }
    );

    res
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_total_delegation_balance"></a>

## Function `get_total_delegation_balance`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_total_delegation_balance">get_total_delegation_balance</a>(addr: <b>address</b>): <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationBalanceResponse">lock_staking::DelegationBalanceResponse</a>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_total_delegation_balance">get_total_delegation_balance</a>(addr: <b>address</b>): <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationBalanceResponse">DelegationBalanceResponse</a> {
    // check addr is <a href="">staking</a> <a href="">account</a>
    <b>let</b> (addr, staking_account) =
        <b>if</b> (<b>exists</b>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(addr)) {
            (<a href="_owner">object::owner</a>(<a href="_address_to_object">object::address_to_object</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_StakingAccount">StakingAccount</a>&gt;(addr)), addr)
        } <b>else</b> {
            (addr, <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_staking_address">get_staking_address</a>(addr))
        };

    <b>let</b> bonded = <a href="_utf8">string::utf8</a>(b"BOND_STATUS_BONDED");
    <b>let</b> addr_delegations = <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_delegator_delegation_balance">get_delegator_delegation_balance</a>(to_sdk(addr), bonded);
    <b>let</b> staking_account_delegations =
        <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_get_delegator_delegation_balance">get_delegator_delegation_balance</a>(to_sdk(staking_account), bonded);
    <b>let</b> balance_map = <a href="_new">simple_map::new</a>&lt;String, u64&gt;();

    <a href="_for_each_ref">vector::for_each_ref</a>(
        &addr_delegations.balance,
        |<a href="">coin</a>| {
            <b>if</b> (!<a href="_contains_key">simple_map::contains_key</a>(&balance_map, &<a href="">coin</a>.denom)) {
                <a href="_add">simple_map::add</a>(&<b>mut</b> balance_map, <a href="">coin</a>.denom, 0)
            };
            <b>let</b> amount = <a href="_borrow_mut">simple_map::borrow_mut</a>(&<b>mut</b> balance_map, &<a href="">coin</a>.denom);
            *amount = *amount + <a href="">coin</a>.amount
        }
    );

    <a href="_for_each_ref">vector::for_each_ref</a>(
        &staking_account_delegations.balance,
        |<a href="">coin</a>| {
            <b>if</b> (!<a href="_contains_key">simple_map::contains_key</a>(&balance_map, &<a href="">coin</a>.denom)) {
                <a href="_add">simple_map::add</a>(&<b>mut</b> balance_map, <a href="">coin</a>.denom, 0)
            };
            <b>let</b> amount = <a href="_borrow_mut">simple_map::borrow_mut</a>(&<b>mut</b> balance_map, &<a href="">coin</a>.denom);
            *amount = *amount + <a href="">coin</a>.amount
        }
    );

    <b>let</b> balance: <a href="">vector</a>&lt;<a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">Coin</a>&gt; = <a href="">vector</a>[];

    <a href="_for_each_ref">vector::for_each_ref</a>(
        &<a href="_keys">simple_map::keys</a>(&balance_map),
        |denom| {
            <a href="_push_back">vector::push_back</a>(
                &<b>mut</b> balance,
                <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_Coin">Coin</a> {
                    denom: *denom,
                    amount: *<a href="_borrow">simple_map::borrow</a>(&balance_map, denom)
                }
            );
        }
    );

    <b>return</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking_DelegationBalanceResponse">DelegationBalanceResponse</a> { addr, staking_account, balance }
}
</code></pre>
