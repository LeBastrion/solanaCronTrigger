# Fungible Token Extension

##### The most versatile API for working with tokens on Solana.

##### Initially, the DAS API only supported ownership queries against Metaplex NFTs and cNFTs.

##### Helius has extended the DAS API to support all tokens , including plain SPL tokens (without

##### metadata) and Token22 (plus their extensions).

##### Users can query for the token balances of any account, across all tokens (SPL, Token22,

##### NFTs, compressed NFTs). We've also included token prices in USD.

##### A Solana token is dened by its mint account. For example, the mint account for USDC is

##### EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v. When you buy $40 of USDC, a

##### token account is created that holds 40 USDC tokens. This can extend to hundreds (and even

##### more) of token accounts for different tokens.

##### Want to learn more about Token22? Check out the Helius blog post!

##### The Helius extension for fungible tokens resolves around ownership indexing. The following

##### queries provide a unied view of an account's assets. GetAsset, GetAssetsByOwner, and

##### SearchAssets support fungible tokens.

##### This extension adds an extra eld called tokenType. This eld allows you to query against

##### all assets the account owns, including fungible and Token22 tokens.

##### The options for tokenType include:

## • fungible : Returns all fungible tokens.

## • nonFungible: Returns all NFTs (compressed and regular NFTs).

## Background

## How does it work?


- regularNFT : Returns only the regular NFTs.
- compressedNFT: Returns only the compressed NFTs.
- all : Returns all the tokens.

##### Example:

##### You'll now see fungible tokens like JitoSOL in the response (trimmed for brevity). It will

##### include the total account balance, the token's program address, the associated token

##### address, the total supply in circulation, and the price information.

###### {

```
"jsonrpc": "2.0",
"id": "helius-test",
"method": "searchAssets",
"params": {
"ownerAddress": "5aZZ4duJUKiMsJN9vRsoAn4SDX7agvKu7Q3QdFWRfWze",
"tokenType": "all"
}
}
```

##### We support Token22 tokens and parse their extensions. The response will include the

##### mint_extensions eld if it is a Token22 program. Here is an example for BERN:

```
"id": "J1toso1uCk3RLmjorhTtrVwY9HJ7X8V9yYac6Y7kGCPn",
"content": {
"$schema": "",
"json_uri": "",
"metadata": {
"description": "MEV-Powered Liquid Staking Derivative",
"name": "Jito Staked SOL",
"symbol": "JitoSOL",
"token_standard": "Fungible"
},
[...],
"token_info": {
"symbol": "JitoSOL",
"balance": 35688813508 ,
"supply": 5949594702758293 ,
"decimals": 9 ,
"token_program": "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA",
"associated_token_address": "H7iLu4DPFpzEx1AGN8BCN7Qg966YFndt781p
"price_info": {
"price_per_token": 56.47943,
"total_price": 2015.6838854339217,
"currency": "USDC"
}
},
[...]
```
### Token22 Support


##### For backwards compatibility, the behaviour is identical to the original DAS, meaning only

##### NFTs and compressed NFTs are returned.

```
"mint_extensions": {
"transfer_fee_config": {
"withheld_amount": 0 ,
"newer_transfer_fee": {
"epoch": 457 ,
"maximum_fee": 3906250000000000000 ,
"transfer_fee_basis_points": 690
},
"older_transfer_fee": {
"epoch": 455 ,
"maximum_fee": 3906250000000000000 ,
"transfer_fee_basis_points": 0
},
"withdraw_withheld_authority": "7MyTjmRygJoCuDBUtAuSugiYZFULD2SWa
"transfer_fee_config_authority": "7MyTjmRygJoCuDBUtAuSugiYZFULD2SW
}
}
```
###### {

```
"jsonrpc": "2.0",
"id": "helius-test",
"method": "searchAssets",
"params": {
"ownerAddress": "5aZZ4duJUKiMsJN9vRsoAn4SDX7agvKu7Q3QdFWRfWze"
}
}
```
### Backwards Compatibility