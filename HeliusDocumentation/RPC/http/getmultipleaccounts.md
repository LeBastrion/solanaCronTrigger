# getMultipleAccounts

#### Returns the account information for a list of Pubkeys.

## getMultipleAccounts

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
Example: "getMultipleAccounts"
```
```
getMultipleAccounts
```
#### params* array of one of

```
Parameters for the method.
```
#### items one of array of string

#### items string

#### Response^200

```
Successfully retrieved the account details.
```
#### Body application/json

#### jsonrpc enum

```
The JSON-RPC protocol version.
```

Example: "2.0"

```
2.0
```
#### id string

Identi er matching the request.

Example: "1"

#### result object

Accounts information with context.

#### context object

```
Context of the response.
```
#### apiVersion string

```
API version of the response.
Example: "2.0.15"
```
#### slot integer

```
The slot at which the data was fetched.
Example: 341197247
```
#### value array of one of

```
Array of account details.
```
#### items one of null

#### null

```
Null if the account doesn't exist.
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
"method": "getMultipleAccounts",
"params": [
[
"vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg",
"4fYNw3dojWmQ4dXtSGE9epjRGy9pFSx62YypT7avPYvA"
]
]
}),
});
const data = await response.json();
```
##### {