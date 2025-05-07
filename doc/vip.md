
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::vip`



-  [Resource `ModuleStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore)
-  [Struct `BridgeInfoKey`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey)
-  [Struct `SnapshotKey`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey)
-  [Struct `AgentData`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData)
-  [Struct `StageData`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData)
-  [Struct `Snapshot`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot)
-  [Struct `Bridge`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Bridge)
-  [Struct `ExecutedChallenge`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecutedChallenge)
-  [Struct `BridgeResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeResponse)
-  [Struct `TotalL2ScoreResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_TotalL2ScoreResponse)
-  [Struct `FundEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_FundEvent)
-  [Struct `RewardDistributionEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_RewardDistributionEvent)
-  [Struct `StageAdvanceEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageAdvanceEvent)
-  [Struct `ReleaseTimeUpdateEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ReleaseTimeUpdateEvent)
-  [Struct `ExecuteChallengeEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecuteChallengeEvent)
-  [Struct `SubmitSnapshotEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SubmitSnapshotEvent)
-  [Constants](#@Constants_0)
-  [Function `initialize`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_initialize)
-  [Function `update_vip_weights_for_friend`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights_for_friend)
-  [Function `execute_challenge`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_execute_challenge)
-  [Function `register`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_register)
-  [Function `deregister`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_deregister)
-  [Function `update_agent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent)
-  [Function `update_agent_by_chain`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent_by_chain)
-  [Function `add_tvl_snapshot`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot)
-  [Function `fund_reward_script`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_fund_reward_script)
-  [Function `submit_snapshot`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_submit_snapshot)
-  [Function `batch_claim_user_reward_script`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_user_reward_script)
-  [Function `batch_claim_operator_reward_script`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_operator_reward_script)
-  [Function `update_vip_weights`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights)
-  [Function `update_vip_weight`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weight)
-  [Function `update_params`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_params)
-  [Function `update_operator_commission`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator_commission)
-  [Function `update_l2_score_contract`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_l2_score_contract)
-  [Function `update_operator`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator)
-  [Function `lock_stake_script`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_lock_stake_script)
-  [Function `batch_lock_stake_script`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_lock_stake_script)
-  [Function `batch_stableswap_lock_stake_script`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_stableswap_lock_stake_script)
-  [Function `get_last_submitted_stage`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_submitted_stage)
-  [Function `get_whitelisted_bridge_ids`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_whitelisted_bridge_ids)
-  [Function `is_registered`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_is_registered)
-  [Function `get_bridge_infos`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_bridge_infos)
-  [Function `get_total_l2_scores`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_total_l2_scores)


<pre><code><b>use</b> <a href="">0x1::bcs</a>;
<b>use</b> <a href="">0x1::bigdecimal</a>;
<b>use</b> <a href="">0x1::block</a>;
<b>use</b> <a href="">0x1::coin</a>;
<b>use</b> <a href="">0x1::dex</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::fungible_asset</a>;
<b>use</b> <a href="">0x1::hash</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::primary_fungible_store</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::simple_map</a>;
<b>use</b> <a href="">0x1::stableswap</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::table</a>;
<b>use</b> <a href="">0x1::table_key</a>;
<b>use</b> <a href="">0x1::vector</a>;
<b>use</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::lock_staking</a>;
<b>use</b> <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::operator</a>;
<b>use</b> <a href="tvl_manager.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_tvl_manager">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::tvl_manager</a>;
<b>use</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils</a>;
<b>use</b> <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::vault</a>;
<b>use</b> <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::vesting</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore"></a>

## Resource `ModuleStore`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>stage_start_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>stage_end_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>stage_interval: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>vesting_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_lock_staking_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>challenge_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>agent_data: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData">vip::AgentData</a></code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_score_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>pool_split_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>maximum_tvl_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_eligible_tvl: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>maximum_weight_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>stage_data: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData">vip::StageData</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>bridges: <a href="_Table">table::Table</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">vip::BridgeInfoKey</a>, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Bridge">vip::Bridge</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>challenges: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecutedChallenge">vip::ExecutedChallenge</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey"></a>

## Struct `BridgeInfoKey`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>is_registered: bool</code>
</dt>
<dd>

</dd>
<dt>
<code>bridge_id: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>version: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey"></a>

## Struct `SnapshotKey`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a> <b>has</b> <b>copy</b>, drop
</code></pre>



##### Fields


<dl>
<dt>
<code>bridge_id: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>version: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData"></a>

## Struct `AgentData`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData">AgentData</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>agent: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>api_uri: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData"></a>

## Struct `StageData`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData">StageData</a> <b>has</b> store
</code></pre>



##### Fields


<dl>
<dt>
<code>stage_start_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>stage_end_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>pool_split_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>total_operator_funded_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>operator_funded_rewards: <a href="_Table">table::Table</a>&lt;u64, u64&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>total_user_funded_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>user_funded_rewards: <a href="_Table">table::Table</a>&lt;u64, u64&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>vesting_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_score_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>snapshots: <a href="_Table">table::Table</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">vip::SnapshotKey</a>, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot">vip::Snapshot</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot"></a>

## Struct `Snapshot`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot">Snapshot</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>create_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>upsert_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>merkle_root: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>total_l2_score: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Bridge"></a>

## Struct `Bridge`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Bridge">Bridge</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>init_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>end_stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>bridge_addr: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>operator_addr: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>vip_l2_score_contract: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>vip_weight: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>vm_type: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecutedChallenge"></a>

## Struct `ExecutedChallenge`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecutedChallenge">ExecutedChallenge</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>challenge_id: u64</code>
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
<code>new_l2_total_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>title: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>summary: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>api_uri: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>new_agent: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>merkle_root: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeResponse"></a>

## Struct `BridgeResponse`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeResponse">BridgeResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>init_stage: u64</code>
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
<code>bridge_addr: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>operator_addr: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>vip_l2_score_contract: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>vip_weight: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>vm_type: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_TotalL2ScoreResponse"></a>

## Struct `TotalL2ScoreResponse`



<pre><code><b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_TotalL2ScoreResponse">TotalL2ScoreResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
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
<code>total_l2_score: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_FundEvent"></a>

## Struct `FundEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_FundEvent">FundEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>total_operator_funded_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>total_user_funded_reward: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_RewardDistributionEvent"></a>

## Struct `RewardDistributionEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_RewardDistributionEvent">RewardDistributionEvent</a> <b>has</b> drop, store
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
<code>version: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>user_reward_amount: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>operator_reward_amount: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageAdvanceEvent"></a>

## Struct `StageAdvanceEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageAdvanceEvent">StageAdvanceEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>stage: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>stage_start_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>stage_end_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>pool_split_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
<dt>
<code>total_operator_funded_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>total_user_funded_reward: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>vesting_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>minimum_score_ratio: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ReleaseTimeUpdateEvent"></a>

## Struct `ReleaseTimeUpdateEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ReleaseTimeUpdateEvent">ReleaseTimeUpdateEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>stage: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecuteChallengeEvent"></a>

## Struct `ExecuteChallengeEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecuteChallengeEvent">ExecuteChallengeEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>challenge_id: u64</code>
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
<code>title: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>summary: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>api_uri: <a href="_String">string::String</a></code>
</dt>
<dd>

</dd>
<dt>
<code>new_agent: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>merkle_root: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SubmitSnapshotEvent"></a>

## Struct `SubmitSnapshotEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SubmitSnapshotEvent">SubmitSnapshotEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
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
<code>total_l2_score: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>merkle_root: <a href="">vector</a>&lt;u8&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>create_time: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EUNAUTHORIZED"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EUNAUTHORIZED">EUNAUTHORIZED</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EVM"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EVM">EVM</a>: u64 = 2;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_CHALLENGE_PERIOD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_CHALLENGE_PERIOD">DEFAULT_CHALLENGE_PERIOD</a>: u64 = 86400;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_LOCK_STAKE_PERIOD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_LOCK_STAKE_PERIOD">DEFAULT_LOCK_STAKE_PERIOD</a>: u64 = 15724800;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MAXIMUM_TVL_RATIO"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MAXIMUM_TVL_RATIO">DEFAULT_MAXIMUM_TVL_RATIO</a>: u64 = 10;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MAXIMUM_WEIGHT_RATIO"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MAXIMUM_WEIGHT_RATIO">DEFAULT_MAXIMUM_WEIGHT_RATIO</a>: u64 = 10;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MINIMUM_ELIGIBLE_TVL"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MINIMUM_ELIGIBLE_TVL">DEFAULT_MINIMUM_ELIGIBLE_TVL</a>: u64 = 0;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MIN_SCORE_RATIO"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MIN_SCORE_RATIO">DEFAULT_MIN_SCORE_RATIO</a>: u64 = 5;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_POOL_SPLIT_RATIO"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_POOL_SPLIT_RATIO">DEFAULT_POOL_SPLIT_RATIO</a>: u64 = 4;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_STAGE_INTERVAL"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_STAGE_INTERVAL">DEFAULT_STAGE_INTERVAL</a>: u64 = 1209600;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_VESTING_PERIOD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_VESTING_PERIOD">DEFAULT_VESTING_PERIOD</a>: u64 = 26;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_VIP_START_STAGE"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_VIP_START_STAGE">DEFAULT_VIP_START_STAGE</a>: u64 = 0;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EALREADY_FINALIZED"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EALREADY_FINALIZED">EALREADY_FINALIZED</a>: u64 = 28;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_ALREADY_REGISTERED"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_ALREADY_REGISTERED">EBRIDGE_ALREADY_REGISTERED</a>: u64 = 2;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_FOUND">EBRIDGE_NOT_FOUND</a>: u64 = 5;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_REGISTERED"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_REGISTERED">EBRIDGE_NOT_REGISTERED</a>: u64 = 7;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ECLAIMABLE_REWARD_CAN_BE_EXIST"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ECLAIMABLE_REWARD_CAN_BE_EXIST">ECLAIMABLE_REWARD_CAN_BE_EXIST</a>: u64 = 33;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EFUNDED_REWARD_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EFUNDED_REWARD_NOT_FOUND">EFUNDED_REWARD_NOT_FOUND</a>: u64 = 9;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_BATCH_ARGUMENT"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_BATCH_ARGUMENT">EINVALID_BATCH_ARGUMENT</a>: u64 = 17;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CHALLENGE_PERIOD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CHALLENGE_PERIOD">EINVALID_CHALLENGE_PERIOD</a>: u64 = 22;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CHALLENGE_STAGE"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CHALLENGE_STAGE">EINVALID_CHALLENGE_STAGE</a>: u64 = 23;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CLAIMABLE_PERIOD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CLAIMABLE_PERIOD">EINVALID_CLAIMABLE_PERIOD</a>: u64 = 21;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CLAIMABLE_STAGE"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CLAIMABLE_STAGE">EINVALID_CLAIMABLE_STAGE</a>: u64 = 16;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_LOCK_STAKING_AMOUNT"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_LOCK_STAKING_AMOUNT">EINVALID_LOCK_STAKING_AMOUNT</a>: u64 = 30;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_LOCK_STKAING_PERIOD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_LOCK_STKAING_PERIOD">EINVALID_LOCK_STKAING_PERIOD</a>: u64 = 31;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_MERKLE_PROOFS"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_MERKLE_PROOFS">EINVALID_MERKLE_PROOFS</a>: u64 = 10;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_POOL"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_POOL">EINVALID_POOL</a>: u64 = 32;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_PROOF_LENGTH"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_PROOF_LENGTH">EINVALID_PROOF_LENGTH</a>: u64 = 11;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_RATIO"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_RATIO">EINVALID_RATIO</a>: u64 = 14;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_INTERVAL"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_INTERVAL">EINVALID_STAGE_INTERVAL</a>: u64 = 24;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_ORDER"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_ORDER">EINVALID_STAGE_ORDER</a>: u64 = 20;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_SNAPSHOT"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_SNAPSHOT">EINVALID_STAGE_SNAPSHOT</a>: u64 = 25;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_TOTAL_REWARD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_TOTAL_REWARD">EINVALID_TOTAL_REWARD</a>: u64 = 18;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_VEST_PERIOD"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_VEST_PERIOD">EINVALID_VEST_PERIOD</a>: u64 = 12;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_VM_TYPE"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_VM_TYPE">EINVALID_VM_TYPE</a>: u64 = 26;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_WEIGHT"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_WEIGHT">EINVALID_WEIGHT</a>: u64 = 19;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EMIN_ELIGIBLE_TVL"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EMIN_ELIGIBLE_TVL">EMIN_ELIGIBLE_TVL</a>: u64 = 34;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EPREV_STAGE_SNAPSHOT_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EPREV_STAGE_SNAPSHOT_NOT_FOUND">EPREV_STAGE_SNAPSHOT_NOT_FOUND</a>: u64 = 8;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESNAPSHOT_ALREADY_EXISTS"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESNAPSHOT_ALREADY_EXISTS">ESNAPSHOT_ALREADY_EXISTS</a>: u64 = 3;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESNAPSHOT_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESNAPSHOT_NOT_FOUND">ESNAPSHOT_NOT_FOUND</a>: u64 = 6;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESTAGE_DATA_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESTAGE_DATA_NOT_FOUND">ESTAGE_DATA_NOT_FOUND</a>: u64 = 4;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESTAKELISTED_NOT_ENOUGH"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESTAKELISTED_NOT_ENOUGH">ESTAKELISTED_NOT_ENOUGH</a>: u64 = 29;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ETOO_EARLY_FUND"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ETOO_EARLY_FUND">ETOO_EARLY_FUND</a>: u64 = 27;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_MOVEVM"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_MOVEVM">MOVEVM</a>: u64 = 0;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_PROOF_LENGTH"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_PROOF_LENGTH">PROOF_LENGTH</a>: u64 = 32;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_WASMVM"></a>



<pre><code><b>const</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_WASMVM">WASMVM</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_initialize"></a>

## Function `initialize`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_initialize">initialize</a>(chain: &<a href="">signer</a>, stage_start_time: u64, agent: <b>address</b>, api: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_initialize">initialize</a>(
    chain: &<a href="">signer</a>,
    stage_start_time: u64,
    agent: <b>address</b>,
    api: <a href="_String">string::String</a>
) {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>move_to</b>(
        chain,
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
            stage: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_VIP_START_STAGE">DEFAULT_VIP_START_STAGE</a>,
            stage_start_time: stage_start_time,
            stage_end_time: stage_start_time,
            stage_interval: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_STAGE_INTERVAL">DEFAULT_STAGE_INTERVAL</a>,
            vesting_period: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_VESTING_PERIOD">DEFAULT_VESTING_PERIOD</a>,
            minimum_lock_staking_period: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_LOCK_STAKE_PERIOD">DEFAULT_LOCK_STAKE_PERIOD</a>,
            challenge_period: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_CHALLENGE_PERIOD">DEFAULT_CHALLENGE_PERIOD</a>,
            minimum_score_ratio: <a href="_from_ratio_u64">bigdecimal::from_ratio_u64</a>(
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MIN_SCORE_RATIO">DEFAULT_MIN_SCORE_RATIO</a>, 10
            ),
            pool_split_ratio: <a href="_from_ratio_u64">bigdecimal::from_ratio_u64</a>(
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_POOL_SPLIT_RATIO">DEFAULT_POOL_SPLIT_RATIO</a>, 10
            ),
            agent_data: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData">AgentData</a> { agent: agent, api_uri: api },
            maximum_tvl_ratio: <a href="_from_ratio_u64">bigdecimal::from_ratio_u64</a>(0, 1), // DEPRECATED
            minimum_eligible_tvl: <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MINIMUM_ELIGIBLE_TVL">DEFAULT_MINIMUM_ELIGIBLE_TVL</a>,
            maximum_weight_ratio: <a href="_from_ratio_u64">bigdecimal::from_ratio_u64</a>(
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_DEFAULT_MAXIMUM_WEIGHT_RATIO">DEFAULT_MAXIMUM_WEIGHT_RATIO</a>, 10
            ),
            stage_data: <a href="_new">table::new</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData">StageData</a>&gt;(),
            bridges: <a href="_new">table::new</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a>, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Bridge">Bridge</a>&gt;(),
            challenges: <a href="_new">table::new</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecutedChallenge">ExecutedChallenge</a>&gt;()
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights_for_friend"></a>

## Function `update_vip_weights_for_friend`



<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights_for_friend">update_vip_weights_for_friend</a>(bridge_ids: <a href="">vector</a>&lt;u64&gt;, weights: <a href="">vector</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b>(<b>friend</b>) <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights_for_friend">update_vip_weights_for_friend</a>(
    bridge_ids: <a href="">vector</a>&lt;u64&gt;, weights: <a href="">vector</a>&lt;BigDecimal&gt;
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);

    <b>assert</b>!(
        <a href="_length">vector::length</a>(&bridge_ids) == <a href="_length">vector::length</a>(&weights),
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_BATCH_ARGUMENT">EINVALID_BATCH_ARGUMENT</a>)
    );

    <a href="_enumerate_ref">vector::enumerate_ref</a>(
        &bridge_ids,
        |i, bridge_id_ref| {
            <b>let</b> bridge_id_key = <a href="_encode_u64">table_key::encode_u64</a>(*bridge_id_ref);
            <b>let</b> (is_registered, version) =
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, *bridge_id_ref);
            <b>if</b> (is_registered) {
                <b>let</b> key = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a> {
                    is_registered: <b>true</b>,
                    bridge_id: bridge_id_key,
                    version: <a href="_encode_u64">table_key::encode_u64</a>(version)
                };
                <b>let</b> bridge = <a href="_borrow_mut">table::borrow_mut</a>(&<b>mut</b> module_store.bridges, key);
                bridge.vip_weight = *<a href="_borrow">vector::borrow</a>(&weights, i);
            }
        }
    );

    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_validate_vip_weights">validate_vip_weights</a>(module_store);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_execute_challenge"></a>

## Function `execute_challenge`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_execute_challenge">execute_challenge</a>(chain: &<a href="">signer</a>, bridge_id: u64, challenge_stage: u64, challenge_id: u64, title: <a href="_String">string::String</a>, summary: <a href="_String">string::String</a>, new_api_uri: <a href="_String">string::String</a>, new_agent: <b>address</b>, new_merkle_root: <a href="">vector</a>&lt;u8&gt;, new_l2_total_score: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_execute_challenge">execute_challenge</a>(
    chain: &<a href="">signer</a>,
    bridge_id: u64,
    challenge_stage: u64,
    challenge_id: u64,
    title: <a href="_String">string::String</a>,
    summary: <a href="_String">string::String</a>,
    new_api_uri: <a href="_String">string::String</a>,
    new_agent: <b>address</b>,
    new_merkle_root: <a href="">vector</a>&lt;u8&gt;,
    new_l2_total_score: u64
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>assert</b>!(
        module_store.stage &gt;= challenge_stage,
        <a href="_permission_denied">error::permission_denied</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CHALLENGE_STAGE">EINVALID_CHALLENGE_STAGE</a>)
    );
    <b>let</b> challenge_period = module_store.challenge_period;
    <b>let</b> (_, execution_time) = <a href="_get_block_info">block::get_block_info</a>();
    //check challenge period
    <b>let</b> (is_registered, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
    <b>assert</b>!(is_registered, <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_REGISTERED">EBRIDGE_NOT_REGISTERED</a>));

    <b>let</b> snapshot = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_load_snapshot_mut">load_snapshot_mut</a>(
        module_store,
        challenge_stage,
        bridge_id,
        version
    );

    <b>assert</b>!(
        snapshot.create_time + challenge_period &gt; execution_time,
        <a href="_permission_denied">error::permission_denied</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_CHALLENGE_PERIOD">EINVALID_CHALLENGE_PERIOD</a>)
    );

    <b>let</b> create_time = snapshot.create_time;
    // upsert snapshot data
    *snapshot = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot">Snapshot</a> {
        create_time: create_time,
        upsert_time: execution_time,
        merkle_root: new_merkle_root,
        total_l2_score: new_l2_total_score
    };

    // replace agent
    module_store.agent_data = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData">AgentData</a> { agent: new_agent, api_uri: new_api_uri };
    // make key of executed_challenge
    <b>let</b> key = <a href="_encode_u64">table_key::encode_u64</a>(challenge_id);
    // add executed_challenge
    <a href="_add">table::add</a>(
        &<b>mut</b> module_store.challenges,
        key,
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecutedChallenge">ExecutedChallenge</a> {
            challenge_id,
            bridge_id,
            version,
            stage: challenge_stage,
            new_l2_total_score,
            title,
            summary,
            api_uri: new_api_uri,
            new_agent,
            merkle_root: new_merkle_root
        }
    );
    <a href="_emit">event::emit</a>(
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ExecuteChallengeEvent">ExecuteChallengeEvent</a> {
            challenge_id,
            bridge_id,
            version,
            stage: challenge_stage,
            title,
            summary,
            api_uri: new_api_uri,
            new_agent,
            merkle_root: new_merkle_root
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_register"></a>

## Function `register`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_register">register</a>(chain: &<a href="">signer</a>, <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: <b>address</b>, bridge_id: u64, bridge_address: <b>address</b>, vip_l2_score_contract: <a href="_String">string::String</a>, operator_commission_max_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>, operator_commission_max_change_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>, operator_commission_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>, vm_type: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_register">register</a>(
    chain: &<a href="">signer</a>,
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: <b>address</b>,
    bridge_id: u64,
    bridge_address: <b>address</b>,
    vip_l2_score_contract: <a href="_String">string::String</a>,
    operator_commission_max_rate: BigDecimal,
    operator_commission_max_change_rate: BigDecimal,
    operator_commission_rate: BigDecimal,
    vm_type: u64
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);

    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (is_registered, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
    <b>assert</b>!(!is_registered, <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_ALREADY_REGISTERED">EBRIDGE_ALREADY_REGISTERED</a>));

    <b>let</b> new_version = <b>if</b> (version != 0) {
        version + 1
    } <b>else</b> { 1 };
    // register chain stores
    <b>if</b> (!<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_is_bridge_registered">operator::is_bridge_registered</a>(bridge_id, new_version)) {
        <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_register_operator_store">operator::register_operator_store</a>(
            chain,
            <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>,
            bridge_id,
            new_version,
            module_store.stage,
            operator_commission_max_rate,
            operator_commission_max_change_rate,
            operator_commission_rate
        );
    };
    // check vm type valid
    <b>assert</b>!(
        vm_type == <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_MOVEVM">MOVEVM</a> || vm_type == <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_WASMVM">WASMVM</a> || vm_type == <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EVM">EVM</a>,
        <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_VM_TYPE">EINVALID_VM_TYPE</a>)
    );
    <b>assert</b>!(
        <a href="_balance">primary_fungible_store::balance</a>(bridge_address, <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_metadata">vault::reward_metadata</a>())
            &gt;= module_store.minimum_eligible_tvl,
        <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EMIN_ELIGIBLE_TVL">EMIN_ELIGIBLE_TVL</a>)
    );
    // bridge info
    <a href="_add">table::add</a>(
        &<b>mut</b> module_store.bridges,
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a> {
            is_registered: <b>true</b>,
            bridge_id: <a href="_encode_u64">table_key::encode_u64</a>(bridge_id),
            version: <a href="_encode_u64">table_key::encode_u64</a>(new_version)
        },
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Bridge">Bridge</a> {
            init_stage: module_store.stage + 1,
            end_stage: 0,
            bridge_addr: bridge_address,
            operator_addr: <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>,
            vip_l2_score_contract,
            vip_weight: <a href="_zero">bigdecimal::zero</a>(),
            vm_type
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_deregister"></a>

## Function `deregister`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_deregister">deregister</a>(chain: &<a href="">signer</a>, bridge_id: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_deregister">deregister</a>(chain: &<a href="">signer</a>, bridge_id: u64) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (is_registered, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
    <b>assert</b>!(is_registered, <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_REGISTERED">EBRIDGE_NOT_REGISTERED</a>));

    <b>let</b> bridge_id_vec = <a href="_encode_u64">table_key::encode_u64</a>(bridge_id);
    <b>let</b> version_vec = <a href="_encode_u64">table_key::encode_u64</a>(version);
    <b>let</b> bridge =
        <a href="_remove">table::remove</a>(
            &<b>mut</b> module_store.bridges,
            <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a> {
                is_registered: <b>true</b>,
                bridge_id: bridge_id_vec,
                version: version_vec
            }
        );
    <a href="_add">table::add</a>(
        &<b>mut</b> module_store.bridges,
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a> {
            is_registered: <b>false</b>,
            bridge_id: bridge_id_vec,
            version: version_vec
        },
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Bridge">Bridge</a> {
            init_stage: bridge.init_stage,
            end_stage: module_store.stage,
            bridge_addr: bridge.bridge_addr,
            operator_addr: bridge.operator_addr,
            vip_l2_score_contract: bridge.vip_l2_score_contract,
            vip_weight: <a href="_zero">bigdecimal::zero</a>(),
            vm_type: bridge.vm_type
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent"></a>

## Function `update_agent`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent">update_agent</a>(old_agent: &<a href="">signer</a>, new_agent: <b>address</b>, new_api_uri: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent">update_agent</a>(
    old_agent: &<a href="">signer</a>, new_agent: <b>address</b>, new_api_uri: <a href="_String">string::String</a>
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_check_agent_permission">check_agent_permission</a>(old_agent);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    module_store.agent_data = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData">AgentData</a> { agent: new_agent, api_uri: new_api_uri };
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent_by_chain"></a>

## Function `update_agent_by_chain`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent_by_chain">update_agent_by_chain</a>(chain: &<a href="">signer</a>, new_agent: <b>address</b>, new_api_uri: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_agent_by_chain">update_agent_by_chain</a>(
    chain: &<a href="">signer</a>, new_agent: <b>address</b>, new_api_uri: <a href="_String">string::String</a>
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    module_store.agent_data = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_AgentData">AgentData</a> { agent: new_agent, api_uri: new_api_uri };
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot"></a>

## Function `add_tvl_snapshot`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot">add_tvl_snapshot</a>()
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot">add_tvl_snapshot</a>() <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot_internal">add_tvl_snapshot_internal</a>(module_store);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_fund_reward_script"></a>

## Function `fund_reward_script`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_fund_reward_script">fund_reward_script</a>(agent: &<a href="">signer</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_fund_reward_script">fund_reward_script</a>(agent: &<a href="">signer</a>) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> (_, fund_time) = <a href="_get_block_info">block::get_block_info</a>();
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_check_agent_permission">check_agent_permission</a>(agent);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot_internal">add_tvl_snapshot_internal</a>(module_store);
    // <b>update</b> stage
    module_store.stage = module_store.stage + 1;
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot_internal">add_tvl_snapshot_internal</a>(module_store);
    <b>let</b> fund_stage = module_store.stage;
    <b>let</b> stage_end_time = module_store.stage_end_time;
    <b>let</b> stage_interval = module_store.stage_interval;
    <b>assert</b>!(
        stage_end_time &lt;= fund_time,
        <a href="_invalid_state">error::invalid_state</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ETOO_EARLY_FUND">ETOO_EARLY_FUND</a>)
    );

    // <b>update</b> stage start_time
    module_store.stage_start_time = stage_end_time;
    module_store.stage_end_time = stage_end_time + stage_interval;
    <b>let</b> initial_reward_amount = <a href="vault.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vault_reward_per_stage">vault::reward_per_stage</a>();
    <b>let</b> (
        total_operator_funded_reward,
        total_user_funded_reward,
        operator_funded_rewards,
        user_funded_rewards
    ) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_fund_reward">fund_reward</a>(
        module_store,
        fund_stage,
        initial_reward_amount
    );
    <a href="_add">table::add</a>(
        &<b>mut</b> module_store.stage_data,
        <a href="_encode_u64">table_key::encode_u64</a>(fund_stage),
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData">StageData</a> {
            stage_start_time: module_store.stage_start_time,
            stage_end_time: module_store.stage_end_time,
            pool_split_ratio: module_store.pool_split_ratio,
            total_operator_funded_reward,
            operator_funded_rewards,
            total_user_funded_reward,
            user_funded_rewards,
            vesting_period: module_store.vesting_period,
            minimum_score_ratio: module_store.minimum_score_ratio,
            snapshots: <a href="_new">table::new</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a>, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot">Snapshot</a>&gt;()
        }
    );

    <a href="_emit">event::emit</a>(
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageAdvanceEvent">StageAdvanceEvent</a> {
            stage: fund_stage,
            stage_start_time: module_store.stage_start_time,
            stage_end_time: module_store.stage_end_time,
            pool_split_ratio: module_store.pool_split_ratio,
            total_operator_funded_reward,
            total_user_funded_reward,
            vesting_period: module_store.vesting_period,
            minimum_score_ratio: module_store.minimum_score_ratio
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_submit_snapshot"></a>

## Function `submit_snapshot`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_submit_snapshot">submit_snapshot</a>(agent: &<a href="">signer</a>, bridge_id: u64, version: u64, stage: u64, merkle_root: <a href="">vector</a>&lt;u8&gt;, total_l2_score: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_submit_snapshot">submit_snapshot</a>(
    agent: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    stage: u64,
    merkle_root: <a href="">vector</a>&lt;u8&gt;,
    total_l2_score: u64
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_check_agent_permission">check_agent_permission</a>(agent);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);

    // submitted snapshot under the current stage
    <b>assert</b>!(
        stage &lt; module_store.stage,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_SNAPSHOT">EINVALID_STAGE_SNAPSHOT</a>)
    );
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(
            &module_store.stage_data,
            <a href="_encode_u64">table_key::encode_u64</a>(stage)
        ),
        <a href="_not_found">error::not_found</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESTAGE_DATA_NOT_FOUND">ESTAGE_DATA_NOT_FOUND</a>)
    );
    // check previous stage snapshot for preventing skipping stage
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_check_previous_stage_snapshot">check_previous_stage_snapshot</a>(module_store, bridge_id, version, stage);
    <b>let</b> stage_data = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_load_stage_data_mut">load_stage_data_mut</a>(module_store, stage);
    <b>let</b> snapshot_key = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a> {
        bridge_id: <a href="_encode_u64">table_key::encode_u64</a>(bridge_id),
        version: <a href="_encode_u64">table_key::encode_u64</a>(version)
    };
    <b>assert</b>!(
        !<a href="_contains">table::contains</a>(&stage_data.snapshots, snapshot_key),
        <a href="_already_exists">error::already_exists</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESNAPSHOT_ALREADY_EXISTS">ESNAPSHOT_ALREADY_EXISTS</a>)
    );

    <b>let</b> (_, create_time) = <a href="_get_block_info">block::get_block_info</a>();

    <a href="_add">table::add</a>(
        &<b>mut</b> stage_data.snapshots,
        snapshot_key,
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot">Snapshot</a> {
            create_time,
            upsert_time: create_time,
            merkle_root,
            total_l2_score
        }
    );

    <a href="_emit">event::emit</a>(
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SubmitSnapshotEvent">SubmitSnapshotEvent</a> {
            bridge_id,
            version,
            stage,
            total_l2_score,
            merkle_root,
            create_time
        }
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_user_reward_script"></a>

## Function `batch_claim_user_reward_script`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_user_reward_script">batch_claim_user_reward_script</a>(<a href="">account</a>: &<a href="">signer</a>, bridge_id: u64, version: u64, stages: <a href="">vector</a>&lt;u64&gt;, merkle_proofs: <a href="">vector</a>&lt;<a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;&gt;, l2_scores: <a href="">vector</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_user_reward_script">batch_claim_user_reward_script</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    stages: <a href="">vector</a>&lt;u64&gt;, /*always consecutively and sort asc*/
    merkle_proofs: <a href="">vector</a>&lt;<a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;&gt;,
    l2_scores: <a href="">vector</a>&lt;u64&gt;
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> account_addr = <a href="_address_of">signer::address_of</a>(<a href="">account</a>);
    <b>let</b> len = <a href="_length">vector::length</a>(&stages);
    <b>assert</b>!(
        len != 0
            && len == <a href="_length">vector::length</a>(&merkle_proofs)
            && len == <a href="_length">vector::length</a>(&l2_scores),
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_BATCH_ARGUMENT">EINVALID_BATCH_ARGUMENT</a>)
    );

    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> start_stage = *<a href="_borrow">vector::borrow</a>(&<b>mut</b> stages, 0);
    <b>let</b> end_stage = *<a href="_borrow">vector::borrow</a>(&<b>mut</b> stages, len - 1);
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_check_user_reward_claimable">check_user_reward_claimable</a>(
        module_store,
        <a href="">account</a>,
        bridge_id,
        version,
        start_stage,
        end_stage
    );
    <b>let</b> vesting_period = module_store.vesting_period;
    <b>let</b> minimum_score_ratio = module_store.minimum_score_ratio;

    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot_internal">add_tvl_snapshot_internal</a>(module_store);

    <b>let</b> prev_stage = start_stage - 1;
    // make <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting">vesting</a> position claim info
    <b>let</b> claim_infos: <a href="">vector</a>&lt;UserVestingClaimInfo&gt; = <a href="">vector</a>[];
    <a href="_enumerate_ref">vector::enumerate_ref</a>(
        &stages,
        |i, stage| {
            // check stages consecutively
            <b>assert</b>!(
                *stage == prev_stage + 1,
                <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_ORDER">EINVALID_STAGE_ORDER</a>)
            );
            <b>let</b> merkle_proof = <a href="_borrow">vector::borrow</a>(&merkle_proofs, i);
            <b>let</b> l2_score = <a href="_borrow">vector::borrow</a>(&l2_scores, i);

            <b>let</b> snapshot = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_load_snapshot_imut">load_snapshot_imut</a>(
                module_store, *stage, bridge_id, version
            );
            // check merkle proof
            <b>let</b> target_hash =
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_score_hash">score_hash</a>(
                    bridge_id,
                    *stage,
                    account_addr,
                    *l2_score,
                    snapshot.total_l2_score
                );
            <b>if</b> (*l2_score != 0) {
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_assert_merkle_proofs">assert_merkle_proofs</a>(
                    *merkle_proof,
                    snapshot.merkle_root,
                    target_hash
                );
            };
            <a href="_push_back">vector::push_back</a>(
                &<b>mut</b> claim_infos,
                <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_user_vesting_claim_info">vesting::build_user_vesting_claim_info</a>(
                    *stage,
                    *stage + vesting_period,
                    *l2_score,
                    minimum_score_ratio,
                    snapshot.total_l2_score,
                    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_user_funded_reward_internal">get_user_funded_reward_internal</a>(module_store, bridge_id, *stage)
                )
            );
            prev_stage = *stage;

        }
    );
    // call batch claim user reward; <b>return</b> net reward(total vested reward)
    <b>let</b> net_reward =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_user_reward">vesting::batch_claim_user_reward</a>(
            account_addr, bridge_id, version, claim_infos
        );

    <a href="_deposit">coin::deposit</a>(account_addr, net_reward);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_operator_reward_script"></a>

## Function `batch_claim_operator_reward_script`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_operator_reward_script">batch_claim_operator_reward_script</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, version: u64)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_claim_operator_reward_script">batch_claim_operator_reward_script</a>(
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, version: u64
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_check_operator_permission">operator::check_operator_permission</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>, bridge_id, version);

    <b>if</b> (!<a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_is_operator_vesting_store_registered">vesting::is_operator_vesting_store_registered</a>(bridge_id, version)) {
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_register_operator_vesting_store">vesting::register_operator_vesting_store</a>(bridge_id, version);
    };
    <b>let</b> account_addr = <a href="_address_of">signer::address_of</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>);
    // check <b>if</b> the claim is attempted from a position that <b>has</b> not been finalized.
    <b>let</b> last_submitted_stage = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_submitted_stage">get_last_submitted_stage</a>(bridge_id, version);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot_internal">add_tvl_snapshot_internal</a>(module_store);

    <b>let</b> last_claimed_stage =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_get_operator_last_claimed_stage">vesting::get_operator_last_claimed_stage</a>(bridge_id, version);
    <b>if</b> (last_claimed_stage == 0) {
        <b>let</b> (is_registered, last_version) =
            <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
        <b>let</b> is_bridge_registered = is_registered && last_version == version;
        <b>let</b> key = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a> {
            is_registered: is_bridge_registered,
            bridge_id: <a href="_encode_u64">table_key::encode_u64</a>(bridge_id),
            version: <a href="_encode_u64">table_key::encode_u64</a>(version)
        };
        <b>let</b> bridge_info = <a href="_borrow">table::borrow</a>(&module_store.bridges, key);
        <b>let</b> init_stage = bridge_info.init_stage;
        last_claimed_stage = init_stage - 1;
    };

    <b>let</b> claim_infos: <a href="">vector</a>&lt;OperatorVestingClaimInfo&gt; = <a href="">vector</a>[];
    <b>let</b> stage = last_claimed_stage + 1;
    <b>while</b> (stage &lt;= last_submitted_stage) {
        <b>let</b> stage_key = <a href="_encode_u64">table_key::encode_u64</a>(stage);
        <b>assert</b>!(
            <a href="_contains">table::contains</a>(&module_store.stage_data, stage_key),
            <a href="_not_found">error::not_found</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESTAGE_DATA_NOT_FOUND">ESTAGE_DATA_NOT_FOUND</a>)
        );
        <b>let</b> stage_data = <a href="_borrow">table::borrow</a>(&module_store.stage_data, stage_key);
        <b>assert</b>!(
            <a href="_contains">table::contains</a>(
                &stage_data.snapshots,
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a> {
                    bridge_id: <a href="_encode_u64">table_key::encode_u64</a>(bridge_id),
                    version: <a href="_encode_u64">table_key::encode_u64</a>(version)
                }
            ),
            <a href="_not_found">error::not_found</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ESNAPSHOT_NOT_FOUND">ESNAPSHOT_NOT_FOUND</a>)
        );
        <a href="_push_back">vector::push_back</a>(
            &<b>mut</b> claim_infos,
            <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_build_operator_vesting_claim_info">vesting::build_operator_vesting_claim_info</a>(
                stage,
                stage + module_store.vesting_period,
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_operator_funded_reward_internal">get_operator_funded_reward_internal</a>(module_store, bridge_id, stage)
            )
        );
        stage = stage + 1;
    };

    // call batch claim <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a> reward;
    <b>let</b> net_reward =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_batch_claim_operator_reward">vesting::batch_claim_operator_reward</a>(
            account_addr,
            bridge_id,
            version,
            last_submitted_stage,
            claim_infos
        );
    <a href="_deposit">coin::deposit</a>(<a href="_address_of">signer::address_of</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>), net_reward);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights"></a>

## Function `update_vip_weights`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights">update_vip_weights</a>(chain: &<a href="">signer</a>, bridge_ids: <a href="">vector</a>&lt;u64&gt;, weights: <a href="">vector</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights">update_vip_weights</a>(
    chain: &<a href="">signer</a>, bridge_ids: <a href="">vector</a>&lt;u64&gt;, weights: <a href="">vector</a>&lt;BigDecimal&gt;
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weights_for_friend">update_vip_weights_for_friend</a>(bridge_ids, weights)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weight"></a>

## Function `update_vip_weight`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weight">update_vip_weight</a>(chain: &<a href="">signer</a>, bridge_id: u64, weight: <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_vip_weight">update_vip_weight</a>(
    chain: &<a href="">signer</a>, bridge_id: u64, weight: BigDecimal
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (is_registered, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
    <b>assert</b>!(is_registered, <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_REGISTERED">EBRIDGE_NOT_REGISTERED</a>));
    <b>let</b> bridge = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_load_registered_bridge_mut">load_registered_bridge_mut</a>(module_store, bridge_id, version);
    bridge.vip_weight = weight;
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_validate_vip_weights">validate_vip_weights</a>(module_store);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_params"></a>

## Function `update_params`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_params">update_params</a>(chain: &<a href="">signer</a>, stage_interval: <a href="_Option">option::Option</a>&lt;u64&gt;, vesting_period: <a href="_Option">option::Option</a>&lt;u64&gt;, minimum_lock_staking_period: <a href="_Option">option::Option</a>&lt;u64&gt;, minimum_eligible_tvl: <a href="_Option">option::Option</a>&lt;u64&gt;, _maximum_tvl_ratio: <a href="_Option">option::Option</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;, maximum_weight_ratio: <a href="_Option">option::Option</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;, minimum_score_ratio: <a href="_Option">option::Option</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;, pool_split_ratio: <a href="_Option">option::Option</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;, challenge_period: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_params">update_params</a>(
    chain: &<a href="">signer</a>,
    stage_interval: Option&lt;u64&gt;,
    vesting_period: Option&lt;u64&gt;,
    minimum_lock_staking_period: Option&lt;u64&gt;,
    minimum_eligible_tvl: Option&lt;u64&gt;,
    _maximum_tvl_ratio: Option&lt;BigDecimal&gt;, // DEPRECATED
    maximum_weight_ratio: Option&lt;BigDecimal&gt;,
    minimum_score_ratio: Option&lt;BigDecimal&gt;,
    pool_split_ratio: Option&lt;BigDecimal&gt;,
    challenge_period: Option&lt;u64&gt;
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>if</b> (<a href="_is_some">option::is_some</a>(&stage_interval)) {
        module_store.stage_interval = <a href="_extract">option::extract</a>(&<b>mut</b> stage_interval);
        <b>assert</b>!(
            module_store.stage_interval &gt; 0,
            <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_STAGE_INTERVAL">EINVALID_STAGE_INTERVAL</a>)
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&vesting_period)) {
        module_store.vesting_period = <a href="_extract">option::extract</a>(&<b>mut</b> vesting_period);
        <b>assert</b>!(
            module_store.vesting_period &gt; 0,
            <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_VEST_PERIOD">EINVALID_VEST_PERIOD</a>)
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&minimum_lock_staking_period)) {
        module_store.minimum_lock_staking_period = <a href="_extract">option::extract</a>(
            &<b>mut</b> minimum_lock_staking_period
        );
        <b>assert</b>!(
            module_store.minimum_lock_staking_period &gt; 0,
            <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_LOCK_STKAING_PERIOD">EINVALID_LOCK_STKAING_PERIOD</a>)
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&minimum_eligible_tvl)) {
        module_store.minimum_eligible_tvl = <a href="_extract">option::extract</a>(
            &<b>mut</b> minimum_eligible_tvl
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&maximum_weight_ratio)) {
        module_store.maximum_weight_ratio = <a href="_extract">option::extract</a>(
            &<b>mut</b> maximum_weight_ratio
        );
        <b>assert</b>!(
            <a href="_le">bigdecimal::le</a>(module_store.maximum_weight_ratio, <a href="_one">bigdecimal::one</a>()),
            <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_RATIO">EINVALID_RATIO</a>)
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&minimum_score_ratio)) {
        module_store.minimum_score_ratio = <a href="_extract">option::extract</a>(&<b>mut</b> minimum_score_ratio);
        <b>assert</b>!(
            <a href="_le">bigdecimal::le</a>(module_store.minimum_score_ratio, <a href="_one">bigdecimal::one</a>()),
            <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_RATIO">EINVALID_RATIO</a>)
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&pool_split_ratio)) {
        module_store.pool_split_ratio = <a href="_extract">option::extract</a>(&<b>mut</b> pool_split_ratio);
        <b>assert</b>!(
            <a href="_le">bigdecimal::le</a>(module_store.pool_split_ratio, <a href="_one">bigdecimal::one</a>()),
            <a href="_invalid_argument">error::invalid_argument</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EINVALID_RATIO">EINVALID_RATIO</a>)
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&challenge_period)) {
        module_store.challenge_period = <a href="_extract">option::extract</a>(&<b>mut</b> challenge_period);
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator_commission"></a>

## Function `update_operator_commission`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator_commission">update_operator_commission</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, version: u64, commission_rate: <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator_commission">update_operator_commission</a>(
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    commission_rate: BigDecimal
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_commission">operator::update_operator_commission</a>(
        <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>,
        bridge_id,
        version,
        module_store.stage,
        commission_rate
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_l2_score_contract"></a>

## Function `update_l2_score_contract`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_l2_score_contract">update_l2_score_contract</a>(chain: &<a href="">signer</a>, bridge_id: u64, new_vip_l2_score_contract: <a href="_String">string::String</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_l2_score_contract">update_l2_score_contract</a>(
    chain: &<a href="">signer</a>, bridge_id: u64, new_vip_l2_score_contract: <a href="_String">string::String</a>
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (is_registered, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
    <b>assert</b>!(is_registered, <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_REGISTERED">EBRIDGE_NOT_REGISTERED</a>));
    <b>let</b> bridge = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_load_registered_bridge_mut">load_registered_bridge_mut</a>(module_store, bridge_id, version);
    bridge.vip_l2_score_contract = new_vip_l2_score_contract;
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator"></a>

## Function `update_operator`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator">update_operator</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, new_operator_addr: <b>address</b>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_update_operator">update_operator</a>(
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>: &<a href="">signer</a>, bridge_id: u64, new_operator_addr: <b>address</b>
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (is_registered, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
    <b>assert</b>!(is_registered, <a href="_unavailable">error::unavailable</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EBRIDGE_NOT_REGISTERED">EBRIDGE_NOT_REGISTERED</a>));
    <b>let</b> bridge = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_load_registered_bridge_mut">load_registered_bridge_mut</a>(module_store, bridge_id, version);
    <b>assert</b>!(
        bridge.operator_addr == <a href="_address_of">signer::address_of</a>(<a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>),
        <a href="_permission_denied">error::permission_denied</a>(<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_EUNAUTHORIZED">EUNAUTHORIZED</a>)
    );
    bridge.operator_addr = new_operator_addr;
    <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator_update_operator_addr">operator::update_operator_addr</a>(
        <a href="operator.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_operator">operator</a>,
        bridge_id,
        version,
        new_operator_addr
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_lock_stake_script"></a>

## Function `lock_stake_script`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_lock_stake_script">lock_stake_script</a>(<a href="">account</a>: &<a href="">signer</a>, bridge_id: u64, version: u64, lp_metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;, validator: <a href="_String">string::String</a>, stage: u64, esinit_amount: u64, stakelisted_metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, stakelisted_amount: u64, release_time: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_lock_stake_script">lock_stake_script</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    lp_metadata: Object&lt;Metadata&gt;,
    min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;,
    validator: <a href="_String">string::String</a>,
    stage: u64,
    esinit_amount: u64,
    stakelisted_metadata: Object&lt;Metadata&gt;,
    stakelisted_amount: u64,
    release_time: Option&lt;u64&gt;
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> account_addr = <a href="_address_of">signer::address_of</a>(<a href="">account</a>);
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_check_lock_stakable">check_lock_stakable</a>(account_addr, bridge_id, version, stage);
    <b>let</b> esinit =
        <a href="vesting.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vesting_withdraw_vesting">vesting::withdraw_vesting</a>(
            account_addr,
            bridge_id,
            version,
            stage,
            esinit_amount
        );

    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_lock_stake">lock_stake</a>(
        <a href="">account</a>,
        lp_metadata,
        min_liquidity,
        validator,
        esinit,
        stakelisted_metadata,
        stakelisted_amount,
        release_time
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_lock_stake_script"></a>

## Function `batch_lock_stake_script`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_lock_stake_script">batch_lock_stake_script</a>(<a href="">account</a>: &<a href="">signer</a>, bridge_id: u64, version: u64, lp_metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;, validator: <a href="_String">string::String</a>, stage: <a href="">vector</a>&lt;u64&gt;, esinit_amount: <a href="">vector</a>&lt;u64&gt;, stakelisted_metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, stakelisted_amount: u64, lock_stake_period: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_lock_stake_script">batch_lock_stake_script</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    lp_metadata: Object&lt;Metadata&gt;,
    min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;,
    validator: <a href="_String">string::String</a>,
    stage: <a href="">vector</a>&lt;u64&gt;,
    esinit_amount: <a href="">vector</a>&lt;u64&gt;,
    stakelisted_metadata: Object&lt;Metadata&gt;,
    stakelisted_amount: u64,
    lock_stake_period: Option&lt;u64&gt;
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> esinit =
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_withdraw_esinit_for_lock_stake">withdraw_esinit_for_lock_stake</a>(
            <a href="">account</a>,
            bridge_id,
            version,
            stage,
            esinit_amount
        );

    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_lock_stake">lock_stake</a>(
        <a href="">account</a>,
        lp_metadata,
        min_liquidity,
        validator,
        esinit,
        stakelisted_metadata,
        stakelisted_amount,
        lock_stake_period
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_stableswap_lock_stake_script"></a>

## Function `batch_stableswap_lock_stake_script`



<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_stableswap_lock_stake_script">batch_stableswap_lock_stake_script</a>(<a href="">account</a>: &<a href="">signer</a>, bridge_id: u64, version: u64, lp_metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;, validator: <a href="_String">string::String</a>, stage: <a href="">vector</a>&lt;u64&gt;, esinit_amount: <a href="">vector</a>&lt;u64&gt;, lock_stake_period: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_batch_stableswap_lock_stake_script">batch_stableswap_lock_stake_script</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    bridge_id: u64,
    version: u64,
    lp_metadata: Object&lt;Metadata&gt;,
    min_liquidity: <a href="_Option">option::Option</a>&lt;u64&gt;,
    validator: <a href="_String">string::String</a>,
    stage: <a href="">vector</a>&lt;u64&gt;,
    esinit_amount: <a href="">vector</a>&lt;u64&gt;,
    lock_stake_period: Option&lt;u64&gt;
) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> esinit =
        <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_withdraw_esinit_for_lock_stake">withdraw_esinit_for_lock_stake</a>(
            <a href="">account</a>,
            bridge_id,
            version,
            stage,
            esinit_amount
        );

    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_stableswap_lock_stake">stableswap_lock_stake</a>(
        <a href="">account</a>,
        lp_metadata,
        min_liquidity,
        validator,
        esinit,
        lock_stake_period
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_submitted_stage"></a>

## Function `get_last_submitted_stage`



<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_submitted_stage">get_last_submitted_stage</a>(bridge_id: u64, version: u64): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_submitted_stage">get_last_submitted_stage</a>(bridge_id: u64, version: u64): u64 <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> iter = <a href="_iter">table::iter</a>(
        &module_store.stage_data,
        <a href="_none">option::none</a>(),
        <a href="_none">option::none</a>(),
        2
    );

    <b>loop</b> {
        <b>if</b> (!<a href="_prepare">table::prepare</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData">StageData</a>&gt;(iter)) { <b>break</b> };

        <b>let</b> (stage_vec, value) = <a href="_next">table::next</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_StageData">StageData</a>&gt;(iter);

        <b>let</b> _iter =
            <a href="_iter">table::iter</a>(
                &value.snapshots,
                <a href="_some">option::some</a>(
                    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a> {
                        bridge_id: <a href="_encode_u64">table_key::encode_u64</a>(bridge_id),
                        version: <a href="_encode_u64">table_key::encode_u64</a>(version)
                    }
                ),
                <a href="_some">option::some</a>(
                    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a> {
                        bridge_id: <a href="_encode_u64">table_key::encode_u64</a>(bridge_id + 1),
                        version: <a href="_encode_u64">table_key::encode_u64</a>(0)
                    }
                ),
                2
            );
        <b>loop</b> {
            <b>if</b> (!<a href="_prepare">table::prepare</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a>, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot">Snapshot</a>&gt;(_iter)) { <b>break</b> };
            <b>let</b> (_key, _value) = <a href="_next">table::next</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_SnapshotKey">SnapshotKey</a>, <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_Snapshot">Snapshot</a>&gt;(_iter);
            <b>if</b> (<a href="_decode_u64">table_key::decode_u64</a>(_key.bridge_id) == bridge_id
                && <a href="_decode_u64">table_key::decode_u64</a>(_key.version) == version) {
                <b>return</b> <a href="_decode_u64">table_key::decode_u64</a>(stage_vec)
            }
        };
    };

    0
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_whitelisted_bridge_ids"></a>

## Function `get_whitelisted_bridge_ids`



<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_whitelisted_bridge_ids">get_whitelisted_bridge_ids</a>(): (<a href="">vector</a>&lt;u64&gt;, <a href="">vector</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_whitelisted_bridge_ids">get_whitelisted_bridge_ids</a>(): (<a href="">vector</a>&lt;u64&gt;, <a href="">vector</a>&lt;u64&gt;) <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_whitelisted_bridge_ids_internal">get_whitelisted_bridge_ids_internal</a>(module_store)
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_is_registered"></a>

## Function `is_registered`



<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_is_registered">is_registered</a>(bridge_id: u64): bool
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_is_registered">is_registered</a>(bridge_id: u64): bool <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (is_registered, _) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(module_store, bridge_id);
    is_registered
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_bridge_infos"></a>

## Function `get_bridge_infos`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_bridge_infos">get_bridge_infos</a>(): <a href="">vector</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeResponse">vip::BridgeResponse</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_bridge_infos">get_bridge_infos</a>(): <a href="">vector</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeResponse">BridgeResponse</a>&gt; <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> bridge_infos = <a href="_empty">vector::empty</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeResponse">BridgeResponse</a>&gt;();
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk">utils::walk</a>(
        &module_store.bridges,
        <a href="_some">option::some</a>(
            <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeInfoKey">BridgeInfoKey</a> {
                is_registered: <b>true</b>,
                bridge_id: <a href="_encode_u64">table_key::encode_u64</a>(0),
                version: <a href="_encode_u64">table_key::encode_u64</a>(0)
            }
        ),
        <a href="_none">option::none</a>(),
        1,
        |key, bridge| {
            <b>let</b> (_, bridge_id, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_unpack_bridge_info_key">unpack_bridge_info_key</a>(key);
            <a href="_push_back">vector::push_back</a>(
                &<b>mut</b> bridge_infos,
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_BridgeResponse">BridgeResponse</a> {
                    init_stage: bridge.init_stage,
                    bridge_id,
                    version,
                    bridge_addr: bridge.bridge_addr,
                    operator_addr: bridge.operator_addr,
                    vip_l2_score_contract: bridge.vip_l2_score_contract,
                    vip_weight: bridge.vip_weight,
                    vm_type: bridge.vm_type
                }
            );

            <b>false</b>
        }
    );
    bridge_infos
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_total_l2_scores"></a>

## Function `get_total_l2_scores`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_total_l2_scores">get_total_l2_scores</a>(stage: u64): <a href="">vector</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_TotalL2ScoreResponse">vip::TotalL2ScoreResponse</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_total_l2_scores">get_total_l2_scores</a>(stage: u64): <a href="">vector</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_TotalL2ScoreResponse">TotalL2ScoreResponse</a>&gt; <b>acquires</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> stage_key = <a href="_encode_u64">table_key::encode_u64</a>(stage);
    <b>let</b> stage_data = <a href="_borrow">table::borrow</a>(&module_store.stage_data, stage_key);
    <b>let</b> total_l2_scores: <a href="">vector</a>&lt;<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_TotalL2ScoreResponse">TotalL2ScoreResponse</a>&gt; = <a href="">vector</a>[];
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_walk">utils::walk</a>(
        &stage_data.snapshots,
        <a href="_none">option::none</a>(),
        <a href="_none">option::none</a>(),
        1,
        |key, snapshot| {
            <b>let</b> (bridge_id, version) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_unpack_snapshot_key">unpack_snapshot_key</a>(key);
            <b>let</b> (is_registered, _) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_last_bridge_version">get_last_bridge_version</a>(
                module_store, bridge_id
            );
            <b>if</b> (is_registered) {
                <a href="_push_back">vector::push_back</a>(
                    &<b>mut</b> total_l2_scores,
                    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_TotalL2ScoreResponse">TotalL2ScoreResponse</a> {
                        bridge_id,
                        version,
                        total_l2_score: snapshot.total_l2_score
                    }
                );
            };
            <b>false</b>
        }
    );
    total_l2_scores
}
</code></pre>
