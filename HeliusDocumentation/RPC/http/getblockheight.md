# getBlockHeight

#### Returns the current block height of the node

## getBlockHeight

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
getBlockHeight
```
#### params* array of object

```
Parameters for the request.
```
#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```
```
processed confirmed finalized
```
#### minContextSlot integer

```
The minimum slot at which the request can be evaluated.
Example: 1
```
#### Response^200

```
Successfully retrieved current block height.
```
#### Body application/json


#### jsonrpc enum

```
2.
```
#### id string

#### result integer

Current block height as **`u64`**.

Example: 1233

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
"method": "getBlockHeight",
"params": [
{}
]
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "text",
"result": 1233
}
```