# getBlock

#### Returns identity and transaction information about a conrmed block in the ledger

## getBlock

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
#### Body application/json

#### jsonrpc* enum

```
The JSON-RPC protocol version.
```
```
2.
```
#### id* string

```
A unique identi er for the request.
Example: "1"
```
#### method* enum

```
The name of the RPC method to invoke.
```
```
getBlock
```
#### params* array of one of

```
Parameters for the request.
```
#### items one of integer

#### integer

```
Slot number as a `u64` integer.
Example: 430
```
#### Response^200

```
Successfully retrieved block details.
```
#### Body application/json

#### jsonrpc enum

```
2.
```

#### id string

#### result object

#### blockhash string

```
The blockhash of this block (base-58 encoded string).
Example: "3Eq21vXNB5s86c62bVuUfTeaMif1N2kUqRPBmGRJhyTA"
```
#### previousBlockhash string

```
The blockhash of the block's parent.
Example: "mfcyqEXB3DnHXki6KjjmZck6YjmZLvpAByy2fj4nh6B"
```
#### parentSlot integer

```
The slot index of this block's parent.
Example: 429
```
#### transactions array of object

```
Array of transaction details if `full` transaction details are requested.
```
#### transaction object

```
Transaction details in the requested encoding format.
```
#### meta object

```
Metadata associated with the transaction.
```
#### fee integer

```
Fee charged for the transaction.
Example: 5000
```
#### preBalances array of integer

```
Array of account balances before the transaction.
```
#### items integer

#### postBalances array of integer

```
Array of account balances after the transaction.
```
#### items integer

#### rewards nullable array of object


```
Rewards for the transaction, if requested.
```
#### pubkey string

```
The public key of the account that received the reward.
```
#### lamports integer

```
Number of reward lamports credited or debited.
```
#### rewardType nullable string

```
Type of reward (e.g., "fee", "rent").
```
#### blockTime nullable integer

```
Estimated production time as Unix timestamp.
```
#### blockHeight nullable integer

```
Number of blocks beneath this block.
Example: 428
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
"id": "1",
"method": "getBlock",
"params": [
430
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "text",
"result": {
"blockhash": "3Eq21vXNB5s86c62bVuUfTeaMif1N2kUqRPBmGRJhyTA",
"previousBlockhash": "mfcyqEXB3DnHXki6KjjmZck6YjmZLvpAByy2fj4nh6B",
"parentSlot": 429 ,
"transactions": [
{
"meta": {
"fee": 5000 ,
"preBalances": [
0
],
"postBalances": [
0
],
"rewards": [
{
"pubkey": "text",
"lamports": 0 ,
"rewardType": "text"
}
]
}
}
],
"blockTime": null,