# getSignaturesForAddress

#### Returns signatures for conrmed transactions that include the given address in their

#### accountKeys list. Returns signatures backwards in time from the provided signature or

#### most recent conrmed block

## getSignaturesForAddress

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
Example: "getSignaturesForAddress"
```
```
getSignaturesForAddress
```
#### params* array of one of

```
Array containing the required account address and optional conguration object.
```
#### items one of string

#### string

```
Account address as a base-58 encoded string.
Example: "Vote111111111111111111111111111111111111111"
```
#### Response^200

```
Successfully retrieved signatures for the specied address.
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

#### result array of object

List of transaction signature information.

#### signature string

```
Transaction signature as a base-58 encoded string.
Example:
"5h6xBEauJ3PK6SWCZ1PGjBvj8vDdWG3KpwATGy1ARAXFSDwt8GFXM7W5Ncn16wmqokgpiKRLuS83KUx
yZyv2sUYv"
```
#### slot integer

```
The slot that contains the block with the transaction.
Example: 114
```
#### err nullable object

```
Error if the transaction failed, or null if successful.
```
#### memo nullable string

```
Memo associated with the transaction, or null if none.
```
#### blockTime nullable integer

```
Estimated production time as Unix timestamp (seconds since epoch), or null if not available.
```
#### conrmationStatus nullable enum

```
Transaction's cluster conrmation status.
Example: "finalized"
```
```
processed confirmed finalized
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
"method": "getSignaturesForAddress",
"params": [
"Vote111111111111111111111111111111111111111"
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
"signature": "5h6xBEauJ3PK6SWCZ1PGjBvj8vDdWG3KpwATGy1ARAXFSDwt8GFXM
"slot": 114 ,
"err": null,
"memo": null,
"blockTime": null,
"confirmationStatus": "finalized"
}
```