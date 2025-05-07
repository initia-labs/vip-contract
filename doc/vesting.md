
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::vesting`



-  [Resource `ModuleStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore)
-  [Struct `VestingStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_VestingStore)
-  [Struct `UserVesting`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVesting)
-  [Struct `OperatorVesting`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVesting)
-  [Struct `UserVestingClaimInfo`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo)
-  [Struct `OperatorVestingClaimInfo`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo)
-  [Struct `UserVestingResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingResponse)
-  [Struct `OperatorVestingResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingResponse)
-  [Struct `UserVestingCreateEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingCreateEvent)
-  [Struct `OperatorVestingCreateEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingCreateEvent)
-  [Struct `UserVestingFinalizedEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingFinalizedEvent)
-  [Struct `OperatorVestingFinalizedEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingFinalizedEvent)
-  [Struct `UserVestingChangedEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingChangedEvent)
-  [Struct `OperatorVestingChangedEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingChangedEvent)
-  [Constants](#@Constants_0)
-  [Function `register_user_vesting_store`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_user_vesting_store)
-  [Function `register_operator_vesting_store`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_operator_vesting_store)
-  [Function `batch_claim_user_reward`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_user_reward)
-  [Function `batch_claim_operator_reward`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_operator_reward)
-  [Function `withdraw_vesting`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_withdraw_vesting)
-  [Function `build_user_vesting_claim_info`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_user_vesting_claim_info)
-  [Function `build_operator_vesting_claim_info`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_operator_vesting_claim_info)
-  [Function `is_user_vesting_store_registered`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_user_vesting_store_registered)
-  [Function `is_operator_vesting_store_registered`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_operator_vesting_store_registered)
-  [Function `has_user_vesting_position`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_has_user_vesting_position)
-  [Function `get_user_last_claimed_stage`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_last_claimed_stage)
-  [Function `get_operator_last_claimed_stage`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_last_claimed_stage)
-  [Function `get_user_vesting`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_vesting)
-  [Function `get_operator_vesting`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_vesting)


<pre><code><b>use</b> <a href="">0x1::bcs</a>;
<b>use</b> <a href="">0x1::bigdecimal</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::fungible_asset</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::table</a>;
<b>use</b> <a href="">0x1::table_key</a>;
<b>use</b> <a href="">0x1::type_info</a>;
<b>use</b> <a href="">0x1::vector</a>;
<b>use</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils</a>;
<b>use</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::vault</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore"></a>

## Resource `ModuleStore`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>user_vestings: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_VestingStore">vesting::VestingStore</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVesting">vesting::UserVesting</a>&gt;&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>operator_vestings: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_VestingStore">vesting::VestingStore</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVesting">vesting::OperatorVesting</a>&gt;&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_VestingStore"></a>

## Struct `VestingStore`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_VestingStore">VestingStore</a>&lt;Vesting: <b>copy</b>, drop, store&gt; <b>has</b> store
</code></pre>



##### Fields


<dl>
<dt>
<code>last_claimed_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>vestings: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, Vesting&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVesting"></a>

## Struct `UserVesting`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVesting">UserVesting</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>remaining_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>penalty_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>vest_max_amount: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>l2_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_score: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVesting"></a>

## Struct `OperatorVesting`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVesting">OperatorVesting</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>remaining_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo"></a>

## Struct `UserVestingClaimInfo`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo">UserVestingClaimInfo</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>l2_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>total_l2_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_score_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>funded_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo"></a>

## Struct `OperatorVestingClaimInfo`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">OperatorVestingClaimInfo</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>funded_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingResponse"></a>

## Struct `UserVestingResponse`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingResponse">UserVestingResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>remaining_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>penalty_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>vest_max_amount: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>l2_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_score: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingResponse"></a>

## Struct `OperatorVestingResponse`



<pre><code><b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingResponse">OperatorVestingResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>remaining_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingCreateEvent"></a>

## Struct `UserVestingCreateEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingCreateEvent">UserVestingCreateEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="">account</a>: <b>address</b></code>
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
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>l2_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingCreateEvent"></a>

## Struct `OperatorVestingCreateEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingCreateEvent">OperatorVestingCreateEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="">account</a>: <b>address</b></code>
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
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingFinalizedEvent"></a>

## Struct `UserVestingFinalizedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingFinalizedEvent">UserVestingFinalizedEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="">account</a>: <b>address</b></code>
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
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>penalty_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingFinalizedEvent"></a>

## Struct `OperatorVestingFinalizedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingFinalizedEvent">OperatorVestingFinalizedEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="">account</a>: <b>address</b></code>
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
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingChangedEvent"></a>

## Struct `UserVestingChangedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingChangedEvent">UserVestingChangedEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="">account</a>: <b>address</b></code>
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
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>remaining_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>penalty_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingChangedEvent"></a>

## Struct `OperatorVestingChangedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingChangedEvent">OperatorVestingChangedEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="">account</a>: <b>address</b></code>
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
<code>start_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>initial_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>remaining_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EINVALID_STAGE"></a>



<pre><code><b>const</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EINVALID_STAGE">EINVALID_STAGE</a>: u64 = 6;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EINVALID_VESTING_TYPE"></a>



<pre><code><b>const</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EINVALID_VESTING_TYPE">EINVALID_VESTING_TYPE</a>: u64 = 5;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EREWARD_NOT_ENOUGH"></a>



<pre><code><b>const</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EREWARD_NOT_ENOUGH">EREWARD_NOT_ENOUGH</a>: u64 = 4;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_ALREADY_CLAIMED"></a>



<pre><code><b>const</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_ALREADY_CLAIMED">EVESTING_ALREADY_CLAIMED</a>: u64 = 2;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_NOT_FOUND">EVESTING_NOT_FOUND</a>: u64 = 3;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_STORE_ALREADY_EXISTS"></a>



<pre><code><b>const</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_STORE_ALREADY_EXISTS">EVESTING_STORE_ALREADY_EXISTS</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_user_vesting_store"></a>

## Function `register_user_vesting_store`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_user_vesting_store">register_user_vesting_store</a>(<a href="">account</a>: &<a href="">signer</a>, bridge_id: u64, version: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_user_vesting_store">register_user_vesting_store</a>(
    <a href="">account</a>: &<a href="">signer</a>, bridge_id: u64, version: u64
) <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> account_addr = <a href="_address_of">signer::address_of</a>(<a href="">account</a>);
    <b>let</b> <a href="">table_key</a> = <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_generate_key">generate_key</a>(bridge_id, version, account_addr);
    <b>assert</b>!(
        !<a href="_contains">table::contains</a>(&<b>mut</b> module_store.user_vestings, <a href="">table_key</a>),
        <a href="_already_exists">error::already_exists</a>(<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_STORE_ALREADY_EXISTS">EVESTING_STORE_ALREADY_EXISTS</a>)
    );
    <a href="_add">table::add</a>(
        &<b>mut</b> module_store.user_vestings,
        <a href="">table_key</a>,
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_VestingStore">VestingStore</a> {
            last_claimed_stage: 0,
            vestings: <a href="_new">table::new</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVesting">UserVesting</a>&gt;()
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_operator_vesting_store"></a>

## Function `register_operator_vesting_store`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_operator_vesting_store">register_operator_vesting_store</a>(bridge_id: u64, version: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_operator_vesting_store">register_operator_vesting_store</a>(
    bridge_id: u64, version: u64
) <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> <a href="">table_key</a> = <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_generate_key">generate_key</a>(bridge_id, version, @0x0);
    <b>assert</b>!(
        !<a href="_contains">table::contains</a>(
            &<b>mut</b> module_store.operator_vestings,
            <a href="">table_key</a>
        ),
        <a href="_already_exists">error::already_exists</a>(<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_STORE_ALREADY_EXISTS">EVESTING_STORE_ALREADY_EXISTS</a>)
    );
    <a href="_add">table::add</a>(
        &<b>mut</b> module_store.operator_vestings,
        <a href="">table_key</a>,
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_VestingStore">VestingStore</a> {
            last_claimed_stage: 0,
            vestings: <a href="_new">table::new</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVesting">OperatorVesting</a>&gt;()
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_user_reward"></a>

## Function `batch_claim_user_reward`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_user_reward">batch_claim_user_reward</a>(account_addr: <b>address</b>, bridge_id: u64, version: u64, claim_infos: <a href="">vector</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo">vesting::UserVestingClaimInfo</a>&gt;): <a href="_FungibleAsset">fungible_asset::FungibleAsset</a>
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_user_reward">batch_claim_user_reward</a>(
    account_addr: <b>address</b>,
    bridge_id: u64,
    version: u64,
    claim_infos: <a href="">vector</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo">UserVestingClaimInfo</a>&gt; /*asc sorted claim info*/
): FungibleAsset <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> total_vested_reward = 0; // net reward vested <b>to</b> user
    <b>let</b> total_penalty_reward = 0;
    <b>let</b> user_vestings =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_load_user_vestings_mut">load_user_vestings_mut</a>(module_store, bridge_id, version, account_addr);
    // <b>use</b> a user_vestings <a href="">vector</a> instead of a <a href="">table</a> <b>to</b> avoid high-cost operations.
    <b>let</b> vestings_vec = <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_extract_user_vestings_vector">extract_user_vestings_vector</a>(user_vestings);
    <b>let</b> last_claimed_stage = 0;
    // claim
    <a href="_for_each_ref">vector::for_each_ref</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo">UserVestingClaimInfo</a>&gt;(
        &claim_infos,
        |claim_info| {
            // claim previous user vestings position
            <b>let</b> (vested_reward, penalty_reward) =
                <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_previous_user_vestings">batch_claim_previous_user_vestings</a>(
                    account_addr,
                    bridge_id,
                    version,
                    &<b>mut</b> vestings_vec,
                    user_vestings,
                    claim_info
                );
            total_vested_reward = total_vested_reward + vested_reward;
            total_penalty_reward = total_penalty_reward + penalty_reward;

            <b>let</b> initial_reward_amount =
                <b>if</b> (claim_info.total_l2_score == 0) { 0 }
                <b>else</b> {
                    <b>let</b> total_user_reward = claim_info.funded_reward;
                    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u64">utils::mul_div_u64</a>(
                        total_user_reward,
                        claim_info.l2_score,
                        claim_info.total_l2_score
                    )
                };
            <b>assert</b>!(
                !<a href="_contains">table::contains</a>(
                    user_vestings,
                    <a href="_encode_u64">table_key::encode_u64</a>(claim_info.start_stage)
                ),
                <a href="_already_exists">error::already_exists</a>(<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_ALREADY_CLAIMED">EVESTING_ALREADY_CLAIMED</a>)
            );

            // create user <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>
            <b>if</b> (initial_reward_amount &gt; 0) {
                <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_create_user_vesting">create_user_vesting</a>(
                    account_addr,
                    bridge_id,
                    version,
                    user_vestings,
                    &<b>mut</b> vestings_vec,
                    claim_info,
                    initial_reward_amount
                );
            } <b>else</b> {
                // <b>if</b> user score is 0 emit create, finalize <a href="">event</a>
                <a href="_emit">event::emit</a>(
                    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingCreateEvent">UserVestingCreateEvent</a> {
                        <a href="">account</a>: account_addr,
                        bridge_id,
                        version,
                        start_stage: claim_info.start_stage,
                        end_stage: claim_info.end_stage,
                        l2_score: claim_info.l2_score,
                        minimum_score: 0,
                        initial_reward: 0
                    }
                );
                <a href="_emit">event::emit</a>(
                    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingFinalizedEvent">UserVestingFinalizedEvent</a> {
                        <a href="">account</a>: account_addr,
                        bridge_id,
                        version,
                        start_stage: claim_info.start_stage,
                        penalty_reward: 0
                    }
                );
            };

            last_claimed_stage = claim_info.start_stage;
        }
    );

    // <b>update</b> or insert from unfinalized vestings <b>to</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> data of <b>module</b> store
    <a href="_for_each">vector::for_each</a>(
        vestings_vec,
        |<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>| {
            <a href="_upsert">table::upsert</a>(
                user_vestings,
                <a href="_encode_u64">table_key::encode_u64</a>(<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.start_stage),
                <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>
            );
            // emit only user <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> happen
            <b>if</b> (<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.initial_reward != <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.remaining_reward) {
                <a href="_emit">event::emit</a>(
                    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingChangedEvent">UserVestingChangedEvent</a> {
                        <a href="">account</a>: account_addr,
                        bridge_id,
                        version,
                        start_stage: <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.start_stage,
                        initial_reward: <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.initial_reward,
                        remaining_reward: <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.remaining_reward,
                        penalty_reward: <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.penalty_reward
                    }
                );
            };
        }
    );

    // <b>update</b> last claimed stage
    <b>if</b> (last_claimed_stage != 0) {
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_update_user_last_claimed_stage">update_user_last_claimed_stage</a>(
            module_store,
            bridge_id,
            version,
            account_addr,
            last_claimed_stage
        );
    };

    // withdraw net reward from <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault">vault</a>
    <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_withdraw">vault::withdraw</a>(total_vested_reward)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_operator_reward"></a>

## Function `batch_claim_operator_reward`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_operator_reward">batch_claim_operator_reward</a>(operator_addr: <b>address</b>, bridge_id: u64, version: u64, last_submitted_stage: u64, claim_infos: <a href="">vector</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">vesting::OperatorVestingClaimInfo</a>&gt;): <a href="_FungibleAsset">fungible_asset::FungibleAsset</a>
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_operator_reward">batch_claim_operator_reward</a>(
    operator_addr: <b>address</b>,
    bridge_id: u64,
    version: u64,
    last_submitted_stage: u64,
    claim_infos: <a href="">vector</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">OperatorVestingClaimInfo</a>&gt; /*asc sorted claim info*/
): FungibleAsset <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> total_vested_reward = 0;
    <b>let</b> operator_vestings =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_load_operator_vestings_mut">load_operator_vestings_mut</a>(module_store, bridge_id, version);
    <b>let</b> last_claimed_stage = 0;
    // extract unfinalized <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> from <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a> vestings

    <b>let</b> finalized_keys = <a href="">vector</a>[];

    // create vestings
    <a href="_for_each_ref">vector::for_each_ref</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">OperatorVestingClaimInfo</a>&gt;(
        &claim_infos,
        |claim_info| {
            <b>let</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">OperatorVestingClaimInfo</a> { start_stage, end_stage: _, funded_reward } =
                *claim_info;
            <b>let</b> initial_reward = funded_reward;

            <b>assert</b>!(
                !<a href="_contains">table::contains</a>(
                    operator_vestings,
                    <a href="_encode_u64">table_key::encode_u64</a>(start_stage)
                ),
                <a href="_already_exists">error::already_exists</a>(<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_ALREADY_CLAIMED">EVESTING_ALREADY_CLAIMED</a>)
            );

            // create <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> position
            <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_create_operator_vesting">create_operator_vesting</a>(
                operator_addr,
                bridge_id,
                version,
                operator_vestings,
                claim_info,
                initial_reward
            );
            last_claimed_stage = start_stage;
        }
    );

    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk_mut">utils::walk_mut</a>(
        operator_vestings,
        <a href="_none">option::none</a>(),
        <a href="_none">option::none</a>(),
        1,
        |stage_key, operator_vesting| {
            <b>let</b> reward_amount =
                <b>if</b> (last_submitted_stage &gt;= operator_vesting.end_stage) {
                    <a href="_push_back">vector::push_back</a>(&<b>mut</b> finalized_keys, stage_key);
                    operator_vesting.remaining_reward
                } <b>else</b> {
                    <b>let</b> stage_diff =
                        last_submitted_stage - operator_vesting.start_stage;
                    <b>let</b> vesting_period =
                        operator_vesting.end_stage - operator_vesting.start_stage;
                    <b>let</b> vested_amount =
                        operator_vesting.initial_reward
                            - operator_vesting.remaining_reward;
                    <b>let</b> reward_amount =
                        <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_mul_div_u64">utils::mul_div_u64</a>(
                            operator_vesting.initial_reward,
                            stage_diff,
                            vesting_period
                        ) - vested_amount;
                    operator_vesting.remaining_reward =
                        operator_vesting.remaining_reward - reward_amount;
                    reward_amount
                };

            <a href="_emit">event::emit</a>(
                <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingChangedEvent">OperatorVestingChangedEvent</a> {
                    <a href="">account</a>: operator_addr,
                    bridge_id,
                    version,
                    start_stage: operator_vesting.start_stage,
                    initial_reward: operator_vesting.initial_reward,
                    remaining_reward: operator_vesting.remaining_reward
                }
            );

            total_vested_reward = total_vested_reward + reward_amount;
            <b>false</b>
        }
    );

    // remove finalized <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>
    <a href="_for_each">vector::for_each</a>(
        finalized_keys,
        |stage_key| {
            <b>let</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> = <a href="_remove">table::remove</a>(operator_vestings, stage_key);
            <a href="_emit">event::emit</a>(
                <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingFinalizedEvent">OperatorVestingFinalizedEvent</a> {
                    <a href="">account</a>: operator_addr,
                    bridge_id,
                    version,
                    start_stage: <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a>.start_stage
                }
            );
        }
    );

    // <b>update</b> last claimed stage
    <b>if</b> (last_claimed_stage != 0) {
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_update_operator_last_claimed_stage">update_operator_last_claimed_stage</a>(
            module_store,
            bridge_id,
            version,
            last_claimed_stage
        );
    };

    // withdraw total vested reward from reward store
    <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_withdraw">vault::withdraw</a>(total_vested_reward)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_withdraw_vesting"></a>

## Function `withdraw_vesting`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_withdraw_vesting">withdraw_vesting</a>(account_addr: <b>address</b>, bridge_id: u64, version: u64, stage: u64, withdraw_amount: u64): <a href="_FungibleAsset">fungible_asset::FungibleAsset</a>
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_withdraw_vesting">withdraw_vesting</a>(
    account_addr: <b>address</b>,
    bridge_id: u64,
    version: u64,
    stage: u64,
    withdraw_amount: u64
): FungibleAsset <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> user_vesting_store =
        <a href="_borrow_mut">table::borrow_mut</a>(
            &<b>mut</b> module_store.user_vestings,
            <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_generate_key">generate_key</a>(bridge_id, version, account_addr)
        );
    <b>let</b> stage_key = <a href="_encode_u64">table_key::encode_u64</a>(stage);
    // force claim_vesting
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(&user_vesting_store.vestings, stage_key),
        <a href="_not_found">error::not_found</a>(<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EVESTING_NOT_FOUND">EVESTING_NOT_FOUND</a>)
    );

    <b>let</b> user_vesting = <a href="_borrow_mut">table::borrow_mut</a>(&<b>mut</b> user_vesting_store.vestings, stage_key);

    <b>assert</b>!(
        user_vesting.remaining_reward &gt;= withdraw_amount,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_EREWARD_NOT_ENOUGH">EREWARD_NOT_ENOUGH</a>)
    );
    user_vesting.remaining_reward = user_vesting.remaining_reward - withdraw_amount;
    <a href="_emit">event::emit</a>(
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingChangedEvent">UserVestingChangedEvent</a> {
            <a href="">account</a>: account_addr,
            bridge_id,
            version,
            start_stage: user_vesting.start_stage,
            initial_reward: user_vesting.initial_reward,
            remaining_reward: user_vesting.remaining_reward,
            penalty_reward: user_vesting.penalty_reward
        }
    );
    // handle <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> positions
    <b>if</b> (user_vesting.remaining_reward == 0) {
        <b>let</b> start_stage = user_vesting.start_stage;
        <b>let</b> penalty_reward = user_vesting.penalty_reward;
        // mark <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> positions finalized and emit <a href="">event</a>.
        <a href="_remove">table::remove</a>(&<b>mut</b> user_vesting_store.vestings, stage_key);
        <a href="_emit">event::emit</a>(
            <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingFinalizedEvent">UserVestingFinalizedEvent</a> {
                <a href="">account</a>: account_addr,
                bridge_id,
                version,
                start_stage,
                penalty_reward
            }
        );
    };

    <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_withdraw">vault::withdraw</a>(withdraw_amount)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_user_vesting_claim_info"></a>

## Function `build_user_vesting_claim_info`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_user_vesting_claim_info">build_user_vesting_claim_info</a>(start_stage: u64, end_stage: u64, l2_score: u64, minimum_score_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a>, total_l2_score: u64, funded_reward: u64): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo">vesting::UserVestingClaimInfo</a>
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_user_vesting_claim_info">build_user_vesting_claim_info</a>(
    start_stage: u64,
    end_stage: u64,
    l2_score: u64,
    minimum_score_ratio: BigDecimal,
    total_l2_score: u64,
    funded_reward: u64
): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo">UserVestingClaimInfo</a> {
    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingClaimInfo">UserVestingClaimInfo</a> {
        start_stage,
        end_stage,
        l2_score,
        minimum_score_ratio,
        total_l2_score,
        funded_reward
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_operator_vesting_claim_info"></a>

## Function `build_operator_vesting_claim_info`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_operator_vesting_claim_info">build_operator_vesting_claim_info</a>(start_stage: u64, end_stage: u64, funded_reward: u64): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">vesting::OperatorVestingClaimInfo</a>
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_operator_vesting_claim_info">build_operator_vesting_claim_info</a>(
    start_stage: u64, end_stage: u64, funded_reward: u64
): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">OperatorVestingClaimInfo</a> {
    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingClaimInfo">OperatorVestingClaimInfo</a> { start_stage, end_stage, funded_reward }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_user_vesting_store_registered"></a>

## Function `is_user_vesting_store_registered`



<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_user_vesting_store_registered">is_user_vesting_store_registered</a>(account_addr: <b>address</b>, bridge_id: u64, version: u64): bool
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_user_vesting_store_registered">is_user_vesting_store_registered</a>(
    account_addr: <b>address</b>, bridge_id: u64, version: u64
): bool <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="_contains">table::contains</a>(
        &module_store.user_vestings,
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_generate_key">generate_key</a>(bridge_id, version, account_addr)
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_operator_vesting_store_registered"></a>

## Function `is_operator_vesting_store_registered`



<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_operator_vesting_store_registered">is_operator_vesting_store_registered</a>(bridge_id: u64, version: u64): bool
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_operator_vesting_store_registered">is_operator_vesting_store_registered</a>(
    bridge_id: u64, version: u64
): bool <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="_contains">table::contains</a>(
        &module_store.operator_vestings,
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_generate_key">generate_key</a>(bridge_id, version, @0x0)
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_has_user_vesting_position"></a>

## Function `has_user_vesting_position`



<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_has_user_vesting_position">has_user_vesting_position</a>(account_addr: <b>address</b>, bridge_id: u64, version: u64, stage: u64): bool
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_has_user_vesting_position">has_user_vesting_position</a>(
    account_addr: <b>address</b>,
    bridge_id: u64,
    version: u64,
    stage: u64
): bool <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> user_vestings =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_load_user_vestings_imut">load_user_vestings_imut</a>(module_store, bridge_id, version, account_addr);
    <b>let</b> stage_key = <a href="_encode_u64">table_key::encode_u64</a>(stage);
    <a href="_contains">table::contains</a>(user_vestings, stage_key)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_last_claimed_stage"></a>

## Function `get_user_last_claimed_stage`



<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_last_claimed_stage">get_user_last_claimed_stage</a>(account_addr: <b>address</b>, bridge_id: u64, version: u64): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_last_claimed_stage">get_user_last_claimed_stage</a>(
    account_addr: <b>address</b>, bridge_id: u64, version: u64
): u64 <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_last_claimed_stage">get_last_claimed_stage</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVesting">UserVesting</a>&gt;(account_addr, bridge_id, version)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_last_claimed_stage"></a>

## Function `get_operator_last_claimed_stage`



<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_last_claimed_stage">get_operator_last_claimed_stage</a>(bridge_id: u64, version: u64): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_last_claimed_stage">get_operator_last_claimed_stage</a>(
    bridge_id: u64, version: u64
): u64 <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_last_claimed_stage">get_last_claimed_stage</a>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVesting">OperatorVesting</a>&gt;(@0x0, bridge_id, version)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_vesting"></a>

## Function `get_user_vesting`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_vesting">get_user_vesting</a>(account_addr: <b>address</b>, bridge_id: u64, version: u64, stage: u64): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingResponse">vesting::UserVestingResponse</a>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_user_vesting">get_user_vesting</a>(
    account_addr: <b>address</b>,
    bridge_id: u64,
    version: u64,
    stage: u64
): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingResponse">UserVestingResponse</a> <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> user_vesting =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_load_user_vesting_imut">load_user_vesting_imut</a>(
            module_store,
            bridge_id,
            version,
            account_addr,
            stage
        );
    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_UserVestingResponse">UserVestingResponse</a> {
        initial_reward: user_vesting.initial_reward,
        remaining_reward: user_vesting.remaining_reward,
        penalty_reward: user_vesting.penalty_reward,
        start_stage: user_vesting.start_stage,
        vest_max_amount: user_vesting.vest_max_amount,
        end_stage: user_vesting.end_stage,
        l2_score: user_vesting.l2_score,
        minimum_score: user_vesting.minimum_score
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_vesting"></a>

## Function `get_operator_vesting`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_vesting">get_operator_vesting</a>(bridge_id: u64, version: u64, stage: u64): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingResponse">vesting::OperatorVestingResponse</a>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_vesting">get_operator_vesting</a>(
    bridge_id: u64, version: u64, stage: u64
): <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingResponse">OperatorVestingResponse</a> <b>acquires</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> operator_vesting =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_load_operator_vesting_imut">load_operator_vesting_imut</a>(module_store, bridge_id, version, stage);
    <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_OperatorVestingResponse">OperatorVestingResponse</a> {
        initial_reward: operator_vesting.initial_reward,
        remaining_reward: operator_vesting.remaining_reward,
        start_stage: operator_vesting.start_stage,
        end_stage: operator_vesting.end_stage
    }
}
</code></pre>
