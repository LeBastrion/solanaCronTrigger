# getEpochSchedule

#### Returns the epoch schedule information from this cluster's genesis cong

## getEpochSchedule

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
Example: "getEpochSchedule"
```
```
getEpochSchedule
```
#### Response^200

```
Successfully retrieved epoch schedule information.
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
Example: "1"
```
#### result object


Epoch schedule information.

#### slotsPerEpoch integer

```
The maximum number of slots in each epoch.
Example: 8192
```
#### leaderScheduleSlotOffset integer

```
The number of slots before the beginning of an epoch to calculate a leader schedule for that
epoch.
Example: 8192
```
#### warmup boolean

```
Whether epochs start short and grow.
Example: true
```
#### rstNormalEpoch integer

```
First normal-length epoch.
Example: 8
```
#### rstNormalSlot integer

```
First normal slot.
Example: 8160
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
"method": "getEpochSchedule"
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",
"result": {
"slotsPerEpoch": 8192 ,
"leaderScheduleSlotOffset": 8192 ,
"warmup": true,
"firstNormalEpoch": 8 ,
"firstNormalSlot": 8160
}
}