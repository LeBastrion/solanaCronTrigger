# getStakeMinimumDelegation

#### Returns the stake minimum delegation, in lamports.

## getStakeMinimumDelegation

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
Example: "getStakeMinimumDelegation"
```
```
getStakeMinimumDelegation
```
#### params array of object

```
Optional conguration object.
```
#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```
```
confirmed finalized processed
```
#### Response^200

```
Successfully retrieved the stake minimum delegation.
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

Context and minimum delegation value.

#### context object

```
Context of the response.
```
#### slot integer

```
Slot in which the data was fetched.
Example: 501
```
#### value integer

```
The stake minimum delegation in lamports.
Example: 1000000000
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
"method": "getStakeMinimumDelegation",
"params": [
{
"commitment": "finalized"
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
"id": "1",
"result": {
"context": {
"slot": 501
},
"value": 1000000000
}
```