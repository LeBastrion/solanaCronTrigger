# getVersion

#### Returns the current Solana version running on the node

## getVersion

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
Example: "getVersion"
```
```
getVersion
```
#### params array

```
No parameters required.
```
#### Response^200

```
Successfully retrieved the Solana version details.
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
```

Example: "1"

#### result object

Solana version details.

#### solana-core string

```
The software version of solana-core.
Example: "1.16.7"
```
#### feature-set integer

```
Unique identi er of the current software's feature set.
Example: 2891131721
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
"method": "getVersion"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": {
"solana-core": "1.16.7",
"feature-set": 2891131721
}
}
```