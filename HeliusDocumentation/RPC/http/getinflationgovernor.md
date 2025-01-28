# getInflationGovernor

#### Returns the current ination governor

## getInflationGovernor

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
Example: "getInflationGovernor"
```
```
getInflationGovernor
```
#### Response^200

```
Successfully retrieved ination governor information.
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


Ination governor information.

#### initial number (float)

```
The initial ination percentage from time 0.
Example: 0.15
```
#### terminal number (float)

```
The terminal ination percentage.
Example: 0.015
```
#### taper number (float)

```
The rate per year at which ination is lowered.
Example: 0.15
```
#### foundation number (float)

```
The percentage of total ination allocated to the foundation.
Example: 0.05
```
#### foundationTerm number (float)

```
The duration of foundation pool ination in years.
Example: 7
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
"method": "getInflationGovernor"
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",
"result": {
"initial": 0.15,
"terminal": 0.015,
"taper": 0.15,
"foundation": 0.05,
"foundationTerm": 7
}