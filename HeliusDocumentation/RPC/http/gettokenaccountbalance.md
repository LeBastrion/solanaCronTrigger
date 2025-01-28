# getTokenAccountBalance

#### Returns the token balance of an SPL Token account.

## getTokenAccountBalance

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
Example: "getTokenAccountBalance"
```
```
getTokenAccountBalance
```
#### params array of one of

```
Parameters for querying the token account balance.
```
#### items one of string

#### string

```
Pubkey of the token account to query, as a base-58 encoded string.
Example: "7fUAJdStEuGbc3sM84cKRL6yYaaSstyLSU4ve5oovLS7"
```
#### Response^200

```
Successfully retrieved the token account balance.
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

Context and token account balance details.

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
Token account balance details.
```
#### amount string

```
The raw balance without decimals, as a string representation of u64.
Example: "9864"
```
#### decimals integer

```
Number of base 10 digits to the right of the decimal place.
Example: 2
```
#### uiAmount nullable number

```
The balance, using mint-prescribed decimals (deprecated).
Example: 98.64
```
#### uiAmountString string

```
The balance as a string, using mint-prescribed decimals.
Example: "98.64"
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
"method": "getTokenAccountBalance",
"params": [
"7fUAJdStEuGbc3sM84cKRL6yYaaSstyLSU4ve5oovLS7"
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
"amount": "9864",
"decimals": 2 ,
"uiAmount": 98.64,
"uiAmountString": "98.64"
}
```