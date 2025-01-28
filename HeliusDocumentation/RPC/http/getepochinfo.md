# getEpochInfo

#### Returns information about the current epoch

## getEpochInfo

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
Example: "getEpochInfo"
```
```
getEpochInfo
```
#### params array of object

```
Optional parameters for the request.
```
#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```
```
confirmed finalized
```
#### minContextSlot integer

```
The minimum slot that the request can be evaluated at.
Example: 1000
```
#### Response^200

```
Successfully retrieved epoch information.
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

#### absoluteSlot integer

```
The current slot.
Example: 166598
```
#### blockHeight integer

```
The current block height.
Example: 166500
```
#### epoch integer

```
The current epoch.
Example: 27
```
#### slotIndex integer

```
The current slot relative to the start of the current epoch.
Example: 2790
```
#### slotsInEpoch integer

```
The number of slots in this epoch.
Example: 8192
```
#### transactionCount nullable integer

```
Total number of transactions processed without error since genesis.
Example: 22661093
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
"method": "getEpochInfo",
"params": [
{
"commitment": "finalized",
"minContextSlot": 1000
}
]
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": {
"absoluteSlot": 166598 ,
"blockHeight": 166500 ,
"epoch": 27 ,
"slotIndex": 2790 ,
"slotsInEpoch": 8192 ,
"transactionCount": 22661093
}
```