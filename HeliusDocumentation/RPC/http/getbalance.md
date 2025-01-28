# getBalance

#### Returns the lamport balance of the account of provided Pubkey

## getBalance

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
getBalance
```
#### params* array of one of

```
Parameters for the request.
```
#### items one of string

#### string

```
The Pubkey of the account to query (base-58 encoded string).
Example: "83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri"
```
#### Response^200

```
Successfully retrieved account balance.
```
#### Body application/json

#### jsonrpc enum

```
2.
```

#### id string

#### result object

#### context object

#### slot integer

```
The slot of the returned information.
Example: 1
```
#### value integer

```
The account balance in lamports.
Example: 0
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
"method": "getBalance",
"params": [
"83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri"
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "text",