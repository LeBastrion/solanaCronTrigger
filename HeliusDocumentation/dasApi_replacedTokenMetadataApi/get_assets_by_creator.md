# Get Assets by Creator

##### Get a list of assets created by an address.

##### This will return a list of assets for the given creator provided. This can dene compressed or

##### standard NFTs.

##### The page parameter in the request starts at 1

## getAssetsByCreator

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
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
getAssetsByCreator
```
##### params* object

##### creatorAddress* string

```
The creator address key to return assets.
Example: "D3XrkNZz6wx6cofot7Zohsf2KSsu2ArngNk8VqU9cTY3"
```
##### page integer

```
The page of results to return.
```
## Overview


Example: 1

##### limit integer

The maximum number of assets to return.

Example: 100

##### sortBy object

The sorting options for the response.

##### sortBy enum

```
The criteria by which the retrieved assets will be sorted.
```
```
created recent_action updated none
```
##### sortDirection enum

```
The direction by which the retrieved assets will be sorted.
```
```
asc desc
```
##### before string

The cursor for paginating backwards through the assets.

Example: "string"

##### after string

The cursor for paginating forwards through the assets.

Example: "string"

##### options object

The display options for the response.

##### showUnveriedCollections boolean

```
Displays grouping information for unveried collections instead of skipping them.
```
##### showCollectionMetadata boolean

```
Displays metadata for the collection.
```
##### showGrandTotal boolean

```
Shows the total number of assets that matched the query. This will make the request slower.
```
##### showInscription boolean

```
Displays inscription details of assets inscribed on-chain.
```

##### Response^200

Successful response

##### Body application/json

##### jsonrpc string

Example: "2.0"

##### result object

##### total integer

```
The total number of assets found.
Example: 1
```
##### limit integer

```
The maximum number of assets requested.
Example: 1
```
##### page integer

```
The current page of results.
Example: 1
```
##### items array of object

```
An array of assets.
```
##### interface string

```
The interface of the asset.
Example: "Custom"
```
##### id string

```
The ID of the asset.
Example: "JEH7cJxAKdprFG5AvdsY2c4ZqojxLBjFmw19zADV6oK5"
```
##### content object

```
The content of the asset.
```
##### authorities array of object

```
The authorities of the asset.
```

##### compression object

```
The compression details for asset.
```
##### grouping array of object

```
The grouping details for asset.
```
##### royalty object

```
The royalty details for asset.
```
##### creators array of object

```
The creators details for asset.
```
##### ownership object

```
The ownership details for asset.
```
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
"method": "getAssetsByCreator",
"params": {
"creatorAddress": "D3XrkNZz6wx6cofot7Zohsf2KSsu2ArngNk8VqU9cTY3"
}
}),
});
const data = await response.json();
```

###### {

"jsonrpc": "2.0",
"result": {
"total": 1 ,
"limit": 1 ,
"page": 1 ,
"items": [
{
"interface": "Custom",
"id": "JEH7cJxAKdprFG5AvdsY2c4ZqojxLBjFmw19zADV6oK5",
"content": {
"$schema": "https://schema.metaplex.com/nft1.0.json",
"json_uri": "https://famousfoxes.com/metadata/7045.json",
"files": [
{
"uri": "https://famousfoxes.com/hd/7045.png",
"cdn_uri": "https://cdn.helius-rpc.com/cdn-cgi/image//https
"mime": "image/png"
}
]
},
"authorities": [
{
"address": "3pMvTLUA9NzZQd4gi725p89mvND1wRNQM3C8XEv1hTdA",
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
"grouping": [
{
"group_key": "collection",
"group_value": "BUjZjAS2vbbb65g7Z1Ca9ZRVYoJscURG5L3AkVvHP9ac"
}
],
"royalty": {
"royalty_model": "creators",
"target": null,


- NFT creator portfolio
- NFT Search Engine
- NFT-specic blockchain explorer

##### Degen Poet Created NFTs

```
target : null,
"percent": 0.042,
"basis_points": 420 ,
"primary_sale_happened": true,
"locked": false
},
"creators": [
{
"address": "D3XrkNZz6wx6cofot7Zohsf2KSsu2ArngNk8VqU9cTY3",
"share": 0 ,
"verified": true
}
],
"ownership": {
"frozen": false,
"d l d" f l
```
## Use Cases

## Code Example


const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const getAssetsByCreator = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetsByCreator',
params: {
creatorAddress: 'D3XrkNZz6wx6cofot7Zohsf2KSsu2ArngNk8VqU9cTY3',
onlyVerified: true,
page: 1 , // Starts at 1
limit: 1000
},
}),
});
const { result } = await response.json();
console.log("Assets by Creator: ", result.items);
};
getAssetsByCreator();