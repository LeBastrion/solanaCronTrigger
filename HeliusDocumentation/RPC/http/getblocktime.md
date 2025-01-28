# getBlockTime

#### Returns the estimated production time of a block.

## getBlockTime

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
#### Body application/json

#### jsonrpc* enum

```
The JSON-RPC protocol version.
```
```
2.0
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
getBlockTime
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
Successfully retrieved block time.
```
#### Body application/json

#### jsonrpc enum

```
2.0
```
#### id string


#### result integer

Estimated production time as Unix timestamp (seconds since Unix epoch).

Example: 1574721591

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
"method": "getBlockTime",
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
"result": 1574721591
}
```