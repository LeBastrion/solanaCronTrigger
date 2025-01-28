# getBlockCommitment

#### Returns commitment for particular block

## getBlockCommitment

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
getBlockCommitment
```
#### params* array of integer

```
Parameters for the request.
```
#### items integer

```
Block number identi ed by Slot (as `u64` integer).
Example: 5
```
#### Response^200

```
Successfully retrieved block commitment.
```
#### Body application/json

#### jsonrpc enum

```
2.
```
#### id string


#### result object

#### commitment one of any

#### any

```
Returns `null` if the block is unknown.
```
#### totalStake integer

```
Total active stake, in lamports, of the current epoch.
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
"id": "1",
"method": "getBlockCommitment",
"params": [
5
]
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "text",
"result": {
"totalStake": 42
}
}
```