# Search Assets

##### Search for assets using a variety of parameters.

##### This method will return assets based on the custom search criteria passed in. This can

##### dene compressed, regular NFTs, and fungible tokens. This method is optimal for most

##### custom use cases, such as token gating.

##### The page parameter in the request starts at 1.

## searchAssets

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
searchAssets
```
##### params* object

##### page integer

```
The page of results to return.
Example: 1
```
##### authorityAddress string

## Overview


The criteria for authority address set for the asset search.

Example: "string"

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
##### compressed boolean

The criteria in which an asset is compressed or not.

Example: true

##### compressible boolean

The criteria in which an asset is compressible or not.

Example: false

##### delegate integer

The criteria for delegate set for the asset search.

##### creatorAddress string

The criteria for creator in asset search.

Example: "string"

##### creatorVeried boolean

The criteria for whether a creator is veried or not.

Example: true

##### grouping array of string

The address of the owner whose assets to retrieve.


##### items string

##### supply integer

The criteria for supply set for the asset search.

Example: 0

##### supplyMint string

The criteria for supply mint set for the asset search.

##### frozen boolean

The criteria for whether an assets searched are frozen or not.

Example: false

##### burnt boolean

The criteria for whether an asset is burnt or not.

Example: false

##### interface enum

The criteria for interface set for the asset search.

Example: "Custom"

```
V1_NFT V1_PRINT LEGACY_NFT V2_NFT FungibleAsset FungibleToken Custom
Identity Executable ProgrammableNFT
```
##### ownerAddress string

The address of the owner whose assets to retrieve.

Example: "string"

##### royaltyTargetType string

The criteria for royalty target type set for the asset search.

Example: "creators"

##### royaltyTarget integer

The criteria for royalty target set for the asset search.

##### royaltyAmount integer

The criteria for royalty amount set for the asset search.

Example: 0

##### ownerType integer

The criteria for ownership model set for the asset search.


```
Example: "single"
```
##### before string

```
The cursor for paginating backwards through the assets.
Example: "string"
```
##### after string

```
The cursor for paginating forwards through the assets.
Example: "string"
```
##### options object

```
The display options for the response.
```
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
##### tokenType enum

```
The type of token that is being searched for.
```
```
fungible nonFungible regularNFT compressedNFT all
```
##### Response^200

Successful response

##### Body application/json


##### assets object

##### total integer

```
The total number of assets found.
Example: 2
```
##### limit integer

```
The maximum number of assets requested.
Example: 100
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
##### interface enum

```
The interface of the asset.
Example: "V1_NFT"
```
```
V1_NFT V1_PRINT LEGACY_NFT V2_NFT FungibleAsset FungibleToken Custom
Identity Executable ProgrammableNFT
```
##### id string

```
The ID of the asset.
```
##### content object

```
The content of the asset.
```
##### authorities array of object

```
The authorities of the asset.xs
```
##### compression object

```
The compression details for asset.
```
##### grouping object

```
The grouping details for asset.
```
##### royalty object

```
The royalty details for asset.
```

##### creators array of object

The creators details for asset.

##### ownership object

The ownership details for asset.

##### mutable boolean

Whether an asset is mutable or not.

##### burnt boolean

Whether an asset is burned or not.

##### mint_extensions object

The mint extensions details for Token2022.

##### condential_transfer_mint object

```
Condential transfer mint details.
```
##### authority string

```
Authority responsible for the condential transfer.
```
##### auto_approve_new_accounts boolean

```
Auto-approval status of new accounts.
```
##### auditor_elgamal_pubkey string

```
ElGamal public key of the auditor.
```
##### condential_transfer_fee_cong object

```
Conguration details for condential transfer fees.
```
##### authority string

```
Authority responsible for the fee conguration.
```
##### withdraw_withheld_authority_elgamal_pubkey string

```
ElGamal public key for authority to withdraw withheld amounts.
```
##### harvest_to_mint_enabled boolean

```
Status indicating if harvesting to mint is enabled.
```

##### withheld_amount string

```
Amount withheld during condential transfers.
```
##### transfer_fee_cong object

Transfer fee conguration details.

##### transfer_fee_cong_authority string

```
Authority responsible for transfer fee conguration.
```
##### withdraw_withheld_authority string

```
Authority to withdraw withheld amounts.
```
##### withheld_amount number

```
Amount withheld in transfers.
```
##### older_transfer_fee object

```
Details of the older transfer fee structure.
```
##### epoch string

```
Authority responsible for transfer fee conguration.
```
##### maximum_fee string

```
The old maximum fee for the transfer.
```
##### transfer_fee_basis_points string

```
The old transfer fee basis points.
```
##### newer_transfer_fee object

```
Details of the newer transfer fee structure.
```
##### epoch string

```
Authority responsible for transfer fee
```
##### metadata_pointer object

Metadata pointer details.

##### authority string

```
Authority responsible for transfer fee conguration.
```
##### metadata_address string


```
Authority to withdraw withheld amounts.
```
##### mint_close_authority object

Mint close authority details.

##### close_authority string

```
Authority responsible for closing mint.
```
##### permanent_delegate object

Permanent delegate details.

##### delegate string

```
Delegate public key.
```
##### transfer_hook object

Transfer hook details.

##### authority string

```
Authority responsible for the transfer hook.
```
##### program_id string

```
Program ID related to the transfer hook.
```
##### interest_bearing_cong object

Interest bearing conguration details.

##### rate_authority string

```
Authority responsible for setting the interest rate.
```
##### initialization_timestamp number

```
Timestamp of interest rate initialization.
```
##### pre_update_average_rate number

```
Average rate before the latest update.
```
##### last_update_timestamp number

```
Timestamp of the last interest rate update.
```

##### current_rate number

```
Current interest rate.
```
##### default_account_state object

The default state of the account.

##### state string

```
The state of the account.
```
##### condential_transfer_account object

Details of the condential transfer account.

##### approved boolean

```
Indicates whether the account is approved.
```
##### elgamal_pubkey string

```
ElGamal public key associated with the account.
```
##### pending_balance_lo string

```
Lower part of the encrypted pending balance.
```
##### pending_balance_hi string

```
Higher part of the encrypted pending balance.
```
##### available_balance string

```
Encrypted available balance of the account.
```
##### decryptable_available_balance string

```
Decryptable available balance for the account.
```
##### allow_condential_credits boolean

```
Indicates if the account allows condential credits.
```
##### allow_non_condential_credits boolean

```
Indicates if the account allows non-condential credits.
```
##### pending_balance_credit_counter integer

```
Counter for the number of pending balance credits.
```

##### maximum_pending_balance_credit_counter integer

```
Maximum allowed counter for pending balance credits.
```
##### expected_pending_balance_credit_counter integer

```
Expected counter value for pending balance credits.
```
##### actual_pending_balance_credit_counter integer

```
Actual counter value for pending balance credits.
```
##### metadata object

```
Metadata details.
```
##### update_authority string

```
Optional non-zero public key of the update authority.
```
##### mint string

```
Public key of the mint.
```
##### name string

```
Name associated with the metadata.
```
##### symbol string

```
Symbol associated with the metadata.
```
##### uri string

```
URI pointing to the metadata resources.
```
##### additional_metadata array of object

```
A list of additional metadata pairs.
```
##### key string

```
Key of the metadata pair.
```
##### value string

```
Value of the metadata pair.
```
##### supply nullable object

Supply details of master or edition NFT.

##### print_max_supply integer


```
The maximum printable NFTs.
```
##### print_current_supply integer

```
The current printed NFTs.
```
##### edition_nonce integer

```
The nonce of the edition.
```
##### edition_number nullable integer

```
The number of the edition.
```
##### token_info object

Details about the specic token.

##### symbol string

```
The symbol of the token.
```
##### balance integer

```
The amount of the the token in the wallet.
```
##### supply integer

```
The total supply of the token.
```
##### decimals integer

```
The number of decimals the token uses.
```
##### token_program string

```
The tokens program ID.
```
##### associated_token_address string

```
The associated token address.
```
##### price_info object

```
Information about the token's price.
```
##### price_per_token number

```
The price per individual token.
```
##### total_price number

```
The total price all the tokens in the wallet.
```
##### currency string


```
The currency in which the token's price is denoted.
```
##### inscription object

##### order integer

```
The order of the inscription.
```
##### size integer

```
The size of the inscription.
```
##### contentType string

```
The content type of the inscription.
```
##### encoding string

```
The encoding of the inscription.
```
##### validationHash string

```
The validation hash of the inscription.
```
##### inscriptionDataAccount string

```
The inscription data account.
```
##### authority string

```
The authority of the inscription.
```
##### spl20 object

##### nativeBalance object

Details about the accounts native balance.

##### lamports integer

```
The amount of lamports in the account.
```
##### price_per_sol number

```
The price of SOL.
```
##### total_price number

```
The total value of the native balance.
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
"method": "searchAssets",
"params": {}
}),
});
const data = await response.json();
```

###### {

"assets": {
"total": 2 ,
"limit": 100 ,
"page": 1 ,
"items": [
{
"interface": "V1_NFT",
"id": "text",
"authorities": [],
"creators": [],
"mutable": false,
"burnt": false,
"mint_extensions": {
"confidential_transfer_mint": {
"authority": "text",
"auto_approve_new_accounts": false,
"auditor_elgamal_pubkey": "text"
},
"confidential_transfer_fee_config": {
"authority": "text",
"withdraw_withheld_authority_elgamal_pubkey": "text",
"harvest_to_mint_enabled": false,
"withheld_amount": "text"
},
"transfer_fee_config": {
"transfer_fee_config_authority": "text",
"withdraw_withheld_authority": "text",
"withheld_amount": 0 ,
"older_transfer_fee": {
"epoch": "text",
"maximum_fee": "text",
"transfer_fee_basis_points": "text"
},
"newer_transfer_fee": {
"epoch": "text"
}
},
"metadata_pointer": {
"authority": "text",
"metadata_address": "text"
},
"mint_close_authority": {
"close_authority": "text"
},
"permanent_delegate": {
"delegate": "text"
},


##### Fungible tokens will include their associated information (decimals, supply, and price).

##### Token22 tokens are also supported, and their extensions are parsed. We also display native

##### balances if you enable the showNativeBalance ag.

###### },

```
"transfer_hook": {
"authority": "text",
"program_id": "text"
},
"interest_bearing_config": {
"rate_authority": "text",
"initialization_timestamp": 0 ,
"pre_update_average_rate": 0 ,
"last_update_timestamp": 0 ,
"current_rate": 0
},
"default_account_state": {
"state": "text"
},
"confidential_transfer_account": {
"approved": false,
"elgamal_pubkey": "text",
"pending_balance_lo": "text",
"pending_balance_hi": "text",
"available_balance": "text",
"decryptable_available_balance": "text",
"allow_confidential_credits": false,
"allow_non_confidential_credits": false,
"pending_balance_credit_counter": 0 ,
"maximum_pending_balance_credit_counter": 0 ,
"expected_pending_balance_credit_counter": 0 ,
"actual_pending_balance_credit_counter": 0
},
"metadata": {
"update_authority": "text",
"mint": "text",
"name": "text",
"symbol": "text",
"uri": "text",
"additional_metadata": [
{
"key": "text"
```
## Fungible Token Extension


##### The options for tokenType include:

- fungible : Returns all fungible tokens.
- nonFungible: Returns all NFTs (compressed and regular NFTs).
- regularNFT : Returns only the regular NFTs.
- compressedNFT: Returns only the compressed NFTs.
- all : Returns all the tokens.

##### When using the tokenType as a lter, it is mandatory to also include the ownerAddress

##### lter.

```
creatorAddress
```
```
creatorVerified
```
```
grouping
```
```
ownerType
```
```
specificationAssetClass
```
```
compressed
```
```
compressible
```
```
specificationVersion
```
```
authorityAddress
```
```
delegate
```
```
frozen
```
```
supply
```
```
supplyMint
```
##### If the tokenType eld is set to fungible or all the following lters can't be

##### used


##### royalty (and related elds: royaltyTargetType, royaltyTarget,

##### royaltyAmount)

```
burnt
```
```
jsonUri
```
```
collections
```
```
name
```
##### You can optionally display inscription and SPL-20 token data with the showInscription

##### ag. You can learn more about inscriptions and SPL-20 here.

##### Please note that this is an experimental feature.

##### The Helius API does not verify SPL-20 tokens. Trade at your own risk. For more

##### information, please use the validator tool or join the Libreplex Discord channel.

##### Searching for all Fungible Tokens in a wallet

## Inscriptions & SPL-20

### Code Examples


```
const url = `https://mainnet.helius-rpc.com/?api-key=
<api_key>`
```
```
const searchAssets = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
ownerAddress:
'86xCnPeV69n6t3DnyGvkKobf9FdN2H9oiVDdaMpo2MMY',
tokenType: 'fungible',
},
}),
});
const { result } = await response.json();
console.log("Search Assets: ", result);
};
searchAssets();
```
##### Searching for all Fungible Tokens (showing native balance and token info)


```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const searchAssetsTokenInfo = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
ownerAddress: '86xCnPeV69n6t3DnyGvkKobf9FdN2H9oi
tokenType: 'fungible',
displayOptions: {
showNativeBalance: true,
},
},
}),
});
```
```
const { result } = await response.json();
```
```
result.items.forEach(item => { // for each item in the resu
console.log(item.token_info);
});
```
```
console.log("Native Balance: ", result.nativeBalance); // lo
};
```
```
searchAssetsTokenInfo();
```
##### Searching for Drip NFTs owned by vibhu.sol


```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const searchAssetsDrip = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
ownerAddress: 'BAVjpySHMMGDpq3whU7qaqCCRE8ksCeGwxa53Qv2i
grouping: ["collection", "DRiP2Pn2K6fuMLKQmt5rZWyHiUZ6WK
page: 1 , // Starts at 1
limit: 1000
},
}),
});
const { result } = await response.json();
console.log("Drip Haus Assets: ", result);
};
searchAssetsDrip();
```
##### Searching for Compressed Assets in a wallet


```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const searchAssetsCompressed = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
ownerAddress: '2k5AXX4guW9XwRQ1AKCpAuUqgWDpQpwFfpVFh3hnm
compressed: true,
},
}),
});
const { result } = await response.json();
console.log("Search Assets: ", result);
};
searchAssetsCompressed();
```
##### Searching for Inscriptions & SPL-20 data


const url = `https://mainnet.helius-rpc.com/?api-key=<api-key>`

const searchAssetsInscriptions = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
ownerAddress: '6GmTFg5SCs4zGfDEidUAJjS5pSrXEPwW8
tokenType: 'regularNft',
displayOptions: {
showInscription: true, // display inscriptio
},
},
}),
});

const { result } = await response.json();
console.log(result.items.map((i) => [i.id, i.inscription, i
};
searchAssetsInscriptions();