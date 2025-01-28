# getSignatureStatuses

#### Returns the statuses of a list of signatures. Each signature must be a txid, the rst signature

#### of a transaction.

## getSignatureStatuses

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
Example: "getSignatureStatuses"
```
```
getSignatureStatuses
```
#### params array of one of

```
Array containing transaction signatures and optional conguration object.
```
#### items one of array of string

#### items string

```
Example:
"5VERv8NMvzbJMEkV8xnrLkEaWRtSz9CosKDYjCJjBRnbJLgp8uirBgmQpjKhoR4tjF3ZpRzrFmBV
6UjKdiSZkQUW"
```
#### Response^200

```
Successfully retrieved signature statuses.
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

Contains the context and signature status values.

#### context object

#### slot integer

```
Slot in which the data was fetched.
Example: 82
```
#### value array of one of

```
List of transaction signature statuses.
```
#### items one of null

#### null

```
Null if the transaction is unknown.
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
"method": "getSignatureStatuses",
"params": [
[
"5VERv8NMvzbJMEkV8xnrLkEaWRtSz9CosKDYjCJjBRnbJLgp8uirBgmQpjKhoR
],
{
"searchTransactionHistory": true
}
]
}),
});
const data = await response.json();
```