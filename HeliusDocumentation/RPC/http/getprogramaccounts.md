# getProgramAccounts

#### Returns all accounts owned by the provided program Pubkey

## getProgramAccounts

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
Example: "getProgramAccounts"
```
```
getProgramAccounts
```
#### params* array of one of

```
Parameters for the method.
```
#### items one of string

#### string

```
Pubkey of the program, as a base-58 encoded string.
Example: "4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T"
```
#### Response^200

```
Successfully retrieved program accounts.
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

#### result one of array of object

#### pubkey string

```
The account Pubkey as a base-58 encoded string.
Example: "CxELquR1gPP8wHe33gZ4QxqGB3sZ9RSwsJ2KshVewkFY"
```
#### account object

```
Details about the account.
```
#### lamports integer

```
Number of lamports assigned to this account.
Example: 15298080
```
#### owner string

```
Base-58 encoded Pubkey of the program this account is assigned to.
Example: "4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T"
```
#### data array of string

```
Account data as encoded binary or JSON format.
```
#### items string

#### executable boolean

```
Indicates if the account contains a program.
Example: false
```
#### rentEpoch integer

```
The epoch at which this account will next owe rent.
Example: 28
```
#### space integer


```
The data size of the account.
Example: 42
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
"method": "getProgramAccounts",
"params": [
"4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T"
]
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
"pubkey": "CxELquR1gPP8wHe33gZ4QxqGB3sZ9RSwsJ2KshVewkFY",
"account": {
"lamports": 15298080 ,
"owner": "4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T",
"data": [
"2R9jLfiAQ9bgdcw6h8s44439",
"base58"
],
"executable": false,
"rentEpoch": 28 ,
"space": 42
}
}
]
}
```