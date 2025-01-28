# getGenesisHash

#### Returns the genesis hash

## getGenesisHash

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
Example: "getGenesisHash"
```
```
getGenesisHash
```
#### Response^200

```
Successfully retrieved the genesis hash.
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
Identi er matching the request.
Example: "1"
```
#### result string


A hash as a base-58 encoded string.

Example: "GH7ome3EiwEr7tu9JuTh2dpYWBJK3z69Xm1ZE3MEE6JC"

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
"method": "getGenesisHash"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": "GH7ome3EiwEr7tu9JuTh2dpYWBJK3z69Xm1ZE3MEE6JC"
}
```