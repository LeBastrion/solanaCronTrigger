# getSlotLeader

#### Returns the current slot leader

## getSlotLeader

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
Example: "getSlotLeader"
```
```
getSlotLeader
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
#### minContextSlot integer

```
The minimum slot that the request can be evaluated at.
Example: 1000
```
#### Response^200

```
Successfully retrieved the slot leader.
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

#### result string

Node identity Pubkey as a base-58 encoded string.

Example: "ENvAW7JScgYq6o4zKZwewtkzzJgDzuJAFxYasvmEQdpS"

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
"method": "getSlotLeader",
"params": [
{
"commitment": "finalized"
}
]
}),
});
const data = await response.json();
```

##### {