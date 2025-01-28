# getIdentity

#### Returns the identity pubkey for the current node

## getIdentity

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
Example: "getIdentity"
```
```
getIdentity
```
#### Response^200

```
Successfully retrieved the identity of the node.
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
#### result object


Identity of the node.

#### identity string

```
The identity pubkey of the current node (as a base-58 encoded string).
Example: "2r1F4iWqVcb8M1DbAjQuFpebkQHY9hcVU4WuW2DJBppN"
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
"method": "getIdentity"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": {
"identity": "2r1F4iWqVcb8M1DbAjQuFpebkQHY9hcVU4WuW2DJBppN"
}
}
```