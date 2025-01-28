# getTokenAccountsByOwner

#### Returns all SPL Token accounts by token owner.

## getTokenAccountsByOwner

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
Example: "getTokenAccountsByOwner"
```
```
getTokenAccountsByOwner
```
#### params array of one of

```
Parameters for querying token accounts owned by a specic public key.
```
#### items one of string

#### string

```
Pubkey of the account owner to query, as a base-58 encoded string.
Example: "A1TMhSGzQxMr1TboBKtgixKz1sS6REASMxPo1qsyTSJd"
```
#### Response^200

```
Successfully retrieved token accounts by owner.
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

Context and account details.

#### context object

```
Context of the response.
```
#### apiVersion string

```
API version.
Example: "2.0.15"
```
#### slot integer

```
Slot in which the data was fetched.
Example: 341197933
```
#### value array of object

```
List of token accounts.
```
#### pubkey string

```
Account Pubkey as a base-58 encoded string.
Example: "BGocb4GEpbTFm8UFV2VsDSaBXHELPfAXrvd4vtt8QWrA"
```
#### account object

```
Token account details.
```
#### lamports integer

```
Number of lamports assigned to the account.
Example: 2039280
```

#### owner string

Pubkey of the program this account has been assigned to.

Example: "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"

#### data object

Token state data associated with the account.

#### program string

```
Program name.
Example: "spl-token"
```
#### parsed object

```
Parsed token data.
```
#### info object

```
Token account information.
```
#### isNative boolean

```
Indicates if the account holds native SOL.
Example: false
```
#### mint string

```
Pubkey of the token mint.
Example: "2cHr7QS3xfuSV8wdxo3ztuF4xbiarF6Nrgx3qpx3HzXR"
```
#### owner string

```
Pubkey of the account owner.
Example: "A1TMhSGzQxMr1TboBKtgixKz1sS6REASMxPo1qsyTSJd"
```
#### state string

```
Token account state.
Example: "initialized"
```
#### tokenAmount object

```
Token amount details.
```
#### amount string

```
Raw balance without decimals.
Example: "420000000000000"
```
#### decimals integer


```
Number of decimals.
Example: 6
```
#### uiAmount number

```
Balance in user-friendly format.
Example: 420000000
```
#### uiAmountString string

```
Balance as a string.
Example: "420000000"
```
#### space integer

```
Space allocated for the account.
Example: 165
```
#### executable boolean

```
Indicates if the account contains a program.
Example: false
```
#### rentEpoch integer

```
Epoch at which the account will next owe rent.
Example: 18446744073709552000
```
#### space integer

```
Data size of the account.
Example: 165
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
"method": "getTokenAccountsByOwner",
"params": [
"A1TMhSGzQxMr1TboBKtgixKz1sS6REASMxPo1qsyTSJd",
{
"programId": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
},
{
"encoding": "jsonParsed"
}
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",