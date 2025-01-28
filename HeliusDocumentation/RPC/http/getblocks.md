# getBlocks

#### Returns a list of conrmed blocks between two slots

## getBlocks

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
Example: "getBlocks"
```
```
getBlocks
```
#### params* array of one of

```
Request parameters for the method.
```
#### items one of integer

#### integer

```
Start slot (required).
Example: 5
```
#### Response^200

```
Successfully retrieved conrmed blocks.
```
#### Body application/json


#### jsonrpc enum

Example: "2.0"

```
2.0
```
#### id string

Identi er matching the request.

Example: "1"

#### result array of integer

List of conrmed blocks between start_slot and end_slot.

#### items integer

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
"method": "getBlocks",
"params": [
5
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1"