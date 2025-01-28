# getMinimumBalanceForRentExemption

#### Returns minimum balance required to make account rent exempt.

## getMinimumBalanceForRentExemption

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
Example: "getMinimumBalanceForRentExemption"
```
```
getMinimumBalanceForRentExemption
```
#### params array of one of

```
Parameters for the method.
```
#### items one of integer

#### integer

```
The account's data length (optional).
Example: 50
```
#### Response^200

```
Successfully retrieved the minimum balance for rent exemption.
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

#### result integer

Minimum lamports required in the account to remain rent-free.

Example: 500

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
"method": "getMinimumBalanceForRentExemption"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": 500
```