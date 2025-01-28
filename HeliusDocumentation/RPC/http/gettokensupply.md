# getTokenSupply

#### Returns the total supply of an SPL Token type.

## getTokenSupply

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
Example: "getTokenSupply"
```
```
getTokenSupply
```
#### params array of one of

```
Parameters for querying the token supply.
```
#### items one of string

#### string

```
Pubkey of the token Mint to query, as a base-58 encoded string.
Example: "3wyAj7Rt1TWVPZVteFJPLa26JmLvdb1CAKEFZm3NY75E"
```
#### Response^200

```
Successfully retrieved the token supply.
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

Context and token supply details.

#### context object

```
Context of the response.
```
#### slot integer

```
Slot in which the data was fetched.
Example: 1114
```
#### value object

```
Token supply details.
```
#### amount string

```
The raw total token supply without decimals, as a string representation of u64.
Example: "100000"
```
#### decimals integer

```
Number of base 10 digits to the right of the decimal place.
Example: 2
```
#### uiAmount nullable number

```
The total token supply, using mint-prescribed decimals (deprecated).
Example: 1000
```
#### uiAmountString string

```
The total token supply as a string, using mint-prescribed decimals.
Example: "1000"
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
"method": "getTokenSupply",
"params": [
"3wyAj7Rt1TWVPZVteFJPLa26JmLvdb1CAKEFZm3NY75E"
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
"context": {
"slot": 1114
},
"value": {
"amount": "100000",
"decimals": 2 ,
"uiAmount": 1000 ,
"uiAmountString": "1000"
}
```