# getRecentPerformanceSamples

#### Returns a list of recent performance samples, in reverse slot order. Performance samples

#### are taken every 60 seconds and include the number of transactions and slots that occur in a

#### given time window.

## getRecentPerformanceSamples

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
Example: "getRecentPerformanceSamples"
```
```
getRecentPerformanceSamples
```
#### params array of integer

```
Optional parameter to limit the number of samples to return.
```
#### items integer

```
Number of samples to return (maximum 720).
Example: 4
```
#### Response^200

```
Successfully retrieved performance samples.
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

#### result array of object

List of performance samples.

#### slot integer

```
Slot in which the sample was taken.
Example: 348125
```
#### numTransactions integer

```
Number of transactions processed during the sample period.
Example: 126
```
#### numNonVoteTransactions integer

```
Number of non-vote transactions processed during the sample period.
Example: 1
```
#### samplePeriodSecs integer (int16)

```
Number of seconds in a sample window.
Example: 60
```
#### numSlots integer

```
Number of slots completed during the sample period.
Example: 126
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
"method": "getRecentPerformanceSamples"
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
```