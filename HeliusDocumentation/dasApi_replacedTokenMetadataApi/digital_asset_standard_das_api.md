# Digital Asset Standard (DAS) API

##### The most comprehensive and performant API for tokens, NFTs, and compressed NFTs on

##### Solana.

##### The Digital Asset Standard (DAS) API is an open-source specication and system that

##### provides a unied interface for interacting with digital assets. The API supports fungible

##### tokens, regular NFTs, and compressed NFTs. Some methods (e.g. "getAssetProof") are

##### exclusively for compressed assets.

##### Helius' API is fully compatible with the shared OpenRPC specication. The API is exposed

##### via our standard RPC endpoints:

## • Mainnet – https://mainnet.helius-rpc.com

## • Devnet – https://devnet.helius-rpc.com

##### The DAS endpoints enable users to query tokens and regular & compressed NFTs.

## • Get Asset – Get an asset by its ID.

## • Get Asset Batch – Get multiple assets by their IDs.

## • Get Asset Proof – Get Merkle proof for a compressed asset using its ID.

## • Get Asset Proof Batch – Get multiple asset proofs using their IDs.

## • Search Assets – Search for assets using a variety of parameters.

## • Get Assets by Owner – Get a list of assets owned by an address.

## • Get Assets by Authority – Get a list of assets with a specic authority.

## What is DAS?

## Endpoints

## DAS API


- Get Assets by Creator – Get a list of assets created by an address.
- Get Assets by Group – Get a list of assets by a group key and value.
- Get Signatures For Asset – Get a list of transaction signatures related to a compressed^

##### asset.

- Get Token Accounts – Get information about all token accounts for a specic mint or an^

##### owner.

- Get Nft Editions – Get information about all the edition NFTs for a specic master NFT.

##### Helius has extended the DAS API to support all tokens , including plain SPL tokens (without

##### metadata) and Token22 (plus their extensions). Fungible token support is available through

##### the getAssetsByOwner and searchAssets methods.

##### You can optionally display inscription and SPL-20 token data with the showInscription

##### ag. You can learn more about inscriptions and SPL-20 here. Please note that this is an

##### experimental feature.

##### The Helius API does not verify SPL-20 tokens. Trade at your own risk. Please use

##### the validator tool or join the Libreplex Discord channel for more information

##### Most NFT collections store additional metadata, such as attributes and image URLs, off-

##### chain, typically on platforms like Arweave or IPFS. DAS enables you to retrieve this off-

##### chain data alongside regular NFT data in a single API call by indexing all the off-chain

##### information.

## Fungible Token Extension

## Inscriptions & SPL-

## Off-chain Indexing


##### Please note that Helius cannot detect off-chain data mutations. The off-chain data will only

##### be updated once the NFT is seen by the system again (e.g. when the NFT is modied on-

##### chain). If you need the off-chain data for a collection to be re-indexed, please reach out to

##### Helius support.