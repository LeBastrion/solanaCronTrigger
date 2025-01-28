# requestAirdrop

#### Requests an airdrop of lamports to a Pubkey

## requestAirdrop

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
Example: "requestAirdrop"
```
```
requestAirdrop
```
#### params array of one of

```
Parameters for the airdrop request.
```
#### items one of string

#### string

```
The public key of the account to receive lamports, as a base-58 encoded string.
Example: "83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri"
```
#### Response^200

```
Successfully requested airdrop.
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

#### result string

Transaction signature of the airdrop.

Example:

"5VERv8NMvzbJMEkV8xnrLkEaWRtSz9CosKDYjCJjBRnbJLgp8uirBgmQpjKhoR4tjF3ZpRzrFmBV6UjKdiS

ZkQUW"

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
"method": "requestAirdrop",
"params": [
"83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri",
1000000000
]
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1",
"result": "5VERv8NMvzbJMEkV8xnrLkEaWRtSz9CosKDYjCJjBRnbJLgp8uirBgmQpjKh
}
```