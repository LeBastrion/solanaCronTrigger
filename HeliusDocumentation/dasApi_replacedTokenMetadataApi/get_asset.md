# Get Asset

##### Get an asset by its ID.

##### This method will return all relevant information, including metadata for a given Token or

##### Any NFT (cNFT, pNFT, core NFT). To support tokens (Fungible Extensions), set the

##### showFungible ag to true. You can optionally display inscription and SPL-20 token data

##### with the showInscription ag.

## getAsset

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
##### id* enum

```
An ID to identify the request.
```
```
test
```
##### method* enum

```
The name of the DAS method to invoke.
```
```
getAsset
```
##### params* object

##### id* string

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

##### jsonrpc enum

The version of the JSON-RPC protocol.

```
2.
```
##### id string

The ID used to identify the request.

##### result object

##### interface enum

```
The interface type of the asset.
```
```
V1_NFT V1_PRINT LEGACY_NFT V2_NFT FungibleAsset FungibleToken Custom
Identity Executable ProgrammableNFT
```
##### id string

```
The unique identi er of the asset.
```
##### content object

```
Content information of the asset.
```
##### $schema string

```
The schema URL for the asset metadata.
```

##### json_uri string

```
URI pointing to the JSON metadata.
```
##### les array of object

```
Array of les associated with the asset.
```
##### metadata object

```
Metadata information about the asset.
```
##### name string

```
The name of the asset.
```
##### symbol string

```
The symbol of the asset.
```
##### links object

```
External links related to the asset.
```
##### authorities array of object

List of authorities associated with the asset.

##### address string

```
The authority's address.
```
##### scopes array of string

```
The scopes of authority.
```
##### items string

##### compression object

Compression details of the asset.

##### eligible boolean

```
Whether the asset is eligible for compression.
```
##### compressed boolean

```
Whether the asset is currently compressed.
```
##### data_hash string


```
Hash of the asset data.
```
##### creator_hash string

```
Hash of the creator data.
```
##### asset_hash string

```
Hash of the entire asset.
```
##### tree string

```
Merkle tree address.
```
##### seq integer

```
Sequence number.
```
##### leaf_id integer

```
Leaf identi er in the merkle tree.
```
##### grouping array of object

Grouping information for the asset.

##### group_key string

```
The key identifying the group.
```
##### group_value string

```
The value associated with the group.
```
##### royalty object

Royalty information for the asset.

##### royalty_model string

```
The model used for royalties.
```
##### target nullable string

```
The target address for royalties.
```
##### percent number

```
Royalty percentage.
```
##### basis_points integer

```
Royalty basis points.
```

##### primary_sale_happened boolean

```
Whether the primary sale has occurred.
```
##### locked boolean

```
Whether the royalty is locked.
```
##### creators array of object

List of creators of the asset.

##### address string

```
The creator's address.
```
##### share integer

```
The creator's share percentage.
```
##### veried boolean

```
Whether the creator is veried.
```
##### ownership object

Ownership details of the asset.

##### frozen boolean

```
Whether the asset is frozen.
```
##### delegated boolean

```
Whether the asset is delegated.
```
##### delegate nullable string

```
The delegate's address if delegated.
```
##### ownership_model string

```
The model of ownership.
```
##### owner string

```
The owner's address.
```
##### supply nullable object

Supply information for the asset.

##### print_max_supply integer


```
Maximum supply that can be printed.
```
##### print_current_supply integer

```
Current printed supply.
```
##### edition_nonce integer

```
Edition nonce.
```
##### mutable boolean

```
Whether the asset is mutable.
```
##### burnt boolean

```
Whether the asset has been burnt.
```
##### token_info object

```
Token-specic information.
```
##### supply integer

```
Total token supply.
```
##### decimals integer

```
Number of decimals.
```
##### token_program string

```
Token program ID.
```
##### mint_authority string

```
Mint authority address.
```
##### freeze_authority string

```
Freeze authority address.
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
"id": "test",
"method": "getAsset",
"params": {
"id": "F9Lw3ki3hJ7PF9HQXsBzoY8GyE6sPoEZZdXJBsTTD2rk"
}
}),
});
const data = await response.json();
```

###### {

```
"jsonrpc": "2.0",
"id": "text",
"result": {
"interface": "V1_NFT",
"id": "text",
"content": {
"$schema": "text",
"json_uri": "text",
"files": [],
"metadata": {
"name": "text",
"symbol": "text"
}
},
"authorities": [
{
"address": "text",
"scopes": [
"text"
]
}
],
"compression": {
"eligible": false,
"compressed": false,
"data_hash": "text",
"creator_hash": "text",
"asset_hash": "text",
"tree": "text",
"seq": 0 ,
"leaf_id": 0
},
"grouping": [
{
"group_key": "text",
"group_value": "text"
}
```
##### Get info on Mad Lad #

## Code Example


```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const getAsset = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAsset',
params: {
id: 'F9Lw3ki3hJ7PF9HQXsBzoY8GyE6sPoEZZdXJBsTTD2rk'
},
}),
});
const { result } = await response.json();
console.log("Asset: ", result);
};
getAsset();
```
##### Fungible token example


```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const getAsset = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAsset',
params: {
id: 'J1toso1uCk3RLmjorhTtrVwY9HJ7X8V9yYac6Y7kGCPn',
displayOptions: {
showFungible: true //return details about a fungible tok
}
},
}),
});
const { result } = await response.json();
console.log("Asset: ", result);
};
getAsset();
```
##### Inscription & SPL-20 example


const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const getAsset = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getAsset',
params: {
id: 'AKo9P7S8FE9NYeAcrtZEpimwQAXJMp8Lrt8p4dMkHkY
displayOptions: {
showInscription: true, // shows inscription
},
},
}),
});
const { result } = await response.json();
console.log([result.inscription, result.spl20]);
};
getAsset();

// Example output:
// [
// {
// order: 308332,
// size: 52,
// contentType: 'application/text',
// encoding: 'base64',
// validationHash: '907e00a18f952ade319c21b90764e5d0a08e
// inscriptionDataAccount: '9qM9ThkVPxjq4TyBjCs1qpY15VYV
// },
// { p: 'spl-20', op: 'mint', tick: 'helius', amt: '1' },
// ];