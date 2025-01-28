# getLargestAccounts

#### Returns the 20 largest accounts, by lamport balance (results may be cached up to two

#### hours)

## getLargestAccounts

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
Example: "getLargestAccounts"
```
```
getLargestAccounts
```
#### params array of object

```
Optional conguration object for ltering accounts.
```
#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```
```
confirmed finalized
```
#### lter enum

```
Filter results by account type.
Example: "circulating"
```
```
circulating nonCirculating
```

#### Response^200

Successfully retrieved the largest accounts.

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

List of the largest accounts and their balances.

#### context object

```
Context of the response.
```
#### slot integer

```
The slot at which the data was fetched.
Example: 54
```
#### value array of object

```
Array of account information.
```
#### lamports integer

```
Number of lamports in the account.
Example: 999974
```
#### address string

```
Base-58 encoded address of the account.
Example: "99P8ZgtJYe1buSK8JXkvpLh8xPsCFuLYhz9hQFNw93WJ"
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
"method": "getLargestAccounts"
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
"slot": 54
},
"value": [
{
"lamports": 999974 ,
"address": "99P8ZgtJYe1buSK8JXkvpLh8xPsCFuLYhz9hQFNw93WJ"
}
]
```