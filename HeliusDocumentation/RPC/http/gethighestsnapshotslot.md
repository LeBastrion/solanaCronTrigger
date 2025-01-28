# getHighestSnapshotSlot

#### Returns the highest slot information that the node has snapshots for. This will nd the

#### highest full snapshot slot, and the highest incremental snapshot slot based on the full

#### snapshot slot, if ther

## getHighestSnapshotSlot

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
Example: "getHighestSnapshotSlot"
```
```
getHighestSnapshotSlot
```
#### Response^200

```
The node has a snapshot.
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

#### result object

Snapshot slot information.

#### full integer

```
Highest full snapshot slot.
Example: 100
```
#### incremental nullable integer

```
Highest incremental snapshot slot based on full snapshot.
Example: 110
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
"method": "getHighestSnapshotSlot"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": {
"f ll"
```