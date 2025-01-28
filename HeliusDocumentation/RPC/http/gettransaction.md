# getTransaction

#### Returns transaction details for a conrmed transaction

## getTransaction

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
Example: "getTransaction"
```
```
getTransaction
```
#### params array of one of

```
Parameters for querying a transaction.
```
#### items one of string

#### string

```
Transaction signature as a base-58 encoded string.
Example:
"2nBhEBYYvfaAe16UMNqRHre4YNSskvuYgx3M6E4JP1oDYvZEJHvoPzyUidNgNX5r9sTyN1J9Uxtb
CXy2rqYcuyuv"
```
#### Response^200

```
Successfully retrieved the transaction details.
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

Transaction details.

#### slot integer

```
Slot this transaction was processed in.
Example: 430
```
#### transaction object

```
Transaction object.
```
#### message object

```
Transaction message details.
```
#### accountKeys array of string

```
List of account keys involved in the transaction.
```
#### items string

```
Example: "3UVYmECPPMZSCqWKfENfuoTv51fTDTWicX9xmBD2euKe"
```
#### header object

```
Header information for the transaction.
```
#### numReadonlySignedAccounts integer

```
Number of read-only signed accounts.
Example: 0
```
#### numReadonlyUnsignedAccounts integer

```
Number of read-only unsigned accounts.
Example: 3
```

#### numRequiredSignatures integer

```
Number of required signatures.
Example: 1
```
#### instructions array of object

```
List of instructions in the transaction.
```
#### accounts array of integer

```
List of accounts involved in the instruction.
```
#### items integer

```
Example: 1
```
#### data string

```
Encoded instruction data.
Example:
"37u9WtQpcm6ULa3WRQHmj49EPs4if7o9f1jSRVZpm2dvihR9C8jY4NqEwXUbLwx15HBSN
cP1"
```
#### programIdIndex integer

```
Program ID index for the instruction.
Example: 4
```
#### recentBlockhash string

```
Recent blockhash for the transaction.
Example: "mfcyqEXB3DnHXki6KjjmZck6YjmZLvpAByy2fj4nh6B"
```
#### signatures array of string

```
Transaction signatures.
```
#### items string

```
Example:
"2nBhEBYYvfaAe16UMNqRHre4YNSskvuYgx3M6E4JP1oDYvZEJHvoPzyUidNgNX5r9sTyN1J9
UxtbCXy2rqYcuyuv"
```
#### meta object

Transaction status metadata.


#### err nullable object

Error if transaction failed; null if successful.

#### fee integer

Transaction fee in lamports.

Example: 5000

#### innerInstructions array of object

List of inner instructions.

#### postBalances array of integer

Account balances after the transaction.

#### items integer

```
Example: 499998932500
```
#### preBalances array of integer

Account balances before the transaction.

#### items integer

```
Example: 499998937500
```
#### rewards nullable array of object

Transaction-level rewards.

#### pubkey string

```
Public key of the rewarded account.
Example: "3UVYmECPPMZSCqWKfENfuoTv51fTDTWicX9xmBD2euKe"
```
#### lamports integer

```
Number of lamports credited or debited.
Example: 500
```
#### postBalance integer

```
Account balance after reward application.
Example: 1000
```
#### rewardType string

```
Type of reward.
```

```
Example: "rent"
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
"method": "getTransaction",
"params": [
"2nBhEBYYvfaAe16UMNqRHre4YNSskvuYgx3M6E4JP1oDYvZEJHvoPzyUidNgNX5r
"json"
]
}),
});
const data = await response.json();
```

##### {

"jsonrpc": "2.0",
"id": "1",
"result": {
"slot": 430 ,
"transaction": {
"message": {
"accountKeys": [
"3UVYmECPPMZSCqWKfENfuoTv51fTDTWicX9xmBD2euKe"
],
"header": {
"numReadonlySignedAccounts": 0 ,
"numReadonlyUnsignedAccounts": 3 ,
"numRequiredSignatures": 1
},
"instructions": [
{
"accounts": [
1
],
"data": "37u9WtQpcm6ULa3WRQHmj49EPs4if7o9f1jSRVZpm2dvihR9C8jY
"programIdIndex": 4
}
],
"recentBlockhash": "mfcyqEXB3DnHXki6KjjmZck6YjmZLvpAByy2fj4nh6B"
},
"signatures": [
"2nBhEBYYvfaAe16UMNqRHre4YNSskvuYgx3M6E4JP1oDYvZEJHvoPzyUidNgNX5r
]