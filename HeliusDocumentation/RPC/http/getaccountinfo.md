# getAccountInfo

#### Returns all information associated with the account of provided Pubkey

## getAccountInfo

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
2.
```
#### id integer

```
A unique identi er for the request.
Example: 1
```
#### method enum

```
The name of the RPC method to invoke.
Example: "getAccountInfo"
```
```
getAccountInfo
```
#### params array of one of

#### items one of string

#### string

```
Pubkey of account to query, as a base-58 encoded string.
Example: "vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg"
```
#### Response^200

```
Successfully retrieved account information.
```
#### Body application/json

#### jsonrpc string


The JSON-RPC protocol version.

Example: "2.0"

#### result object

#### context object

```
Context of the request.
```
#### apiVersion string

```
API version of the request.
Example: "2.0.15"
```
#### slot integer

```
Slot number of the response.
Example: 341197053
```
#### value one of any

#### any

```
If the requested account does not exist.
```
#### Request JavaScript

```
const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": 1 ,
"method": "getAccountInfo",
"params": [
"vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg",
{
"encoding": "base58"
}
]
}),
});
const data = await response.json();
```

```
Test it
```
#### Response^200

##### {

```
"jsonrpc": "2.0",
"result": {
"context": {
"apiVersion": "2.0.15",
"slot": 341197053
}
}
```