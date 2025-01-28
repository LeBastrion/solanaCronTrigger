# blockSubscribe

#### Subscribe to receive notication anytime a new block is conrmed or nalized.

#### blockSubscribe is marked as unstable in the Solana documentation. As a result,

#### Helius does not support this method.

#### Description: Filter criteria for the logs to receive results based on account type.

#### String Options:

## • all: Include all transactions in the block.

#### Object Options:

#### A JSON object with the following eld:

## • mentionsAccountOrProgram (string):

#### Return only transactions that mention the provided public key (as a base-58 encoded

#### string).

#### If no mentions occur in a given block, no notication will be sent.

#### Description: Conguration object containing the following elds:

## • commitment (string, optional):

#### Default: finalized.

#### Note: processed is not supported.

## Parameters

## filter (string | object, required)

## object (optional)


- **encoding** (string, optional):

#### Default: json. Species the encoding format for each returned transaction.

#### Values:

## ◦ json

## ◦ jsonParsed

## ◦ base

## ◦ base

#### Details:

## ◦ jsonParsed attempts to use program-specic instruction parsers to return more^

#### human-readable and explicit data in the transaction.message.instructions

#### list.

## ◦ If jsonParsed is requested but a parser cannot be found, the instruction falls back^

#### to regular JSON encoding (accounts, data, and programIdIndex elds).

- **transactionDetails** (string, optional):

#### Default: full. Species the level of transaction detail to return.

#### Values:

## ◦ full

## ◦ accounts

## ◦ signatures

## ◦ none

#### Details:

## ◦ If accounts is requested, transaction details only include signatures and an^

#### annotated list of accounts in each transaction.

## ◦ Transaction metadata is limited to: fee, err, pre_balances, post_balances,

#### pre_token_balances, and post_token_balances.

- **maxSupportedTransactionVersion** (number, optional):

#### Species the maximum transaction version to return in responses.

#### Details:

## ◦ If the requested block contains a transaction with a higher version, an error will be^

#### returned.

## ◦ If omitted, only legacy transactions will be returned, and a block containing any^

#### versioned transaction will prompt an error.


- **showRewards** (bool, optional):

#### Whether to populate the rewards array. Default behavior includes rewards if this

#### parameter is not provided.

#### Returns an integer which serves as the subscription ID. This ID is required to

#### unsubscribe.

#### Request Example 1 (Subscribe to all transactions in a block):

#### Request Example 2 (Filter by account and include optional conguration):

##### {

```
"jsonrpc": "2.0",
"id": "1",
"method": "blockSubscribe",
"params": ["all"]
}
```
## Result

## Code Samples


#### Response Example:

#### The notication is an object with the following elds:

- **slot** (u64): The corresponding slot.
- **err** (object | null): Error if an issue occurs while publishing the notication;^

#### otherwise null.

- **block** (object | null): A block object as seen in the getBlock RPC HTTP^

#### method.

##### {

```
"jsonrpc": "2.0",
"id": "1",
"method": "blockSubscribe",
"params": [
{
"mentionsAccountOrProgram": "LieKvPRE8XeX3Y2xVNHjKlpAScD12lYySBVQ4H
},
{
"commitment": "confirmed",
"encoding": "base64",
"showRewards": true,
"transactionDetails": "full"
}
]
}
```
##### {

```
"jsonrpc": "2.0",
"result": 0 ,
"id": 1
}
```
## Notification Format

### Example Notification


##### {

"jsonrpc": "2.0",
"method": "blockNotification",
"params": {
"result": {
"context": {
"slot": 112301554
},
"value": {
"slot": 112301554 ,
"block": {
"previousBlockhash": "GJp125YAN4ufCSUvZJVdCyWQJ7RPWMmwxoyUQySyd
"blockhash": "6ojMHjctdqfB55JDpEpqfHnP96fiaHEcvzEQ2NNcxzHP",
"parentSlot": 112301553 ,
"transactions": [
{
"transaction": [
"OpltwoUvWxYi1P2U8vbIdE/aPntjYo5Aa0VQ2JJyeJE2g9Vvxk8dDGgF
"base64"
],
"meta": {
"err": null,
"status": {
"Ok": null
},
"fee": 5000
}
}
],
"blockTime": 1639926816 ,
"blockHeight": 101210751
},
"err": null
}
},
"subscription": 14
}
}