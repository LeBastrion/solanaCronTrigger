# Get Asset Proof Batch

##### Get multiple asset proofs by their IDs.

##### This is an essential method for fetching proofs for multiple compressed assets. You can pass

##### up to 1,000 IDs in this request.

## getAssetProofBatch

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
##### Query parameters

##### api-key* string

```
The API key.
Example: "string"
```
##### Body application/json

##### jsonrpc* enum

```
The version of the JSON-RPC protocol.
```
```
2.0
```
##### id* string

```
An ID to identify the request.
```
##### method* enum

```
The name of the DAS method to invoke.
```
```
getAssetProofBatch
```
##### params* object

##### ids* array of string

##### items string

```
The ID of the asset proof to retrieve.
```
## Overview


```
Example: "Bu1DEKeawy7txbnCEJE4BU3BKLXaNAKCYcHR4XhndGss"
```
##### Response^200

Successful response

##### Body application/json

##### jsonrpc string

Example: "2.0"

##### result object

##### Bu1DEKeawy7txbnCEJE4BU3BKLXaNAKCYcHR4XhndGss object

##### root string

```
The root of the merkle tree.
Example: "2o6Y6EiY3WXhoaEpei2pHmHLYnHDcEQVhgD89GrGHDBH"
```
##### proof array of string

```
The proof of the asset.
```
##### items string

##### node_index integer

```
Example: 16384
```
##### leaf string

```
The leaf of the merkle tree.
Example: "6YdZXw49M97mfFTwgQb6kxM2c6eqZkHSaW9XhhoZXtzv"
```
##### tree_id string

```
The ID of the merkle tree.
Example: "2kuTFCcjbV22wvUmtmgsFR7cas7eZUzAu96jzJUvUcb7"
```
##### id string

Example: "my-id"


##### Request JavaScript

```
Test it
```
##### Response^200

```
const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": "text",
"method": "getAssetProofBatch",
"params": {
"ids": [
"Bu1DEKeawy7txbnCEJE4BU3BKLXaNAKCYcHR4XhndGss"
]
}
}),
});
const data = await response.json();
```
###### {

```
"jsonrpc": "2.0",
"result": {
"Bu1DEKeawy7txbnCEJE4BU3BKLXaNAKCYcHR4XhndGss": {
"root": "2o6Y6EiY3WXhoaEpei2pHmHLYnHDcEQVhgD89GrGHDBH",
"proof": [
"EmJXiXEAhEN3FfNQtBa5hwR8LC5kHvdLsaGCoERosZjK",
"7NEfhcNPAwbw3L87fjsPqTz2fQdd1CjoLE138SD58FDQ"
],
"node_index": 16384 ,
"leaf": "6YdZXw49M97mfFTwgQb6kxM2c6eqZkHSaW9XhhoZXtzv",
"tree_id": "2kuTFCcjbV22wvUmtmgsFR7cas7eZUzAu96jzJUvUcb7"
}
},
"id": "my-id"
```
## Code Example


const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const getAssetProofBatch = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetProofBatch',
params: {
ids: [
'81bxPqYCE8j34nQm7Rooqi8Vt3iMHLzgZJ71rUVbQQuz',
'CWHuz6GPjWYdwt7rTfRHKaorMwZP58Spyd7aqGK7xFbn'
]
},
}),
});
const { result } = await response.json();
console.log("Asset Proofs: ", result);
};
getAssetProofBatch();