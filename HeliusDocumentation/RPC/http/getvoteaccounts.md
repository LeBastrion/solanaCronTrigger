# getVoteAccounts

#### Returns the account info and associated stake for all the voting accounts in the current

#### bank.

## getVoteAccounts

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
#### Body application/json

#### jsonrpc enum

```
The JSON-RPC protocol version.
Example: "2.0"
```
```
2.0
```
#### id string

```
A unique identi er for the request.
Example: "1"
```
#### method enum

```
The name of the RPC method to invoke.
Example: "getVoteAccounts"
```
```
getVoteAccounts
```
#### params array of object

```
Optional conguration object for ltering vote accounts.
```
#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```
```
confirmed finalized processed
```
#### votePubkey string

```
Validator vote address (base-58 encoded).
Example: "3ZT31jkAGhUaw8jsy4bTknwBMP8i4Eueh52By4zXcsVw"
```
#### keepUnstakedDelinquents boolean

```
Whether to include delinquent validators with no stake.
```

```
Example: true
```
#### delinquentSlotDistance integer

```
Slots behind the tip to consider a validator delinquent. Not recommended for ecosystem
consistency.
Example: 128
```
#### Response^200

Successfully retrieved vote accounts.

#### Body application/json

#### jsonrpc enum

The JSON-RPC protocol version.

Example: "2.0"

```
2.0
```
#### id string

Identi er matching the request.

Example: "1"

#### result object

List of current and delinquent vote accounts.

#### current array of object

```
List of current vote accounts.
```
#### votePubkey string

```
Vote account address.
Example: "3ZT31jkAGhUaw8jsy4bTknwBMP8i4Eueh52By4zXcsVw"
```
#### nodePubkey string

```
Validator identity.
Example: "B97CCUW3AEZFGy6uUg6zUdnNYvnVq5VG8PUtb2HayTDD"
```
#### activatedStake integer

```
Stake delegated to this vote account (lamports).
Example: 42
```
#### epochVoteAccount boolean


```
Whether the vote account is staked for this epoch.
Example: true
```
#### commission integer

```
Percentage (0-100) of rewards payout owed to the vote account.
Example: 0
```
#### lastVote integer

```
Most recent slot voted on by this vote account.
Example: 147
```
#### epochCredits array of array of integer

```
Latest history of earned credits for up to ve epochs.
```
#### items integer

#### rootSlot integer

```
Current root slot for this vote account.
Example: 42
```
#### delinquent array of object

List of delinquent vote accounts.

#### votePubkey string

```
Vote account address.
Example: "3ZT31jkAGhUaw8jsy4bTknwBMP8i4Eueh52By4zXcsVw"
```
#### nodePubkey string

```
Validator identity.
Example: "B97CCUW3AEZFGy6uUg6zUdnNYvnVq5VG8PUtb2HayTDD"
```
#### activatedStake integer

```
Stake delegated to this vote account (lamports).
Example: 0
```
#### epochVoteAccount boolean

```
Whether the vote account is staked for this epoch.
Example: false
```
#### commission integer


```
Percentage (0-100) of rewards payout owed to the vote account.
Example: 0
```
#### lastVote integer

```
Most recent slot voted on by this vote account.
Example: 147
```
#### epochCredits array of array of integer

```
Latest history of earned credits for up to ve epochs.
```
#### items integer

#### rootSlot integer

```
Current root slot for this vote account.
Example: 42
```
#### Request JavaScript

```
Test it
```
#### Response^200

```
const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": 1 ,
"method": "getVoteAccounts",
"params": [
{
"votePubkey": "3ZT31jkAGhUaw8jsy4bTknwBMP8i4Eueh52By4zXcsVw"
}
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",
"result": {
"current": [
{
"votePubkey": "3ZT31jkAGhUaw8jsy4bTknwBMP8i4Eueh52By4zXcsVw",
"nodePubkey": "B97CCUW3AEZFGy6uUg6zUdnNYvnVq5VG8PUtb2HayTDD",
"activatedStake": 42 ,
"epochVoteAccount": true,
"commission": 0 ,
"lastVote": 147 ,
"epochCredits": [
[
1 ,
64 ,
0
]
],
"rootSlot": 42
}
],
"delinquent": [
{
"votePubkey": "3ZT31jkAGhUaw8jsy4bTknwBMP8i4Eueh52By4zXcsVw",
"nodePubkey": "B97CCUW3AEZFGy6uUg6zUdnNYvnVq5VG8PUtb2HayTDD",
"activatedStake": 0 ,
"epochVoteAccount": false,
"commission": 0 ,
"lastVote": 147 ,
"epochCredits": [
[
1 ,
64 ,
0
]
],
"rootSlot": 42