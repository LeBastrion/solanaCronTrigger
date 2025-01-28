# getBlocksWithLimit

#### Returns a list of conrmed blocks starting at the given slot

## getBlocksWithLimit

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
#### Body application/json

#### jsonrpc* enum

```
The JSON-RPC protocol version.
Example: "2.0"
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
Example: "getBlocksWithLimit"
```
```
getBlocksWithLimit
```
#### params* array of object

```
Request parameters for the method.
```
#### start_slot integer

```
Start slot (required).
Example: 5
```
#### limit integer

```
Limit (required, must be ≤ 500,000 blocks from start slot).
Example: 3
```
#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```

```
confirmed finalized
```
#### Response^200

Successfully retrieved conrmed blocks.

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

#### result array of integer

List of conrmed blocks starting at start_slot for up to the limit.

#### items integer

#### Request JavaScript

```
Test it
```
```
const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": "1",
"method": "getBlocksWithLimit",
"params": [
{}
]
}),
});
const data = await response.json();
```

#### Response^200

##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": [
5 ,
6 ,
7
```