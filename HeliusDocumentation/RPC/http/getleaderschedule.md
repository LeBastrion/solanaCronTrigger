# getLeaderSchedule

#### Returns the leader schedule for an epoch

## getLeaderSchedule

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
Example: "getLeaderSchedule"
```
```
getLeaderSchedule
```
#### params array of one of

```
Parameters for the method.
```
#### items one of integer

#### integer

```
Slot for the epoch whose leader schedule is fetched. If null, current epoch is used.
```
#### Response^200

```
Successfully retrieved the leader schedule.
```
#### Body application/json

#### jsonrpc enum

```
The JSON-RPC protocol version.
```

Example: "2.0"

```
2.0
```
#### id string

Identi er matching the request.

Example: "1"

#### result one of null

#### null

```
Null if the requested epoch is not found.
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
"method": "getLeaderSchedule"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1"
}
```