# simulateTransaction

#### Simulate sending a transaction

## simulateTransaction

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
Example: "simulateTransaction"
```
```
simulateTransaction
```
#### params array of one of

```
Parameters for simulating a transaction.
```
#### items one of string

#### string

```
The signed transaction, as an encoded string (base58 or base64).
Example:
"AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAABAAEDArczbMia1tLmq7zz4DinMNN0pJ1JtLdqIJPUw3YrGCzYAMHBsgN27lcgB6H2W
QvFgyZuJYHa46puOQo9yQ8CVQbd9uHXZaGT2cvhRs7reawctIXtX1s3kTqM9YV+/wCp20C7Wj2aiu
k5TReAXo+VTVg8QTHjs0UjNMMKCvpzZ+ABAgEBARU="
```

#### Response^200

Successfully simulated the transaction.

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

Result of the simulated transaction.

#### context object

```
Context of the simulation response.
```
#### slot integer

```
Slot in which the data was fetched.
Example: 218
```
#### value object

```
Details of the simulated transaction result.
```
#### err nullable object

```
Error if the transaction failed, null if successful.
```
#### logs nullable array of string

#### items string

```
Example: "Program 83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri invoke [1]"
```
#### accounts nullable array of object

#### returnData nullable object

#### programId string


```
Example: "83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri"
```
#### data array of string

#### items string

```
Example: "Kg=="
```
#### computeUnitsConsumed integer

```
Example: 2366
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
"method": "simulateTransaction",
"params": [
"AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
{
"encoding": "base64"
}
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",
"result": {
"context": {
"slot": 218
},
"value": {
"err": null,
"logs": [
"Program 83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri invoke [1]"
],
"accounts": [
{
"lamports": 5000 ,
"owner": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
}
],
" t D t " {