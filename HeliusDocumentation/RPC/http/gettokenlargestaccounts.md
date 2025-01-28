# getTokenLargestAccounts

#### Returns the 20 largest accounts of a particular SPL Token type.

## getTokenLargestAccounts

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
Example: "getTokenLargestAccounts"
```
```
getTokenLargestAccounts
```
#### params array of one of

```
Parameters for querying the largest token accounts for a specic mint.
```
#### items one of string

#### string

```
Pubkey of the token Mint to query, as a base-58 encoded string.
Example: "3wyAj7Rt1TWVPZVteFJPLa26JmLvdb1CAKEFZm3NY75E"
```
#### Response^200

```
Successfully retrieved the largest token accounts.
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

Context and token account details.

#### context object

```
Context of the response.
```
#### slot integer

```
Slot in which the data was fetched.
Example: 1114
```
#### value array of object

```
List of token accounts with their balances.
```
#### address string

```
The address of the token account.
Example: "FYjHNoFtSQ5uijKrZFyYAxvEr87hsKXkXcxkcmkBAf4r"
```
#### amount string

```
The raw token account balance without decimals.
Example: "771"
```
#### decimals integer

```
Number of base 10 digits to the right of the decimal place.
Example: 2
```
#### uiAmount nullable number

```
The token account balance using mint-prescribed decimals (deprecated).
Example: 7.71
```
#### uiAmountString string

```
The token account balance as a string using mint-prescribed decimals.
```

```
Example: "7.71"
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
"method": "getTokenLargestAccounts",
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
"value": [
{
"address": "FYjHNoFtSQ5uijKrZFyYAxvEr87hsKXkXcxkcmkBAf4r",
"amount": "771",
"decimals": 2 ,
"uiAmount": 7.71,
"uiAmountString": "7.71"
}
]
}
```