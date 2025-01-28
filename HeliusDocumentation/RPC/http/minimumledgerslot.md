# minimumLedgerSlot

#### Returns the lowest slot that the node has information about in its ledger.

## minimumLedgerSlot

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
Example: "minimumLedgerSlot"
```
```
minimumLedgerSlot
```
#### params array

```
No parameters are required for this method.
```
#### Response^200

```
Successfully retrieved the minimum ledger slot number.
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

#### result integer

Minimum ledger slot number.

Example: 1234

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
"method": "minimumLedgerSlot"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": 1234
}
```