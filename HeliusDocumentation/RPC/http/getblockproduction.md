# getBlockProduction

#### Returns recent block production information from the current or previous epoch.

## getBlockProduction

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
getBlockProduction
```
#### params* array of one of

```
Parameters for the request.
```
#### items one of object

#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```
```
processed confirmed finalized
```
#### identity string

```
Only return results for this validator identity (base-58 encoded).
Example: "85iYT5RuzRTDgjyRa3cP8SYhM2j21fj7NhfJ3peu1DPr"
```
#### range object

```
Slot range to return block production for.
```
#### rstSlot integer


```
First slot to return block production information for (inclusive).
Example: 0
```
#### lastSlot integer

```
Last slot to return block production information for (inclusive). If not provided, defaults
to the highest slot.
Example: 9887
```
#### Response^200

Successfully retrieved block production information.

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
The slot at the time of the response.
Example: 9887
```
#### value object

#### byIdentity object

```
Dictionary of validator identities with block production statistics.
```
#### Other properties array of integer

```
Two-element array with the number of leader slots and blocks produced.
```
#### items integer

#### range object


#### rstSlot integer

```
First slot of block production information (inclusive).
Example: 0
```
#### lastSlot integer

```
Last slot of block production information (inclusive).
Example: 9887
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
"method": "getBlockProduction",
"params": [
{}
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "text",
"result": {
"context": {
"slot": 9887
},