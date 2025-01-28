# getInflationRate

#### Returns the specic ination values for the current epoch

## getInflationRate

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
Example: "getInflationRate"
```
```
getInflationRate
```
#### Response^200

```
Successfully retrieved ination rate information.
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


Ination rate details.

#### total number (float)

```
Total ination rate.
Example: 0.149
```
#### validator number (float)

```
Ination rate allocated to validators.
Example: 0.148
```
#### foundation number (float)

```
Ination rate allocated to the foundation.
Example: 0.001
```
#### epoch integer

```
Epoch for which these values are valid.
Example: 100
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
"method": "getInflationRate"
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",
"result": {