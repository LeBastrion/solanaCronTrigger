# getTokenAccountsByDelegate

#### Returns all SPL Token accounts by approved Delegate.

## getTokenAccountsByDelegate

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
Example: "getTokenAccountsByDelegate"
```
```
getTokenAccountsByDelegate
```
#### params array of one of

```
Parameters for querying token accounts by delegate.
```
#### items one of string

#### string

```
Pubkey of the account delegate to query, as a base-58 encoded string.
Example: "4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T"
```
#### Response^200

```
Successfully retrieved token accounts by delegate.
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
#### slot integer

```
Slot in which the data was fetched.
Example: 1114
```
#### value array of object

```
List of token accounts.
```
#### pubkey string

```
Account Pubkey as a base-58 encoded string.
Example: "28YTZEwqtMHWrhWcvv34se7pjS7wctgqzCPB3gReCFKp"
```
#### account object

```
Token account details.
```
#### lamports integer

```
Number of lamports assigned to the account.
Example: 1726080
```
#### owner string

```
Pubkey of the program this account has been assigned to.
Example: "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
```
#### data object

```
Token state data associated with the account.
```

#### program string

Program name.

Example: "spl-token"

#### parsed object

Parsed token data.

#### info object

```
Token account information.
```
#### tokenAmount object

```
Token amount details.
```
#### amount string

```
Raw balance without decimals.
Example: "1"
```
#### decimals integer

```
Number of decimals.
Example: 1
```
#### uiAmount number

```
Balance in user-friendly format.
Example: 0.1
```
#### uiAmountString string

```
Balance as a string.
Example: "0.1"
```
#### delegate string

```
Delegate account Pubkey.
Example: "4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T"
```
#### delegatedAmount object

```
Amount delegated to the account.
```
#### amount string

```
Raw balance without decimals.
Example: "1"
```

#### decimals integer

```
Number of decimals.
Example: 1
```
#### uiAmount number

```
Balance in user-friendly format.
Example: 0.1
```
#### uiAmountString string

```
Balance as a string.
Example: "0.1"
```
#### state string

```
Token account state.
Example: "initialized"
```
#### isNative boolean

```
Indicates if the account holds native SOL.
Example: false
```
#### mint string

```
Pubkey of the token mint.
Example: "3wyAj7Rt1TWVPZVteFJPLa26JmLvdb1CAKEFZm3NY75E"
```
#### owner string

```
Pubkey of the account owner.
Example: "CnPoSPKXu7wJqxe59Fs72tkBeALovhsCxYeFwPCQH9TD"
```
#### space integer

```
Space allocated for the account.
Example: 165
```
#### executable boolean

Indicates if the account contains a program.

Example: false

#### rentEpoch integer

Epoch at which the account will next owe rent.


```
Example: 4
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
"method": "getTokenAccountsByDelegate",
"params": [
"4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T",
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
"result": {
"context": {
"slot": 1114
},
"value": [
{
"pubkey": "28YTZEwqtMHWrhWcvv34se7pjS7wctgqzCPB3gReCFKp",
"account": {
"lamports": 1726080 ,
"owner": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
"data": {
"program": "spl-token",
"parsed": {
"info": {
"tokenAmount": {
"amount": "1",
"decimals": 1 ,
"uiAmount": 0.1,
"uiAmountString": "0.1"
},
"delegate": "4Nd1mBQtrMJVYVfKf2PJy9NZUZdTAsp7D4xWLs4gDB4T
"delegatedAmount": {
"amount": "1",
"decimals": 1 ,
"uiAmount": 0.1,
"uiAmountString": "0.1"
}
},
"state": "initialized"