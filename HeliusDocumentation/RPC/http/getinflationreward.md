# getInflationReward

#### Returns the ination / staking reward for a list of addresses for an epoch

## getInflationReward

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
Example: "getInflationReward"
```
```
getInflationReward
```
#### params array of one of

```
Parameters for the method.
```
#### items one of array of string

#### items string

#### Response^200

```
Successfully retrieved ination reward information.
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

#### result array of one of

Array of reward information for each queried address.

#### items one of object

#### epoch integer

```
Epoch for which the reward occurred.
Example: 2
```
#### effectiveSlot integer

```
The slot in which the rewards are effective.
Example: 224
```
#### amount integer

```
Reward amount in lamports.
Example: 2500
```
#### postBalance integer

```
Post balance of the account in lamports.
Example: 499999442500
```
#### commission nullable integer

```
Vote account commission when the reward was credited.
Example: 5
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
"method": "getInflationReward"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": [
{
"epoch": 2
```