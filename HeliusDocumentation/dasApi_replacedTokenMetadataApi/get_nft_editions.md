# Get Nft Editions

##### Get information about all the edition NFTs for a specic master NFT.

##### Retrieve all the NFT editions associated with a specic master NFT. This is an efcient way

##### to get all the printable editions for a master edition NFT.

## getNftEditions

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
getNftEditions
```
##### params* object

##### mint* string

```
The Mint of the master edition NFT to retrieve.
Example: "Ey2Qb8kLctbchQsMnhZs5DjY32To2QtPuXNwWvk4NosL"
```
##### page integer

```
The page of results to return.
Example: 1
```
##### limit integer

```
The maximum number of editions to return.
```
## Overview


```
Example: 100
```
##### Response^200

Successful response

##### Body application/json

##### total integer

The total number of NFT editions found.

Example: 1

##### limit integer

The maximum number of NFT editions requested.

Example: 1

##### page integer

The current page of results.

Example: 1

##### master_edition_address string

The address of the master edition.

Example: "8SHfqzJYABeGfiG1apwiEYt6TvfGQiL1pdwEjvTKsyiZ"

##### supply integer

Current supply of editions.

Example: 61

##### max_supply integer

Maximum possible supply of editions.

Example: 69

##### editions array of object

An array of editions.

##### mint string

```
The mint of the NFT edition.
Example: "GJvFDcBWf6aDncd1TBzx2ou1rgLFYaMBdbYLBa9oTAEw"
```
##### edition_address string

```
The address of the NFT edition.
```

##### edition integer

```
The edition number of the NFT.
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
"method": "getNftEditions",
"params": {
"mint": "Ey2Qb8kLctbchQsMnhZs5DjY32To2QtPuXNwWvk4NosL"
}
}),
});
const data = await response.json();
```
###### {

```
"total": 1 ,
"limit": 1 ,
"page": 1 ,
"master_edition_address": "8SHfqzJYABeGfiG1apwiEYt6TvfGQiL1pdwEjvTKsyiZ
"supply": 61 ,
"max_supply": 69 ,
"editions": [
{
"mint": "GJvFDcBWf6aDncd1TBzx2ou1rgLFYaMBdbYLBa9oTAEw",
"edition_address": "text",
"edition": 0
}
]
}
```
## Code Example


```
const url = `https://mainnet.helius-rpc.com/?api-key=<API-KEY>`;
```
```
const getNftEditions = async () => {
const response = await fetch(url, {
method: "POST",
headers: {
"Content-Type": "application/json",
},
body: JSON.stringify({
jsonrpc: "2.0",
method: "getNftEditions",
id: "helius-test",
params: {
mint: "Ey2Qb8kLctbchQsMnhZs5DjY32To2QtPuXNwWvk4NosL"
page: 1 ,
limit: 2
},
}),
});
const data = await response.json();
```
```
if (!data.result) {
console.error("No result in the response", data);
return;
}
```
```
console.log(JSON.stringify(data.result, null, 2 ));
};
```
```
getNftEditions();
```
#### How to get all the NFT editions for a specific master edition

#### Response


###### {

"jsonrpc": "2.0",
"result": {
"total": 2,
"limit": 2,
"page": 1,
"master_edition_address": "8SHfqzJYABeGfiG1apwiEYt6TvfGQiL1pdwEjvT
"supply": 66,
"max_supply": 69,
"editions": [
{
"mint": "GJvFDcBWf6aDncd1TBzx2ou1rgLFYaMBdbYLBa9oTAEw",
"edition_address": "AoxgzXKEsJmUyF5pBb3djn9cJFA26zh2SQHvd
"edition": 1
},
{
"mint": "9yQecKKYSHxez7fFjJkUvkz42TLmkoXzhyZxEf2pw8pz",
"edition_address": "giWoA4jqHFkodPJgtbRYRcYtiXbsVytnxnEao
"edition": 2
}
]
},
"id": "0"
}