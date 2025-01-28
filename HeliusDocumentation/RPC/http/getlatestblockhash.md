# getLatestBlockhash

#### Returns the latest blockhash

## getLatestBlockhash

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
Example: "getLatestBlockhash"
```
```
getLatestBlockhash
```
#### params array of object

```
Optional conguration object for the request.
```
#### commitment enum

```
The commitment level for the request.
Example: "processed"
```
```
confirmed finalized processed
```
#### minContextSlot integer

```
The minimum slot that the request can be evaluated at.
Example: 1000
```
#### Response^200

```
Successfully retrieved the latest blockhash information.
```

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

RpcResponse containing blockhash information.

#### context object

```
Context of the response.
```
#### slot integer

```
The slot at which the data was fetched.
Example: 2792
```
#### value object

```
Blockhash and its validity details.
```
#### blockhash string

```
A hash as a base-58 encoded string.
Example: "EkSnNWid2cvwEVnVx9aBqawnmiCNiDgp3gUdkDPTKN1N"
```
#### lastValidBlockHeight integer

```
The last block height at which the blockhash will be valid.
Example: 3090
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
"method": "getLatestBlockhash"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": {
"context": {
"slot": 2792
},
"value": {
```