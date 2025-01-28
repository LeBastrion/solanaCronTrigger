# Get Assets by Owner

##### Get a list of assets owned by an address.

##### This method is the fastest way to return all assets belonging to a wallet. Supported assets

##### include NFTs, compressed NFTs (regular DAS), fungible tokens, and Token22.

##### The page parameter in starts at 1

## getAssetsByOwner

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
getAssetsByOwner
```
##### params* object

##### ownerAddress* string

```
The owner address key.
Example: "86xCnPeV69n6t3DnyGvkKobf9FdN2H9oiVDdaMpo2MMY"
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
##### showFungible boolean

```
Shows the fungible tokens held by the owner.
```
##### showNativeBalance boolean


```
Shows the native balance (SOL) held by the owner.
```
##### showInscription boolean

```
Displays inscription details of assets inscribed on-chain.
```
##### showZeroBalance boolean

```
Displays assets with zero balance.
```
##### Response^200

Successful response

##### Body application/json

##### jsonrpc string

Example: "2.0"

##### result object

##### total integer

```
Example: 1
```
##### limit integer

```
Example: 1
```
##### page integer

```
Example: 1
```
##### items array of object

##### id string

Example: "text"

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
"method": "getAssetsByOwner",
"params": {
"ownerAddress": "86xCnPeV69n6t3DnyGvkKobf9FdN2H9oiVDdaMpo2MMY"
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
"interface": "V1_NFT",
"id": "JCfTS6dmJZY4NXhjMwHqayGGHUwxp59pzcYhZrYqMBce",
"content": {
"$schema": "https://schema.metaplex.com/nft1.0.json",
"json_uri": "https://www.hi-hi.vip/json/5000wif.json",
"files": [
{
"uri": "https://img.hi-hi.vip/json/img/5000wif.png",
"cdn_uri": "https://cdn.helius-rpc.com/cdn-cgi/image//https
"mime": "image/png"
}
]
},
"authorities": [
{
"address": "2iVwwSHr7hGR6wxNuQM8ArQYnX6Mzy2yeFnhBGgQetRw",
"scopes": [
"full"
]
}
],
"compression": {
"eligible": false,
"compressed": true,
"data_hash": "7zquDVS1VKu9HDh4WS4ray5ozLThiK6xrnFNhJtusj65",
"creator_hash": "6v7GeYRiVML5mG1kJqi6eujN9sPB3ziCZJF4Vartj1qd",
"asset_hash": "8gQZkgZ1L91qkNPtsiRGkRzpNcEfhBABEQr1D3wquB8H",
"tree": "BZNn9zX1MysbSvqyGZ33Seb8bvimaiE9fxmLKwX2Euae",
"seq": 251133 ,
"leaf_id": 250758
},
"grouping": [
{
"group_key": "collection",
"group_value": "723Vxwr6aYZHNqc8dVQVwchDHUR3cEwZA8zkejdYWKaS"
}
]


##### Using getAssetsByOwner to return all tokens from a user wallet enables the creation of:

- A wallet tracker.
- A portfolio viewer for both fungible and non-fungible tokens.
- A token-gated dApp.

##### The Fungible Token Extension also returns the USD prices of token holdings.

##### Get NFTs & compressed NFTs from the toly.sol wallet

## Use Cases

## Code Examples


```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const getAssetsByOwner = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetsByOwner',
params: {
ownerAddress: '86xCnPeV69n6t3DnyGvkKobf9FdN2H9oiVDdaMpo2
page: 1 , // Starts at 1
limit: 1000 ,
},
}),
});
const { result } = await response.json();
console.log("Assets by Owner: ", result.items);
};
getAssetsByOwner();
```
##### Get ALL assets from the toly.sol wallet


```
const getAssetsByOwner = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetsByOwner',
params: {
ownerAddress: '86xCnPeV69n6t3DnyGvkKobf9FdN2H9oiVDdaMpo2
page: 1 , // Starts at 1
limit: 1000 ,
displayOptions: {
showFungible: true //return both fungible and non-fungib
}
},
}),
});
const { result } = await response.json();
console.log("Assets by Owner: ", result.items);
};
getAssetsByOwner();
```
##### Searching for all assets (including native balance)


```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const getAssetsWithNativeBalance = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetsByOwner',
params: {
ownerAddress: '86xCnPeV69n6t3DnyGvkKobf9FdN2H9oi
displayOptions: {
showFungible: true,
showNativeBalance: true,
},
},
}),
});
```
```
const { result } = await response.json();
console.log(result.nativeBalance.lamports); // 1479920100
};
getAssetsWithNativeBalance();
```
##### Show inscriptions & SPL-20 data


const url = `https://mainnet.helius-rpc.com/?api-key=<api-key>`

const getAssetsWithInscriptions = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAssetsByOwner',
params: {
ownerAddress: '6GmTFg5SCs4zGfDEidUAJjS5pSrXEPwW8
displayOptions: {
showInscription: true, // display inscriptio
},
},
}),
});

const { result } = await response.json();
console.log(result.items.map((i) => [i.id, i.inscription, i
};
getAssetsWithInscriptions();

// Example output:
// [
// [
// 'AKo9P7S8FE9NYeAcrtZEpimwQAXJMp8Lrt8p4dMkHkY2',
// {
// order: 308332,
// size: 52,
// contentType: 'application/text',
// encoding: 'base64',
// validationHash: '907e00a18f952ade319c21b90764e5d0
// inscriptionDataAccount: '9qM9ThkVPxjq4TyBjCs1qpY1
// },
// { p: 'spl-20', op: 'mint', tick: 'helius', amt: '1' }
// ],
// ];