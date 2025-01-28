# Get Assets by Group

##### Get a list of assets by a group key and value.

##### This will return the asset information for a specic group provided (i.e. Collection). This can

##### return compressed or standard NFTs. You can use this endpoint to fetch mint lists for an

##### NFT collection

##### The page parameter in the request starts at 1

## getAssetsByGroup

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
getAssetsByGroup
```
##### params* object

##### groupKey* string

```
The group key for the asset search.
Example: "collection"
```
##### groupValue* string

## Overview


The address value of the group.

Example: "J1S9H3QjnRtBbbuD4HjPV6RpRhwuk4zKbxsnCHuTgh9w"

##### page integer

The page of results to return.

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
Example: "ProgrammableNFT"
```
##### id string

```
Example: "JEGruwYE13mhX2wi2MGrPmeLiVyZtbBptmVy9vG3pXRC"
```
##### authorities array

##### compression object


##### grouping array

##### royalty object

##### creators array

##### ownership object

##### supply object

##### mutable boolean

```
Example: true
```
##### burnt boolean

```
Example: false
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
"method": "getAssetsByGroup",
"params": {
"groupKey": "collection",
"groupValue": "J1S9H3QjnRtBbbuD4HjPV6RpRhwuk4zKbxsnCHuTgh9w"
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
"interface": "ProgrammableNFT",
"id": "JEGruwYE13mhX2wi2MGrPmeLiVyZtbBptmVy9vG3pXRC",
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
},
"creators": [
{
"address": "5XvhfmRjwXkGp3jHGmaKpqeerNYjkuZZBYLVQYdeVcRv",
"share": 0 ,
"verified": true
}


- NFT Collection Page
- NFT Mintlist
- Token Gated dApps

###### }

###### ],

```
"ownership": {
"frozen": true,
"delegated": false,
"delegate": null,
"ownership_model": "single",
"owner": "3F21SJs4FMpsakrxmd8GjgfQZG6BN6MVsvXcm5Yc6Jcf"
},
"supply": {
"print_max_supply": 0 ,
"print_current_supply": 0 ,
"edition_nonce": 254
},
"mutable": true,
```
##### Mad Lads Mint List

## Use Cases

## Code Examples


```
const url = "https://mainnet.helius-rpc.com/?api-key=<api-key>"
```
```
const getAssetsByGroup = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetsByGroup',
params: {
groupKey: 'collection',
groupValue: 'J1S9H3QjnRtBbbuD4HjPV6RpRhwuk4zKbxsnCHuTg
page: 1 , // Starts at 1
limit: 1000 ,
},
}),
});
const { result } = await response.json();
console.log("Assets by Group: ", result.items);
};
getAssetsByGroup();
```
##### Pagination with Mad Lads


const url = "https://mainnet.helius-rpc.com/?api-key=<api-key>"

const getAssetsByGroup = async () => {
console.time("getAssetsByGroup"); // Start the timer
let page = 1 ;
let assetList = [];

while (page) {
const response = await fetch(url, {
method: "POST",
headers: {
"Content-Type": "application/json",
},
body: JSON.stringify({
jsonrpc: "2.0",
id: "my-id",
method: "getAssetsByGroup",
params: {
groupKey: "collection",
groupValue: "J1S9H3QjnRtBbbuD4HjPV6RpRhwuk4zKbxsnCHuTg
page: page,
limit: 1000 ,
},
}),
});
const { result } = await response.json();

assetList.push(...result.items);
if (result.total !== 1000 ) {
page = false;
} else {
page++;
}
}
const resultData = {
totalResults: assetList.length,
results: assetList,
};
console.log("Mad Lads Assets: ", resultData);
};
getAssetsByGroup();