# getSupply

#### Returns information about the current supply.

## getSupply

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
Example: "getSupply"
```
```
getSupply
```
#### params array of object

```
Optional conguration object.
```
#### commitment enum

```
The commitment level for the request.
Example: "finalized"
```
```
confirmed finalized processed
```
#### excludeNonCirculatingAccountsList boolean

```
Exclude non-circulating accounts list from the response.
Example: true
```
#### Response^200

```
Successfully retrieved the supply information.
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

Context and supply details.

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
Supply details.
```
#### total integer

```
Total supply in lamports.
Example: 1016000
```
#### circulating integer

```
Circulating supply in lamports.
Example: 16000
```
#### nonCirculating integer

```
Non-circulating supply in lamports.
Example: 1000000
```
#### nonCirculatingAccounts array of string

```
List of non-circulating account addresses as strings. Empty if
`excludeNonCirculatingAccountsList` is enabled.
```

#### items string

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
"method": "getSupply",
"params": [
{
"commitment": "finalized",
"excludeNonCirculatingAccountsList": true
}
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",