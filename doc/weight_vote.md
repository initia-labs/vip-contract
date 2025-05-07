
<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote"></a>

# Module `0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::weight_vote`



-  [Resource `ModuleStore`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore)
-  [Struct `Proposal`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Proposal)
-  [Struct `WeightVote`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVote)
-  [Struct `Weight`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Weight)
-  [Struct `Vote`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Vote)
-  [Struct `ProposalResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ProposalResponse)
-  [Struct `WeightVoteResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVoteResponse)
-  [Struct `TallyResponse`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_TallyResponse)
-  [Struct `VoteEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_VoteEvent)
-  [Struct `ExecuteProposalEvent`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ExecuteProposalEvent)
-  [Constants](#@Constants_0)
-  [Function `initialize`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_initialize)
-  [Function `update_params`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_params)
-  [Function `update_pair_multiplier`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_pair_multiplier)
-  [Function `vote`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_vote)
-  [Function `create_proposal`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_create_proposal)
-  [Function `execute_proposal`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_execute_proposal)
-  [Function `get_total_tally`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_total_tally)
-  [Function `get_tally_infos`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_tally_infos)
-  [Function `get_proposal`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_proposal)
-  [Function `get_voting_power`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_voting_power)
-  [Function `get_weight_vote`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_weight_vote)
-  [Function `get_pair_multipliers`](#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_pair_multipliers)


<pre><code><b>use</b> <a href="">0x1::address</a>;
<b>use</b> <a href="">0x1::bigdecimal</a>;
<b>use</b> <a href="">0x1::block</a>;
<b>use</b> <a href="">0x1::coin</a>;
<b>use</b> <a href="">0x1::error</a>;
<b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::fungible_asset</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::simple_map</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::table</a>;
<b>use</b> <a href="">0x1::table_key</a>;
<b>use</b> <a href="">0x1::vector</a>;
<b>use</b> <a href="lock_staking.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_lock_staking">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::lock_staking</a>;
<b>use</b> <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::utils</a>;
<b>use</b> <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789::vip</a>;
<b>use</b> <a href="">0xb1a654f76c87b27b54cecf60dd950498fa385a7d65f628af8c63c3ff10d5b576::vesting</a>;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore"></a>

## Resource `ModuleStore`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> <b>has</b> key
</code></pre>



##### Fields


<dl>
<dt>
<code>current_cycle: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>cycle_interval: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>cycle_start_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>cycle_end_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>proposals: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Proposal">weight_vote::Proposal</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_period: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>pair_multipliers: <a href="_Table">table::Table</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, <a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>core_vesting_creator: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>max_lock_period_multiplier: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>min_lock_period_multiplier: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Proposal"></a>

## Struct `Proposal`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Proposal">Proposal</a> <b>has</b> store
</code></pre>



##### Fields


<dl>
<dt>
<code>votes: <a href="_Table">table::Table</a>&lt;<b>address</b>, <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVote">weight_vote::WeightVote</a>&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>total_tally: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>tallies: <a href="_Table">table::Table</a>&lt;<a href="">vector</a>&lt;u8&gt;, u64&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_end_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>executed: bool</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVote"></a>

## Struct `WeightVote`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVote">WeightVote</a> <b>has</b> store
</code></pre>



##### Fields


<dl>
<dt>
<code>max_voting_power: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_power: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>weights: <a href="">vector</a>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Weight">weight_vote::Weight</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Weight"></a>

## Struct `Weight`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Weight">Weight</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>bridge_id: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>weight: <a href="_BigDecimal">bigdecimal::BigDecimal</a></code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Vote"></a>

## Struct `Vote`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Vote">Vote</a> <b>has</b> store
</code></pre>



##### Fields


<dl>
<dt>
<code>vote_option: bool</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_power: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ProposalResponse"></a>

## Struct `ProposalResponse`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ProposalResponse">ProposalResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>total_tally: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_end_time: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>executed: bool</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVoteResponse"></a>

## Struct `WeightVoteResponse`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVoteResponse">WeightVoteResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>max_voting_power: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_power: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>weights: <a href="">vector</a>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Weight">weight_vote::Weight</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_TallyResponse"></a>

## Struct `TallyResponse`



<pre><code><b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_TallyResponse">TallyResponse</a> <b>has</b> drop
</code></pre>



##### Fields


<dl>
<dt>
<code>bridge_id: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>tally: u64</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_VoteEvent"></a>

## Struct `VoteEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_VoteEvent">VoteEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code><a href="">account</a>: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>cycle: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>max_voting_power: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>voting_power: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>weights: <a href="">vector</a>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Weight">weight_vote::Weight</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ExecuteProposalEvent"></a>

## Struct `ExecuteProposalEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ExecuteProposalEvent">ExecuteProposalEvent</a> <b>has</b> drop, store
</code></pre>



##### Fields


<dl>
<dt>
<code>cycle: u64</code>
</dt>
<dd>

</dd>
<dt>
<code>bridge_ids: <a href="">vector</a>&lt;u64&gt;</code>
</dt>
<dd>

</dd>
<dt>
<code>weights: <a href="">vector</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;</code>
</dt>
<dd>

</dd>
</dl>


<a id="@Constants_0"></a>

## Constants


<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EUNAUTHORIZED"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EUNAUTHORIZED">EUNAUTHORIZED</a>: u64 = 2;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_ARGS_LENGTH"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_ARGS_LENGTH">EINVALID_ARGS_LENGTH</a>: u64 = 9;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_DEFAULT_MAX_WEIGHT_MULTIPLIER"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_DEFAULT_MAX_WEIGHT_MULTIPLIER">DEFAULT_MAX_WEIGHT_MULTIPLIER</a>: u64 = 4;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_DEFAULT_MIN_WEIGHT_MULTIPLIER"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_DEFAULT_MIN_WEIGHT_MULTIPLIER">DEFAULT_MIN_WEIGHT_MULTIPLIER</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ECYCLE_NOT_FOUND"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ECYCLE_NOT_FOUND">ECYCLE_NOT_FOUND</a>: u64 = 10;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_BRIDGE"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_BRIDGE">EINVALID_BRIDGE</a>: u64 = 7;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_PARAMETER"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_PARAMETER">EINVALID_PARAMETER</a>: u64 = 6;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_VOTING_POWER"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_VOTING_POWER">EINVALID_VOTING_POWER</a>: u64 = 8;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EMODULE_STORE_ALREADY_EXISTS"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EMODULE_STORE_ALREADY_EXISTS">EMODULE_STORE_ALREADY_EXISTS</a>: u64 = 1;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EVOTING_END"></a>



<pre><code><b>const</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EVOTING_END">EVOTING_END</a>: u64 = 3;
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_initialize"></a>

## Function `initialize`



<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_initialize">initialize</a>(chain: &<a href="">signer</a>, cycle_start_time: u64, cycle_interval: u64, voting_period: u64, vesting_creator: <b>address</b>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_initialize">initialize</a>(
    chain: &<a href="">signer</a>,
    cycle_start_time: u64,
    cycle_interval: u64,
    voting_period: u64,
    vesting_creator: <b>address</b>
) {
    <b>assert</b>!(
        <a href="_address_of">signer::address_of</a>(chain) == @<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>,
        <a href="_permission_denied">error::permission_denied</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EUNAUTHORIZED">EUNAUTHORIZED</a>)
    );
    <b>assert</b>!(
        !<b>exists</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>),
        <a href="_already_exists">error::already_exists</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EMODULE_STORE_ALREADY_EXISTS">EMODULE_STORE_ALREADY_EXISTS</a>)
    );

    <b>move_to</b>(
        chain,
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
            current_cycle: 0,
            cycle_interval,
            cycle_start_time,
            cycle_end_time: cycle_start_time,
            proposals: <a href="_new">table::new</a>(),
            voting_period,
            pair_multipliers: <a href="_new">table::new</a>(),
            core_vesting_creator: vesting_creator,
            min_lock_period_multiplier: <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_DEFAULT_MIN_WEIGHT_MULTIPLIER">DEFAULT_MIN_WEIGHT_MULTIPLIER</a>,
            max_lock_period_multiplier: <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_DEFAULT_MAX_WEIGHT_MULTIPLIER">DEFAULT_MAX_WEIGHT_MULTIPLIER</a>
        }
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_params"></a>

## Function `update_params`



<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_params">update_params</a>(chain: &<a href="">signer</a>, cycle_interval: <a href="_Option">option::Option</a>&lt;u64&gt;, voting_period: <a href="_Option">option::Option</a>&lt;u64&gt;, core_vesting_creator: <a href="_Option">option::Option</a>&lt;<b>address</b>&gt;, max_lock_period_multiplier: <a href="_Option">option::Option</a>&lt;u64&gt;, min_lock_period_multiplier: <a href="_Option">option::Option</a>&lt;u64&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_params">update_params</a>(
    chain: &<a href="">signer</a>,
    cycle_interval: Option&lt;u64&gt;,
    voting_period: Option&lt;u64&gt;,
    core_vesting_creator: Option&lt;<b>address</b>&gt;,
    max_lock_period_multiplier: Option&lt;u64&gt;,
    min_lock_period_multiplier: Option&lt;u64&gt;
) <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);

    <b>if</b> (<a href="_is_some">option::is_some</a>(&cycle_interval)) {
        module_store.cycle_interval = <a href="_extract">option::extract</a>(&<b>mut</b> cycle_interval);
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&voting_period)) {
        module_store.voting_period = <a href="_extract">option::extract</a>(&<b>mut</b> voting_period);
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&core_vesting_creator)) {
        module_store.core_vesting_creator = <a href="_extract">option::extract</a>(
            &<b>mut</b> core_vesting_creator
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&max_lock_period_multiplier)) {
        module_store.max_lock_period_multiplier = <a href="_extract">option::extract</a>(
            &<b>mut</b> max_lock_period_multiplier
        );
    };

    <b>if</b> (<a href="_is_some">option::is_some</a>(&min_lock_period_multiplier)) {
        module_store.min_lock_period_multiplier = <a href="_extract">option::extract</a>(
            &<b>mut</b> min_lock_period_multiplier
        );
    };

    // voting period must be less than cycle interval
    <b>assert</b>!(
        module_store.voting_period &lt; module_store.cycle_interval,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_PARAMETER">EINVALID_PARAMETER</a>)
    );

    // check lock period multiplier
    <b>assert</b>!(
        module_store.min_lock_period_multiplier
            &lt;= module_store.max_lock_period_multiplier,
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_PARAMETER">EINVALID_PARAMETER</a>)
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_pair_multiplier"></a>

## Function `update_pair_multiplier`



<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_pair_multiplier">update_pair_multiplier</a>(chain: &<a href="">signer</a>, metadata: <a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;, multiplier: <a href="_BigDecimal">bigdecimal::BigDecimal</a>)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_update_pair_multiplier">update_pair_multiplier</a>(
    chain: &<a href="">signer</a>, metadata: Object&lt;Metadata&gt;, multiplier: BigDecimal
) <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_check_chain_permission">utils::check_chain_permission</a>(chain);
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="_upsert">table::upsert</a>(
        &<b>mut</b> module_store.pair_multipliers,
        metadata,
        multiplier
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_vote"></a>

## Function `vote`



<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_vote">vote</a>(<a href="">account</a>: &<a href="">signer</a>, cycle: u64, bridge_ids: <a href="">vector</a>&lt;u64&gt;, weights: <a href="">vector</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;)
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_vote">vote</a>(
    <a href="">account</a>: &<a href="">signer</a>,
    cycle: u64,
    bridge_ids: <a href="">vector</a>&lt;u64&gt;,
    weights: <a href="">vector</a>&lt;BigDecimal&gt;
) <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_create_proposal">create_proposal</a>();
    <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_add_tvl_snapshot">vip::add_tvl_snapshot</a>();
    <b>let</b> addr = <a href="_address_of">signer::address_of</a>(<a href="">account</a>);
    <b>let</b> max_voting_power = <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_voting_power">get_voting_power</a>(addr);
    <b>assert</b>!(max_voting_power != 0, <a href="_unavailable">error::unavailable</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_VOTING_POWER">EINVALID_VOTING_POWER</a>));
    <b>assert</b>!(
        <a href="_length">vector::length</a>(&bridge_ids) == <a href="_length">vector::length</a>(&weights),
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_ARGS_LENGTH">EINVALID_ARGS_LENGTH</a>
    );

    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (_, time) = get_block_info();

    // check bridge valid
    <a href="_for_each">vector::for_each</a>(
        bridge_ids,
        |bridge_id| {
            <b>assert</b>!(
                <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_is_registered">vip::is_registered</a>(bridge_id),
                <a href="_invalid_argument">error::invalid_argument</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_BRIDGE">EINVALID_BRIDGE</a>)
            );
        }
    );
    <b>let</b> weight_sum = <a href="_zero">bigdecimal::zero</a>();
    <a href="_for_each_ref">vector::for_each_ref</a>(
        &weights,
        |weight| {
            weight_sum = <a href="_add">bigdecimal::add</a>(weight_sum, *weight);
        }
    );
    <b>assert</b>!(
        <a href="_le">bigdecimal::le</a>(weight_sum, <a href="_one">bigdecimal::one</a>()),
        <a href="_invalid_argument">error::invalid_argument</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EINVALID_PARAMETER">EINVALID_PARAMETER</a>)
    );
    <b>let</b> voting_power_used =
        <a href="_mul_by_u64_truncate">bigdecimal::mul_by_u64_truncate</a>(weight_sum, max_voting_power);
    // check vote condition
    <b>let</b> cycle_key = <a href="_encode_u64">table_key::encode_u64</a>(cycle);
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(&module_store.proposals, cycle_key),
        <a href="_not_found">error::not_found</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ECYCLE_NOT_FOUND">ECYCLE_NOT_FOUND</a>)
    );
    <b>let</b> proposal = <a href="_borrow_mut">table::borrow_mut</a>(&<b>mut</b> module_store.proposals, cycle_key);
    <b>assert</b>!(
        time &lt;= proposal.voting_end_time,
        <a href="_invalid_state">error::invalid_state</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_EVOTING_END">EVOTING_END</a>)
    );

    // remove former vote
    <b>if</b> (<a href="_contains">table::contains</a>(&proposal.votes, addr)) {
        <b>let</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVote">WeightVote</a> { max_voting_power, voting_power: _, weights } =
            <a href="_remove">table::remove</a>(&<b>mut</b> proposal.votes, addr);
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_remove_vote">remove_vote</a>(proposal, max_voting_power, weights);
    };

    <b>let</b> weight_vector = <a href="">vector</a>[];
    <a href="_zip_reverse">vector::zip_reverse</a>(
        bridge_ids,
        weights,
        |bridge_id, weight| {
            <a href="_push_back">vector::push_back</a>(&<b>mut</b> weight_vector, <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Weight">Weight</a> { bridge_id, weight });
        }
    );

    // <b>apply</b> vote
    <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_apply_vote">apply_vote</a>(proposal, max_voting_power, weight_vector);

    // store user votes
    <a href="_add">table::add</a>(
        &<b>mut</b> proposal.votes,
        addr,
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVote">WeightVote</a> {
            max_voting_power,
            voting_power: voting_power_used,
            weights: weight_vector
        }
    );

    // emit <a href="">event</a>
    <a href="_emit">event::emit</a>(
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_VoteEvent">VoteEvent</a> {
            <a href="">account</a>: addr,
            cycle,
            max_voting_power,
            voting_power: voting_power_used,
            weights: weight_vector
        }
    )
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_create_proposal"></a>

## Function `create_proposal`



<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_create_proposal">create_proposal</a>()
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_create_proposal">create_proposal</a>() <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (_, time) = get_block_info();

    // cycle not end
    <b>if</b> (module_store.cycle_end_time &gt;= time) { <b>return</b> };

    // get the last voted proposal
    // execute proposal not executed
    <b>if</b> (module_store.current_cycle != 0) {
        <b>let</b> proposal =
            <a href="_borrow_mut">table::borrow_mut</a>(
                &<b>mut</b> module_store.proposals,
                <a href="_encode_u64">table_key::encode_u64</a>(module_store.current_cycle)
            );
        <b>if</b> (!proposal.executed && proposal.voting_end_time &lt; time) {
            <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_execute_proposal_internal">execute_proposal_internal</a>(proposal, module_store.current_cycle);
        };
    };
    // <b>update</b> cycle
    module_store.current_cycle = module_store.current_cycle + 1;
    module_store.cycle_start_time = <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_calculate_cycle_start_time">calculate_cycle_start_time</a>(module_store);
    <b>let</b> voting_end_time = module_store.cycle_start_time
        + module_store.voting_period;

    // set cycle end time
    module_store.cycle_end_time =
        module_store.cycle_start_time + module_store.cycle_interval;

    // initiate weight vote
    <a href="_add">table::add</a>(
        &<b>mut</b> module_store.proposals,
        <a href="_encode_u64">table_key::encode_u64</a>(module_store.current_cycle),
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_Proposal">Proposal</a> {
            votes: <a href="_new">table::new</a>(),
            total_tally: 0,
            tallies: <a href="_new">table::new</a>(),
            voting_end_time,
            executed: <b>false</b>
        }
    );
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_execute_proposal"></a>

## Function `execute_proposal`



<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_execute_proposal">execute_proposal</a>()
</code></pre>



##### Implementation


<pre><code><b>public</b> entry <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_execute_proposal">execute_proposal</a>() <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global_mut</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> (_, time) = get_block_info();

    // get the last voting proposal
    // check vote state
    <b>let</b> proposal =
        <a href="_borrow_mut">table::borrow_mut</a>(
            &<b>mut</b> module_store.proposals,
            <a href="_encode_u64">table_key::encode_u64</a>(module_store.current_cycle)
        );

    <b>if</b> (proposal.voting_end_time &gt;= time) { <b>return</b> };

    <b>if</b> (proposal.executed) { <b>return</b> };

    <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_execute_proposal_internal">execute_proposal_internal</a>(proposal, module_store.current_cycle);
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_total_tally"></a>

## Function `get_total_tally`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_total_tally">get_total_tally</a>(cycle: u64): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_total_tally">get_total_tally</a>(cycle: u64): u64 <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> cycle_key = <a href="_encode_u64">table_key::encode_u64</a>(cycle);
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(&module_store.proposals, cycle_key),
        <a href="_not_found">error::not_found</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ECYCLE_NOT_FOUND">ECYCLE_NOT_FOUND</a>)
    );
    <b>let</b> proposal = <a href="_borrow">table::borrow</a>(&module_store.proposals, cycle_key);
    proposal.total_tally
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_tally_infos"></a>

## Function `get_tally_infos`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_tally_infos">get_tally_infos</a>(cycle: u64): <a href="">vector</a>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_TallyResponse">weight_vote::TallyResponse</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_tally_infos">get_tally_infos</a>(cycle: u64): <a href="">vector</a>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_TallyResponse">TallyResponse</a>&gt; <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> cycle_key = <a href="_encode_u64">table_key::encode_u64</a>(cycle);
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(&module_store.proposals, cycle_key),
        <a href="_not_found">error::not_found</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ECYCLE_NOT_FOUND">ECYCLE_NOT_FOUND</a>)
    );
    <b>let</b> proposal = <a href="_borrow">table::borrow</a>(&module_store.proposals, cycle_key);

    <b>let</b> tally_responses: <a href="">vector</a>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_TallyResponse">TallyResponse</a>&gt; = <a href="">vector</a>[];

    <b>let</b> (bridge_ids, _) = <a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip_get_whitelisted_bridge_ids">vip::get_whitelisted_bridge_ids</a>();

    <a href="_for_each">vector::for_each</a>(
        bridge_ids,
        |bridge_id| {
            <b>let</b> tally =
                <a href="_borrow_with_default">table::borrow_with_default</a>(
                    &proposal.tallies,
                    <a href="_encode_u64">table_key::encode_u64</a>(bridge_id),
                    &0
                );
            <a href="_push_back">vector::push_back</a>(
                &<b>mut</b> tally_responses,
                <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_TallyResponse">TallyResponse</a> { bridge_id, tally: *tally }
            )
        }
    );

    <b>return</b> tally_responses
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_proposal"></a>

## Function `get_proposal`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_proposal">get_proposal</a>(cycle: u64): <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ProposalResponse">weight_vote::ProposalResponse</a>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_proposal">get_proposal</a>(cycle: u64): <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ProposalResponse">ProposalResponse</a> <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> cycle_key = <a href="_encode_u64">table_key::encode_u64</a>(cycle);
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(&module_store.proposals, cycle_key),
        <a href="_not_found">error::not_found</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ECYCLE_NOT_FOUND">ECYCLE_NOT_FOUND</a>)
    );
    <b>let</b> proposal = <a href="_borrow">table::borrow</a>(&module_store.proposals, cycle_key);

    <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ProposalResponse">ProposalResponse</a> {
        total_tally: proposal.total_tally,
        voting_end_time: proposal.voting_end_time,
        executed: proposal.executed
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_voting_power"></a>

## Function `get_voting_power`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_voting_power">get_voting_power</a>(addr: <b>address</b>): u64
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_voting_power">get_voting_power</a>(addr: <b>address</b>): u64 <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> cosmos_voting_power =
        <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_customized_voting_power">utils::get_customized_voting_power</a>(
            addr,
            |metadata, voting_power| {
                <b>let</b> weight =
                    <a href="_borrow_with_default">table::borrow_with_default</a>(
                        &module_store.pair_multipliers,
                        metadata,
                        &<a href="_one">bigdecimal::one</a>()
                    );
                <a href="_mul_by_u64_truncate">bigdecimal::mul_by_u64_truncate</a>(*weight, voting_power)
            }
        );

    <b>let</b> weight_map = <a href="utils.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_utils_get_weight_map">utils::get_weight_map</a>();
    <b>let</b> lock_staking_voting_power =
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_lock_staking_voting_power">get_lock_staking_voting_power</a>(module_store, &weight_map, addr);

    <b>let</b> vesting_voting_power =
        <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_vesting_voting_power">get_vesting_voting_power</a>(module_store.core_vesting_creator, addr);
    // mul weight
    <b>let</b> init_weight = <a href="_borrow">simple_map::borrow</a>(&weight_map, &<a href="_utf8">string::utf8</a>(b"uinit"));
    vesting_voting_power = <a href="_mul_by_u64_truncate">bigdecimal::mul_by_u64_truncate</a>(
        *init_weight, vesting_voting_power
    );

    cosmos_voting_power + lock_staking_voting_power + vesting_voting_power
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_weight_vote"></a>

## Function `get_weight_vote`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_weight_vote">get_weight_vote</a>(cycle: u64, user: <b>address</b>): <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVoteResponse">weight_vote::WeightVoteResponse</a>
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_weight_vote">get_weight_vote</a>(cycle: u64, user: <b>address</b>): <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVoteResponse">WeightVoteResponse</a> <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <b>let</b> cycle_key = <a href="_encode_u64">table_key::encode_u64</a>(cycle);
    <b>assert</b>!(
        <a href="_contains">table::contains</a>(&module_store.proposals, cycle_key),
        <a href="_not_found">error::not_found</a>(<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ECYCLE_NOT_FOUND">ECYCLE_NOT_FOUND</a>)
    );
    <b>let</b> proposal = <a href="_borrow">table::borrow</a>(&module_store.proposals, cycle_key);

    <b>if</b> (!<a href="_contains">table::contains</a>(&proposal.votes, user)) {
        <b>return</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVoteResponse">WeightVoteResponse</a> {
            max_voting_power: 0,
            voting_power: 0,
            weights: <a href="">vector</a>[]
        }
    };

    <b>let</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVote">WeightVote</a> { max_voting_power, voting_power, weights } =
        <a href="_borrow">table::borrow</a>(&proposal.votes, user);

    <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_WeightVoteResponse">WeightVoteResponse</a> {
        max_voting_power: *max_voting_power,
        voting_power: *voting_power,
        weights: *weights
    }
}
</code></pre>



<a id="0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_pair_multipliers"></a>

## Function `get_pair_multipliers`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_pair_multipliers">get_pair_multipliers</a>(metadata: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="_Metadata">fungible_asset::Metadata</a>&gt;&gt;): <a href="">vector</a>&lt;<a href="_BigDecimal">bigdecimal::BigDecimal</a>&gt;
</code></pre>



##### Implementation


<pre><code><b>public</b> <b>fun</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_get_pair_multipliers">get_pair_multipliers</a>(
    metadata: <a href="">vector</a>&lt;Object&lt;Metadata&gt;&gt;
): <a href="">vector</a>&lt;BigDecimal&gt; <b>acquires</b> <a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a> {
    <b>let</b> module_store = <b>borrow_global</b>&lt;<a href="weight_vote.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_weight_vote_ModuleStore">ModuleStore</a>&gt;(@<a href="vip.md#0x3a886b32a802582f2e446e74d4a24d1d7ed01adf46d2a8f65c5723887e708789_vip">vip</a>);
    <a href="_map_ref">vector::map_ref</a>(
        &metadata,
        |metadata| {
            *<a href="_borrow_with_default">table::borrow_with_default</a>(
                &module_store.pair_multipliers,
                *metadata,
                &<a href="_one">bigdecimal::one</a>()
            )
        }
    )
}
</code></pre>
