# getRecentPrioritizationFees

#### Returns a list of prioritization fees from recent blocks.

## getRecentPrioritizationFees

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
Example: "getRecentPrioritizationFees"
```
```
getRecentPrioritizationFees
```
#### params array of array of string

```
Optional array of account addresses.
```
#### items string

```
A base-58 encoded account address.
Example: "CxELquR1gPP8wHe33gZ4QxqGB3sZ9RSwsJ2KshVewkFY"
```
#### Response^200

```
Successfully retrieved recent prioritization fees.
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

Identi er matching the request.

Example: "1"

#### result array of object

List of recent prioritization fees.

#### slot integer

```
Slot in which the fee was observed.
Example: 348125
```
#### prioritizationFee integer

```
The per-compute-unit fee paid in micro-lamports.
Example: 1234
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
"method": "getRecentPrioritizationFees"
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",