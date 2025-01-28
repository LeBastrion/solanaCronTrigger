# Get Asset Batch

##### Get multiple assets by their IDs.

##### This method will return valuable NFT metadata for multiple compressed or standard NFTs.

##### You can pass up to 1,000 IDs in this request.

## getAssetBatch

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
##### Body application/json

##### jsonrpc* enum

```
The version of the JSON-RPC protocol.
```
```
2.
```
##### id* string

```
An ID to identify the request.
Example: "test"
```
##### method* enum

```
The name of the DAS method to invoke.
```
```
getAssetBatch
```
##### params* object

##### ids* array of string

##### items string

```
The ID of the asset to retrieve.
Example: "F9Lw3ki3hJ7PF9HQXsBzoY8GyE6sPoEZZdXJBsTTD2rk"
```
##### options object

```
The display options for the response.
```
## Overview


##### showUnveriedCollections boolean

```
Displays grouping information for unveried collections instead of skipping them.
```
##### showCollectionMetadata boolean

```
Displays metadata for the collection.
```
##### showFungible boolean

```
Displays fungible tokens held by the owner.
```
##### showInscription boolean

```
Displays inscription details of assets inscribed on-chain.
```
##### Response^200

Successful response

##### Body application/json

##### interface enum

The interface of the asset.

Example: "ProgrammableNFT"

```
V1_NFT V1_PRINT LEGACY_NFT V2_NFT FungibleAsset FungibleToken Custom
Identity Executable ProgrammableNFT
```
##### id string

The ID of the asset.

Example: "F9Lw3ki3hJ7PF9HQXsBzoY8GyE6sPoEZZdXJBsTTD2rk"

##### content object

The content of the asset.

##### $schema string

```
Example: "https://schema.metaplex.com/nft1.0.json"
```
##### json_uri string

```
Example: "https://madlads.s3.us-west-2.amazonaws.com/json/8420.json"
```
##### les array of object

##### metadata object


##### attributes array of object

##### description string

```
Example: "Fock it."
```
##### name string

```
Example: "Mad Lads #8420"
```
##### symbol string

```
Example: "MAD"
```
##### authorities array of object

##### compression object

##### grouping array of object

##### royalty object

##### creators array of object

##### ownership object

##### supply object

##### token_info object

##### mint_extensions object

The mint extensions details for Token2022.

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
"id": "test",
"method": "getAssetBatch",
"params": {
"ids": [
"F9Lw3ki3hJ7PF9HQXsBzoY8GyE6sPoEZZdXJBsTTD2rk"
]
}
}),
});
const data = await response.json();
```

###### [

###### {

"interface": "ProgrammableNFT",
"id": "F9Lw3ki3hJ7PF9HQXsBzoY8GyE6sPoEZZdXJBsTTD2rk",
"content": {
"$schema": "https://schema.metaplex.com/nft1.0.json",
"json_uri": "https://madlads.s3.us-west-2.amazonaws.com/json/8420.j
"files": [
{
"uri": "https://madlads.s3.us-west-2.amazonaws.com/images/8420.
"cdn_uri": "https://cdn.helius-rpc.com/cdn-cgi/image//https://m
"mime": "image/png"
}
],
"metadata": {
"attributes": [
{
"value": "Male",
"trait_type": "Gender"
},
{
"value": "King",
"trait_type": "Type"
}
],
"description": "Fock it.",
"name": "Mad Lads #8420",
"symbol": "MAD"
}
},
"authorities": [
{
"address": "2RtGg6fsFiiF1EQzHqbd66AhW7R5bWeQGpTbv2UMkCdW",
"scopes": [
"full"
]
}
],
"compression": {
"eligible": false,
"compressed": false,
"data_hash": "",
"creator_hash": "",
"asset_hash": "",
"tree": "",
"seq": 0 ,
"leaf_id": 0
},


###### },

```
"grouping": [
{
"group_key": "collection",
"group_value": "J1S9H3QjnRtBbbuD4HjPV6RpRhwuk4zKbxsnCHuTgh9w"
}
],
"royalty": {
"royalty_model": "creators",
"target": null,
"percent": 0.042,
"basis_points": 420 ,
"primary_sale_happened": true,
"locked": false
```
```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const getAssetBatch = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetBatch',
params: {
ids: [
'81bxPqYCE8j34nQm7Rooqi8Vt3iMHLzgZJ71rUVbQQuz',
'CWHuz6GPjWYdwt7rTfRHKaorMwZP58Spyd7aqGK7xFbn'
]
},
}),
});
const { result } = await response.json();
console.log("Assets: ", result);
};
getAssetBatch();
```
## Code Example