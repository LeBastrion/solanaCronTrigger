# Get Token Accounts

##### Get information about all token accounts for a specic mint or a specic owner.

##### Retrieve all the token accounts associated with a specic mint or owner account. This is an

##### efcient way to get all the owners of an SPL token or all tokens owned by a particular

##### address. You can use the showZeroBalanceag to include empty token accounts.

## getTokenAccounts

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
##### Body application/json

##### jsonrpc* enum

```
The version of the JSON-RPC protocol.
```
```
2.0
```
##### id* string

```
An ID to identify the request.
```
##### method* enum

```
The name of the method to invoke.
```
```
getTokenAccounts
```
##### params* object

##### mint string

```
The mint address key.
Example: "string"
```
##### owner string

```
The owner address key.
Example: "string"
```
##### page integer

## Overview


```
The page of results to return.
Example: 1
```
##### limit integer

```
The maximum number of assets to return.
Example: 100
```
##### cursor string

```
The cursor used for pagination.
```
##### before string

```
Returns results before the specied cursor.
```
##### after string

```
Returns results after the specied cursor.
```
##### options object

##### showZeroBalance boolean

```
If true, show accounts with empty token balances.
```
##### Response^200

Successful response

##### Body application/json

##### total integer

The number of results found for the request.

Example: 2

##### limit integer

The maximum number of results requested.

Example: 100

##### cursor string

The cursor used for pagination.

##### token_accounts array of object

An array of token accounts.


##### address string

```
The address of the token account.
```
##### mint string

```
The address of the mint account.
```
##### owner string

```
The address of the token account owner.
```
##### amount integer

```
Number of tokens in the account.
```
##### delegated_amount integer

```
Number of delegated tokens in the account.
```
##### frozen boolean

```
If the account is frozen.
```
##### Request JavaScript

```
Test it
```
##### Response^200

```
const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": "text",
"method": "getTokenAccounts",
"params": {}
}),
});
const data = await response.json();
```

###### {

```
"total": 2 ,
"limit": 100 ,
"cursor": "text",
"token_accounts": [
{
"address": "text",
"mint": "text",
```
##### How to get all the token accounts for a specic owner

## Code Examples


##### Response:

```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const getTokenAccounts = async () => {
const fetch = (await import("node-fetch")).default;
const response = await fetch(url, {
method: "POST",
headers: {
"Content-Type": "application/json",
},
body: JSON.stringify({
jsonrpc: "2.0",
method: "getTokenAccounts",
id: "helius-test",
params: {
page: 1 ,
limit: 100 ,
"displayOptions": {
"showZeroBalance": false,
},
owner: "CckxW6C1CjsxYcXSiDbk7NYfPLhfqAm3kSB5LEZunnSE",
},
}),
});
const data = await response.json();
```
```
if (!data.result) {
console.error("No result in the response", data);
return;
}
```
```
console.log(JSON.stringify(data.result, null, 2 ));
};
```
```
getTokenAccounts();
```

##### This example makes use of cursor-based pagination to get all the holders of

##### $BONK. In this example, only unique owner addresses are saved to a le:

###### {

```
"total": 2,
"limit": 100,
"page": 1,
"token_accounts": [
{
"address": "CVMR1nbxTcQ7Jpa1p137t5TyKFii3Y7Vazt9fFct3tk9"
"mint": "SHDWyBxihqiCj6YekG2GUr7wqKLeLAMK1gHZck9pL6y",
"owner": "CckxW6C1CjsxYcXSiDbk7NYfPLhfqAm3kSB5LEZunnSE",
"amount": 100000000,
"delegated_amount": 0,
"frozen": false
},
{
"address": "8U1RBVQsynGgtikLpDaRKZSEvWAx1BB9otCoFbE8rV59"
"mint": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
"owner": "CckxW6C1CjsxYcXSiDbk7NYfPLhfqAm3kSB5LEZunnSE",
"amount": 19990000,
"delegated_amount": 0,
"frozen": false
}
]
}
```
##### How to get all the holders of an SPL token


import { writeFileSync } from "fs";
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const getTokenAccounts = async () => {
let allOwners = new Set();
let cursor;

while (true) {
let params = {
limit: 1000 ,
mint: "DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263"
};

if (cursor != undefined) {
params.cursor = cursor;
}

const response = await fetch(url, {
method: "POST",
headers: {
"Content-Type": "application/json",
},
body: JSON.stringify({
jsonrpc: "2.0",
id: "helius-test",
method: "getTokenAccounts",
params: params,
}),
});

const data = await response.json();

if (!data.result || data.result.token_accounts.length ==
console.log("No more results");
break;
}

data.result.token_accounts.forEach((account) => {
allOwners.add(account.owner);
});

cursor = data.result.cursor;
}

writeFileSync("output.json", JSON.stringify(Array.from(allOw
}

getTokenAccounts();


##### Response

```
getTokenAccounts();
```
###### [

```
"111An9SVxuPpgjnuXW9Ub7hcVmZpYNrYZF4edsGwJEW",
"11Mmng3DoMsq2Roq8LBcqdz6d4kw9oSD8oka9Pwfbj",
"112uNfcC8iwX9P2TkRdJKyPatg6a4GNcr9NC5mTc2z3",
"113uswn5HNgEfBUKfK4gVBmd2GpZYbxd1N6h1uUWReg",
"11CyvpdYTqFmCVWbJJeKFNX8F8RSjNSYW5VVUi8eX4P",
"11MANeaiHEy9S9pRQNu3nqKa2gpajzX2wrRJqWrf8dQ",
"11MDcdk32JB8bJzpcCrGijaUbJEUpAgpikVfLrpgru1",
"11MiBon8Vi6gfvwBz1tCFno52W4QZj4qgktLy5ZNQTz",
"11MwoPvG25NZQcZaGBkmphb4B5bvPjKBE4zXNaZtZau",
"11TaqNq9a7PBkYbGLfzpgC5VAr6XRtGBGC5T2AvUVus",
...
"FEwuzsatWmqzxa6AtEWoMsKo2K7vRdHaG8UsuuAzooGn",
"FEwxV2LT13ifNMs1KdpE87AzBNpK6SGDsACdvqs5utYb"
]
```