# Get Asset Proof

##### Get a merkle proof for a compressed asset by its ID.

##### This is an essential method for transactions involving a compressed asset. For instance,

##### when transferring a compressed NFT, you must return the proof and tree ID for the

##### transaction to succeed.

##### Additional preparation is needed on the root of a transaction; you can check out

##### transferAsset in our examples repository.

## getAssetProof

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
getAssetProof
```
## Overview


##### params* object

##### id* string

```
The ID of the compressed asset to return it's proof.
Example: "Bu1DEKeawy7txbnCEJE4BU3BKLXaNAKCYcHR4XhndGss"
```
##### Response^200

Successful response

##### Body application/json

##### root string

The root of the merkle tree.

Example: "2o6Y6EiY3WXhoaEpei2pHmHLYnHDcEQVhgD89GrGHDBH"

##### proof array of string

The proof of the asset.

##### items string

##### node_index integer

Example: 16384

##### leaf string

The leaf of the merkle tree.

Example: "6YdZXw49M97mfFTwgQb6kxM2c6eqZkHSaW9XhhoZXtzv"

##### tree_id string

The ID of the merkle tree.

Example: "2kuTFCcjbV22wvUmtmgsFR7cas7eZUzAu96jzJUvUcb7"

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
"method": "getAssetProof",
"params": {
"id": "Bu1DEKeawy7txbnCEJE4BU3BKLXaNAKCYcHR4XhndGss"
}
}),
});
const data = await response.json();
```
###### {

```
"root": "2o6Y6EiY3WXhoaEpei2pHmHLYnHDcEQVhgD89GrGHDBH",
"proof": [
[
"EmJXiXEAhEN3FfNQtBa5hwR8LC5kHvdLsaGCoERosZjK",
"7NEfhcNPAwbw3L87fjsPqTz2fQdd1CjoLE138SD58FDQ",
"6dM3VyeQoYkRFZ74G53EwvUPbQC6LsMZge6c7S1Ds4ks",
"A9AACJ5m7UtaVz4HxzhDxGjYaY88rc2XPoFvnoTvgYBj",
"2VG5cKeBZdqozwhHGGzs13b9tzy9TXt9kPfN8MzSJ1Sm",
"3E1uFze4pi6BnTZXMsQbeh3jQCeDi966Zax9aMbYgg2D",
"Bx9PdctdWCeC1WfU6dwP49idsXCYhqyxbRLyLwwGhr61",
"HSbJ8quT4vuXFgf5FnjzeUuFfAtLKsq6W1Frj8y1qrif",
"GJMLzL4F4hY9yFHY1EY6XRmW4wpuNGeBZTiv7vM2mYra",
"FYPtEiqmRx6JprHQvWeEWEuVp3WA7DPRCE4VbhFRVuAj",
"6MJKrpnK1GbYsnEzwMRWStNGkTjAZF23NhzTQSQVXsD3",
"HjnrJn5vBUUzpCxzjjM9ZnCPuXei2cXKJjX468B9yWD7",
"4YCF1CS TX 1Yi9W9J Y k d 2dL EBHL9 "
```
### Example


const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const getAssetProof = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetProof',
params: {
id: 'Bu1DEKeawy7txbnCEJE4BU3BKLXaNAKCYcHR4XhndGss'
},
}),
});
const { result } = await response.json();
console.log("Assets Proof: ", result);
};
getAssetProof();