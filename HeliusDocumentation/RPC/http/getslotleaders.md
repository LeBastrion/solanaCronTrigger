# getSlotLeaders

#### Returns the slot leaders for a given slot range

## getSlotLeaders

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
Example: "getSlotLeaders"
```
```
getSlotLeaders
```
#### params array of one of

```
Parameters for specifying the start slot and limit.
```
#### items one of integer

#### integer

```
Start slot as a `u64` integer.
Example: 100
```
#### Response^200

```
Successfully retrieved slot leaders.
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

#### result array of string

Array of Node identity public keys as base-58 encoded strings.

#### items string

```
Node identity Pubkey.
Example: "ChorusmmK7i1AxXeiTtQgQZhQNiXYU84ULeaYF1EH15n"
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
"method": "getSlotLeaders",
"params": [
100 ,
10
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",