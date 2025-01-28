# isBlockhashValid

#### Returns whether a blockhash is still valid or not

## isBlockhashValid

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
Example: "45"
```
#### method enum

```
The name of the RPC method to invoke.
Example: "isBlockhashValid"
```
```
isBlockhashValid
```
#### params array of one of

```
Parameters for evaluating blockhash validity.
```
#### items one of string

#### string

```
The blockhash to evaluate, as a base-58 encoded string.
Example: "J7rBdM6AecPDEZp8aPq5iPSNKVkU5Q76F3oAV4eW5wsW"
```
#### Response^200

```
Successfully evaluated blockhash validity.
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

Example: "45"

#### result object

Blockhash validity result.

#### context object

```
Context of the response.
```
#### slot integer

```
Slot in which the data was fetched.
Example: 2483
```
#### value boolean

```
True if the blockhash is still valid.
Example: false
```
#### Request JavaScript


const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": 45 ,
"method": "isBlockhashValid",
"params": [
"J7rBdM6AecPDEZp8aPq5iPSNKVkU5Q76F3oAV4eW5wsW",
{
"commitment": "processed"
}
]
}),