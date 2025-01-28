# Get Signatures For Asset

##### Get a list of transaction signatures related to a compressed asset.

##### This method will return the transaction signatures for a given asset. This only supports

##### compressed assets. This is the easiest way to lookup historical transactions for compressed

##### NFTs.

## getSignaturesForAsset

```
POST https://mainnet.helius-rpc.com/?api-key=<api_key>
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
getSignaturesForAsset
```
##### params* object

##### id* string

```
The ID of the asset to retrieve the signatures for.
Example: "FNt6A9Mfnqbwc1tY7uwAguKQ1JcpBrxmhczDgbdJy5AC"
```
##### page integer

```
The page of results to return.
Example: 1
```
##### limit integer

## Overview


```
The maximum number of signatures to return.
Example: 100
```
##### before string

```
The cursor for paginating backwards through the signatures.
Example: "string"
```
##### after string

```
The cursor for paginating forwards through the signatures.
Example: "string"
```
##### Response^200

Successful response

##### Body application/json

##### jsonrpc string

Example: "2.0"

##### result object

##### total integer

```
The total number of signatures found.
Example: 3
```
##### limit integer

```
The maximum number of signatures requested.
Example: 1000
```
##### items array of array of string

```
An array of signatures and their types.
```
##### items string

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
"method": "getSignaturesForAsset",
"params": {
"id": "FNt6A9Mfnqbwc1tY7uwAguKQ1JcpBrxmhczDgbdJy5AC"
}
}),
});
const data = await response.json();
```
###### {

```
"jsonrpc": "2.0",
"result": {
"total": 3 ,
"limit": 1000 ,
"items": [
[
"5nLi8m72bU6PBcz4Xrk23P6KTGy9ufF92kZiQXjTv9ELgkUxrNaiCGhMF4vh6RAc
"MintToCollectionV1"
],
[
"323Ag4J69gagBt3neUvajNauMydiXZTmXYSfdK5swWcK1iwCUypcXv45UFcy5PTt
"Transfer"
],
[
"3TbybyYRtNjVMhhahTNbd4bbpiEacZn2qkwtH7ByL7tCHmwi2g4YapPidSRGs1gj
"Transfer"
]
]
},
"id": "text"
}
```
## Code Example


const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const getSignaturesForAsset = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'getSignaturesForAsset',
params: {
id: 'FNt6A9Mfnqbwc1tY7uwAguKQ1JcpBrxmhczDgbdJy5AC',
page: 1 , // Starts at 1
limit: 1000 , // Limit 1000 per request.
},
}),
});
const { result } = await response.json();
console.log("Signatures: ", result);
};
getSignaturesForAsset();

// Signatures: {

// total: 2,
// limit: 1000,
// page: 1,
// items: [
// [
// '5nLi8m72bU6PBcz4Xrk23P6KTGy9ufF92kZiQXjTv9ELgkUxrNaiCGhMF4vh6RAc
// 'MintToCollectionV1'
// ]
// [
// '323Ag4J69gagBt3neUvajNauMydiXZTmXYSfdK5swWcK1iwCUypcXv45UFcy5PTt
// 'Transfer'
// ],
// ]