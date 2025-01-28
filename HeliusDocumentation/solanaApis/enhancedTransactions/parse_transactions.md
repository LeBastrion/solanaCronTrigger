# Parse Transaction(s)

##### Parse individual Solana transactions.

##### Enhanced Transaction API V1 won't be updated while we work on V2.

## • Mainnet – https://api.helius.xyz/v0/transactions

## • Devnet – https://api-devnet.helius.xyz/v0/transactions

##### Returns an array of enriched, human-readable transactions of the given transaction

##### signatures. For a full list of Transaction Types and Sources, please see Transaction Types.

##### The maximum number of transactions you can pass into this endpoint is 100.

##### We only parse NFT actions, Jupiter swaps, and SPL-related transactions. Do not

##### rely on these parsers for DeFi or non-NFT, Jupiter, and SPL transactions.

## v0/transactions

```
POST https://api.helius.xyz/v0/transactions
```
##### Query parameters

##### api-key* string

```
The api key.
```
##### commitment Commitment (enum)

```
How nalized a block must be to be included in the search. If not provided, will default to "nalized"
commitment. Note that "processed" level commitment is not supported.
```
## Endpoints

## Parse Transaction(s)


```
finalized confirmed
```
##### Body application/json

##### transactions array of string

##### items string

```
The transaction IDs/signatures to parse for.
```
##### Response^200

Returns an array of enriched transactions.

##### Body application/json

##### description string

Example: "Human readable interpretation of the transaction"

##### type TransactionType (enum)

```
UNKNOWN NFT_BID NFT_GLOBAL_BID NFT_GLOBAL_BID_CANCELLED NFT_BID_CANCELLED
NFT_LISTING NFT_CANCEL_LISTING NFT_SALE NFT_MINT NFT_AUCTION_CREATED
NFT_AUCTION_UPDATED NFT_AUCTION_CANCELLED NFT_PARTICIPATION_REWARD
NFT_MINT_REJECTED CREATE_STORE WHITELIST_CREATOR ADD_TO_WHITELIST
REMOVE_FROM_WHITELIST AUCTION_MANAGER_CLAIM_BID EMPTY_PAYMENT_ACCOUNT
UPDATE_PRIMARY_SALE_METADATA ADD_TOKEN_TO_VAULT ACTIVATE_VAULT INIT_VAULT
INIT_BANK INIT_STAKE MERGE_STAKE SPLIT_STAKE SET_BANK_FLAGS SET_VAULT_LOCK
UPDATE_VAULT_OWNER UPDATE_BANK_MANAGER RECORD_RARITY_POINTS ADD_RARITIES_TO_BANK
INIT_FARM INIT_FARMER REFRESH_FARMER UPDATE_FARM AUTHORIZE_FUNDER
DEAUTHORIZE_FUNDER FUND_REWARD CANCEL_REWARD LOCK_REWARD PAYOUT
VALIDATE_SAFETY_DEPOSIT_BOX_V2 SET_AUTHORITY INIT_AUCTION_MANAGER_V
UPDATE_EXTERNAL_PRICE_ACCOUNT AUCTION_HOUSE_CREATE CLOSE_ESCROW_ACCOUNT WITHDRAW
DEPOSIT TRANSFER BURN BURN_NFT PLATFORM_FEE LOAN RESCIND_LOAN OFFER_LOAN
CANCEL_OFFER LEND_FOR_NFT REQUEST_LOAN CANCEL_LOAN_REQUEST BORROW_SOL_FOR_NFT
CLAIM_NFT REBORROW_SOL_FOR_NFT REPAY_LOAN TAKE_LOAN FORECLOSE_LOAN
UPDATE_OFFER ADD_TO_POOL REMOVE_FROM_POOL CLOSE_POSITION UNLABELED
CLOSE_ACCOUNT WITHDRAW_GEM DEPOSIT_GEM STAKE_TOKEN UNSTAKE_TOKEN STAKE_SOL
UNSTAKE_SOL CLAIM_REWARDS BUY_SUBSCRIPTION SWAP INIT_SWAP CANCEL_SWAP
REJECT_SWAP INITIALIZE_ACCOUNT TOKEN_MINT CREATE_APPRAISAL CANDY_MACHINE_WRAP
CANDY_MACHINE_UNWRAP CANDY_MACHINE_UPDATE CANDY_MACHINE_ROUTE FRACTIONALIZE
```

DEPOSIT_FRACTIONAL_POOL FUSE CREATE_RAFFLE BUY_TICKETS UPDATE_ITEM LIST_ITEM

DELIST_ITEM ADD_ITEM CLOSE_ITEM BUY_ITEM FILL_ORDER UPDATE_ORDER CREATE_ORDER

CLOSE_ORDER CANCEL_ORDER KICK_ITEM UPGRADE_FOX UPGRADE_FOX_REQUEST LOAN_FOX

BORROW_FOX SWITCH_FOX_REQUEST SWITCH_FOX CREATE_ESCROW ACCEPT_REQUEST_ARTIST

CANCEL_ESCROW ACCEPT_ESCROW_ARTIST ACCEPT_ESCROW_USER PLACE_BET PLACE_SOL_BET

CREATE_BET INIT_RENT NFT_RENT_LISTING NFT_RENT_CANCEL_LISTING

NFT_RENT_UPDATE_LISTING NFT_RENT_ACTIVATE NFT_RENT_END

UPGRADE_PROGRAM_INSTRUCTION FINALIZE_PROGRAM_INSTRUCTION EXECUTE_TRANSACTION

APPROVE_TRANSACTION ACTIVATE_TRANSACTION CREATE_TRANSACTION CANCEL_TRANSACTION

REJECT_TRANSACTION ADD_INSTRUCTION CREATE_MASTER_EDITION ATTACH_METADATA

REQUEST_PNFT_MIGRATION START_PNFT_MIGRATION MIGRATE_TO_PNFT UPDATE_RAFFLE

CREATE_MERKLE_TREE DELEGATE_MERKLE_TREE COMPRESSED_NFT_MINT

COMPRESSED_NFT_TRANSFER COMPRESSED_NFT_REDEEM COMPRESSED_NFT_CANCEL_REDEEM

COMPRESSED_NFT_BURN COMPRESSED_NFT_VERIFY_CREATOR COMPRESSED_NFT_UNVERIFY_CREATOR

COMPRESSED_NFT_VERIFY_COLLECTION COMPRESSED_NFT_UNVERIFY_COLLECTION

COMPRESSED_NFT_SET_VERIFY_COLLECTION DECOMPRESS_NFT COMPRESS_NFT

COMPRESSED_NFT_DELEGATE CREATE_POOL DISTRIBUTE_COMPRESSION_REWARDS

CHANGE_COMIC_STATE UPDATE_RECORD_AUTHORITY_DATA CREATE_AVATAR_CLASS

CREATE_AVATAR CREATE_TRAIT CREATE_PAYMENT_METHOD EQUIP_TRAIT

EQUIP_TRAIT_AUTHORITY REMOVE_TRAIT REMOVE_TRAIT_AUTHORITY UPDATE_TRAIT_VARIANT

UPDATE_TRAIT_VARIANT_AUTHORITY UPDATE_CLASS_VARIANT_AUTHORITY

UPDATE_TRAIT_VARIANT_METADATA UPDATE_CLASS_VARIANT_METADATA BEGIN_VARIANT_UPDATE

BEGIN_TRAIT_UPDATE CANCEL_UPDATE UPDATE_VARIANT TRANSFER_PAYMENT BURN_PAYMENT

BURN_PAYMENT_TREE TRANSFER_PAYMENT_TREE ADD_PAYMENT_MINT_PAYMENT_METHOD

ADD_TRAIT_CONFLICTS VERIFY_PAYMENT_MINT VERIFY_PAYMENT_MINT_TEST

BOUND_HADO_MARKET_TO_FRAKT_MARKET DEPOSIT_TO_BOND_OFFER_STANDARD

WITHDRAW_FROM_BOND_OFFER_STANDARD INITIALIZE_HADO_MARKET FINISH_HADO_MARKET

UPDATE_HADO_MARKET_FEE REMOVE_BOND_OFFER_V2 REPAY_FBOND_TO_TRADE_TRANSACTIONS

EXIT_VALIDATE_AND_SELL_TO_BOND_OFFERS_V2 REFINANCE_TO_BOND_OFFERS_V

CREATE_BOND_AND_SELL_TO_OFFERS LIQUIDATE_BOND_ON_AUCTION_PNFT

CLAIM_NFT_BY_LENDER_PNFT CREATE_BOND_AND_SELL_TO_OFFERS_FOR_TEST

INITIALIZE_FLASH_LOAN_POOL DEPOSIT_SOL_TO_FLASH_LOAN_POOL

WITHDRAW_SOL_FROM_FLASH_LOAN_POOL TAKE_FLASH_LOAN REPAY_FLASH_LOAN

CREATE_BOND_OFFER_STANDARD UPDATE_BOND_OFFER_STANDARD STAKE_BANX UNSTAKE_BANX

UNSUB_OR_HARVEST_WEEKS UNSUB_OR_HARVEST_WEEKS_ENHANCED UPDATE_STAKING_SETTINGS

MAP_BANX_TO_POINTS PATCH_BROKEN_USER_STAKES DEPOSIT_TO_REWARDS_VAULT

WITHDRAW_REWARDS_FROM_VAULT REFINANCE_FBOND_BY_LENDER SELL_STAKED_BANX_TO_OFFERS

REPAY_STAKED_BANX CREATE_PERPETUAL_BOND_OFFER REMOVE_PERPETUAL_OFFER


```
REPAY_PERPETUAL_LOAN REFINANCE_PERPETUAL_LOAN CREATE_BOND_AND_SELL_TO_OFFERS_CNFT
REPAY_FBOND_TO_TRADE_TRANSACTIONS_CNFT REFINANCE_TO_BOND_OFFERS_V2_CNFT
CLAIM_NFT_BY_LENDER_CNFT LIQUIDATE_BOND_ON_AUCTION_CNFT MAKE_PERPETUAL_MARKET
UPDATE_PERPETUAL_MARKET UPDATE_PERPETUAL_OFFER UPDATE_INTEREST_PERPETUAL_MARKET
BORROW_PERPETUAL CLAIM_PERPETUAL_LOAN TERMINATE_PERPETUAL_LOAN
INSTANT_REFINANCE_PERPETUAL_LOAN BORROW_STAKED_BANX_PERPETUAL
REPAY_STAKED_BANX_PERPETUAL_LOAN BORROW_CNFT_PERPETUAL REPAY_CNFT_PERPETUAL_LOAN
CLAIM_CNFT_PERPETUAL_LOAN REPAY_PARTIAL_PERPETUAL_LOAN CREATE_COLLECTION
UPDATE_COLLECTION UPDATE_COLLECTION_OR_CREATOR UPDATE_FLOOR DELETE_COLLECTION
CREATE_STATS UPDATE_STATS CLEAN EXPIRE FIX_POOL ADMIN_SYNC_LIQUIDITY
CLOSE_POOL UPDATE_POOL UPDATE_POOL_COLLECTIONS UPDATE_POOL_STATUS
UPDATE_POOL_MORTGAGE UPDATE_USABLE_AMOUNT UPDATE_POOL_WHITELIST ADD_LIQUIDITY
SYNC_LIQUIDITY WITHDRAW_LIQUIDITY TAKE_COMPRESSED_LOAN REPAY REPAY_COMPRESSED
LIQUIDATE TAKE_MORTGAGE FREEZE UNFREEZE SELL_LOAN BUY_LOAN EXTEND_LOAN
SELL_NFT PROPOSE_LOAN CANCEL_PROPOSAL POOL_CANCEL_PROPOSAL ACCEPT_PROPOSAL
EXECUTE_LOAN EXECUTE_MORTGAGE LIST_NFT DELIST_NFT CLAIM_SALE BOT_LIQUIDATE
BOT_UNFREEZE BOT_LIQUIDATE_SELL BOT_DELIST BOT_CLAIM_SALE
```
##### source TransactionSource (enum)

```
FORM_FUNCTION EXCHANGE_ART CANDY_MACHINE_V3 CANDY_MACHINE_V2 CANDY_MACHINE_V
UNKNOWN SOLANART SOLSEA MAGIC_EDEN HOLAPLEX METAPLEX OPENSEA
SOLANA_PROGRAM_LIBRARY ANCHOR PHANTOM SYSTEM_PROGRAM STAKE_PROGRAM COINBASE
CORAL_CUBE HEDGE LAUNCH_MY_NFT GEM_BANK GEM_FARM DEGODS BSL YAWWW ATADIA
DIGITAL_EYES HYPERSPACE TENSOR BIFROST JUPITER MERCURIAL SABER SERUM
STEP_FINANCE CROPPER RAYDIUM ALDRIN CREMA LIFINITY CYKURA ORCA MARINADE
STEPN SENCHA SAROS ENGLISH_AUCTION FOXY HADESWAP FOXY_STAKING FOXY_RAFFLE
FOXY_TOKEN_MARKET FOXY_MISSIONS FOXY_MARMALADE FOXY_COINFLIP FOXY_AUCTION
CITRUS ZETA ELIXIR ELIXIR_LAUNCHPAD CARDINAL_RENT CARDINAL_STAKING BPF_LOADER
BPF_UPGRADEABLE_LOADER SQUADS SHARKY_FI OPEN_CREATOR_PROTOCOL BUBBLEGUM NOVA
D_READER RAINDROPS W_SOL DUST SOLI USDC FLWR HDG MEAN UXD SHDW POLIS
ATLAS USH TRTLS RUNNER INVICTUS
```
##### fee integer

Example: 5000

##### feePayer string

Example: "8cRrU1NzNpjL3k2BwjW3VixAcX6VFc29KHr4KZg8cs2Y"

##### signature string


Example:

"yy5BT9benHhx8fGCvhcAfTtLEHAtRJ3hRTzVL16bdrTCWm63t2vapfrZQZLJC3RcuagekaXjSs2zUGQvbct

o8DK"

##### slot integer

Example: 148277128

##### timestamp integer

Example: 1656442333

##### nativeTransfers array of NativeTransfer (object)

##### fromUserAccount string

```
The user account the sol is sent from.
```
##### toUserAccount string

```
The user account the sol is sent to.
```
##### amount integer

```
The amount of sol sent (in lamports).
```
##### tokenTransfers array of TokenTransfer (object)

##### fromUserAccount string

```
The user account the tokens are sent from.
```
##### toUserAccount string

```
The user account the tokens are sent to.
```
##### fromTokenAccount string

```
The token account the tokens are sent from.
```
##### toTokenAccount string

```
The token account the tokens are sent to.
```
##### tokenAmount number

```
The number of tokens sent.
```

##### mint string

```
The mint account of the token.
Example: "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
```
##### accountData array of AccountData (object)

##### account string

```
The account that this data is provided for.
```
##### nativeBalanceChange number

```
Native (SOL) balance change of the account.
```
##### tokenBalanceChanges array of TokenBalanceChange (object)

```
Token balance changes of the account.
```
##### userAccount string

```
Example: "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ"
```
##### tokenAccount string

```
Example: "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn"
```
##### mint string

```
Example: "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ"
```
##### rawTokenAmount RawTokenAmount (object)

##### tokenAmount string

##### decimals integer

##### transactionError object

##### error string

##### instructions array of Instruction (object)

##### accounts array of string

```
The accounts used in instruction.
```

##### items string

```
Example: "8uX6yiUuH4UjUb1gMGJAdkXorSuKshqsFGDCFShcK88B"
```
##### data string

```
Data passed into the instruction
Example: "kdL8HQJrbbvQRGXmoadaja1Qvs"
```
##### programId string

```
Program used in instruction
Example: "MEisE1HzehtrDpAAT8PnLHjpSSkRYakotTuJRPjTpo8"
```
##### innerInstructions array of InnerInstruction (object)

```
Inner instructions used in instruction
```
##### accounts array of string

##### items string

##### data string

##### programId string

##### events object

Events associated with this transaction. These provide ne-grained information about the

transaction. They match the types returned from the event APIs.

##### nft NFTEvent (object)

##### description string

```
Human readable interpretation of the transaction
```
##### type NFTEventType (enum)

```
NFT_BID NFT_BID_CANCELLED NFT_GLOBAL_BID NFT_GLOBAL_BID_CANCELLED
NFT_LISTING NFT_CANCEL_LISTING NFT_SALE NFT_MINT NFT_MINT_REJECTED
NFT_AUCTION_CREATED NFT_AUCTION_UPDATED NFT_AUCTION_CANCELLED
NFT_PARTICIPATION_REWARD BURN_NFT NFT_RENT_LISTING
NFT_RENT_CANCEL_LISTING NFT_RENT_UPDATE_LISTING NFT_RENT_ACTIVATE
NFT_RENT_END ATTACH_METADATA MIGRATE_TO_PNFT CREATE_POOL
```

##### source TransactionSource (enum)

```
FORM_FUNCTION EXCHANGE_ART CANDY_MACHINE_V3 CANDY_MACHINE_V
CANDY_MACHINE_V1 UNKNOWN SOLANART SOLSEA MAGIC_EDEN HOLAPLEX METAPLEX
OPENSEA SOLANA_PROGRAM_LIBRARY ANCHOR PHANTOM SYSTEM_PROGRAM
STAKE_PROGRAM COINBASE CORAL_CUBE HEDGE LAUNCH_MY_NFT GEM_BANK
GEM_FARM DEGODS BSL YAWWW ATADIA DIGITAL_EYES HYPERSPACE TENSOR
BIFROST JUPITER MERCURIAL SABER SERUM STEP_FINANCE CROPPER RAYDIUM
ALDRIN CREMA LIFINITY CYKURA ORCA MARINADE STEPN SENCHA SAROS
ENGLISH_AUCTION FOXY HADESWAP FOXY_STAKING FOXY_RAFFLE
FOXY_TOKEN_MARKET FOXY_MISSIONS FOXY_MARMALADE FOXY_COINFLIP
FOXY_AUCTION CITRUS ZETA ELIXIR ELIXIR_LAUNCHPAD CARDINAL_RENT
CARDINAL_STAKING BPF_LOADER BPF_UPGRADEABLE_LOADER SQUADS SHARKY_FI
OPEN_CREATOR_PROTOCOL BUBBLEGUM NOVA D_READER RAINDROPS W_SOL DUST
SOLI USDC FLWR HDG MEAN UXD SHDW POLIS ATLAS USH TRTLS RUNNER
INVICTUS
```
##### amount integer

The amount of the NFT transaction (in lamports).

Example: 1000000

##### fee integer

Example: 5000

##### feePayer string

Example: "8cRrU1NzNpjL3k2BwjW3VixAcX6VFc29KHr4KZg8cs2Y"

##### signature string

Example:

"4jzQxVTaJ4Fe4Fct9y1aaT9hmVyEjpCqE2bL8JMnuLZbzHZwaL4kZZvNEZ6bEj6fGmiAdCPjmNQH

Cf8v994PAgDf"

##### slot integer

Example: 148277128

##### timestamp integer

Example: 1656442333

##### saleType SaleType (enum)


```
AUCTION INSTANT_SALE OFFER GLOBAL_OFFER MINT UNKNOWN
```
##### buyer string

```
The buyer of the NFT.
```
##### seller string

```
The seller of the NFT.
```
##### staker string

```
The staker of the NFT.
```
##### nfts array of Token (object)

```
NFTs that are a part of this NFT event.
```
##### mint string

```
The mint account of the token.
Example: "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
```
##### tokenStandard TokenStandard (enum)

```
NonFungible FungibleAsset Fungible NonFungibleEdition
```
##### swap SwapEvent (object)

##### nativeInput NativeBalanceChange (object)

##### account string

```
The account the native balance change is for
Example: "2uySTNgvGT2kwqpfgLiSgeBLR3wQyye1i1A2iQWoPiFr"
```
##### amount string

```
The amount of the balance change as a string
Example: "100000000"
```
##### nativeOutput NativeBalanceChange (object)

##### account string

```
The account the native balance change is for
Example: "2uySTNgvGT2kwqpfgLiSgeBLR3wQyye1i1A2iQWoPiFr"
```
##### amount string


```
The amount of the balance change as a string
Example: "100000000"
```
##### tokenInputs array of TokenBalanceChange (object)

The token inputs to the swap.

##### userAccount string

```
Example: "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ"
```
##### tokenAccount string

```
Example: "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn"
```
##### mint string

```
Example: "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ"
```
##### rawTokenAmount RawTokenAmount (object)

##### tokenAmount string

##### decimals integer

##### tokenOutputs array of TokenBalanceChange (object)

The token outputs of the swap.

##### userAccount string

```
Example: "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ"
```
##### tokenAccount string

```
Example: "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn"
```
##### mint string

```
Example: "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ"
```
##### rawTokenAmount RawTokenAmount (object)

##### tokenAmount string

##### decimals integer


##### tokenFees array of TokenBalanceChange (object)

The token fees paid by an account.

##### userAccount string

```
Example: "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ"
```
##### tokenAccount string

```
Example: "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn"
```
##### mint string

```
Example: "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ"
```
##### rawTokenAmount RawTokenAmount (object)

##### tokenAmount string

##### decimals integer

##### nativeFees array of NativeBalanceChange (object)

The native fees paid by an account.

##### account string

```
The account the native balance change is for
Example: "2uySTNgvGT2kwqpfgLiSgeBLR3wQyye1i1A2iQWoPiFr"
```
##### amount string

```
The amount of the balance change as a string
Example: "100000000"
```
##### innerSwaps array of TokenSwap (object)

The inner swaps occuring to make this swap happen. Eg. a swap of wSOL <-> USDC may

be make of multiple swaps from wSOL <-> DUST, DUST <-> USDC

##### tokenInputs array of TokenTransfer (object)

```
The token inputs of this swap.
```
##### fromUserAccount string

```
The user account the tokens are sent from.
```
##### toUserAccount string


```
The user account the tokens are sent to.
```
##### fromTokenAccount string

```
The token account the tokens are sent from.
```
##### toTokenAccount string

```
The token account the tokens are sent to.
```
##### tokenAmount number

```
The number of tokens sent.
```
##### mint string

```
The mint account of the token.
Example: "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
```
##### tokenOutputs array of TokenTransfer (object)

The token outputs of this swap.

##### fromUserAccount string

```
The user account the tokens are sent from.
```
##### toUserAccount string

```
The user account the tokens are sent to.
```
##### fromTokenAccount string

```
The token account the tokens are sent from.
```
##### toTokenAccount string

```
The token account the tokens are sent to.
```
##### tokenAmount number

```
The number of tokens sent.
```
##### mint string

```
The mint account of the token.
Example: "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
```
##### tokenFees array of TokenTransfer (object)

Fees charged with tokens for this swap.

##### fromUserAccount string


```
The user account the tokens are sent from.
```
##### toUserAccount string

```
The user account the tokens are sent to.
```
##### fromTokenAccount string

```
The token account the tokens are sent from.
```
##### toTokenAccount string

```
The token account the tokens are sent to.
```
##### tokenAmount number

```
The number of tokens sent.
```
##### mint string

```
The mint account of the token.
Example: "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
```
##### nativeFees array of NativeTransfer (object)

Fees charged in SOL for this swap.

##### fromUserAccount string

```
The user account the sol is sent from.
```
##### toUserAccount string

```
The user account the sol is sent to.
```
##### amount integer

```
The amount of sol sent (in lamports).
```
##### programInfo ProgramInfo (object)

##### source string

```
Example: "ORCA"
```
##### account string

```
The account of the program
Example: "whirLbMiicVdio4qvUfM5KAg6Ct8VwpYzGff3uctyCc"
```
##### programName string

```
The name of the program
```

```
Example: "ORCA_WHIRLPOOLS"
```
##### instructionName string

```
The name of the instruction creating this swap. It is the value of instruction name
from the Anchor IDL, if it is available.
Example: "whirlpoolSwap"
```
##### compressed CompressedNFTEvent (object)

##### type CompressedNFTEventType (enum)

```
COMPRESSED_NFT_MINT COMPRESSED_NFT_TRANSFER CREATE_MERKLE_TREE
COMPRESSED_NFT_REDEEM COMPRESSED_NFT_CANCEL_REDEEM COMPRESSED_NFT_BURN
COMPRESSED_NFT_DELEGATE DELEGATE_MERKLE_TREE
COMPRESSED_NFT_VERIFY_CREATOR COMPRESSED_NFT_UNVERIFY_CREATOR
COMPRESSED_NFT_VERIFY_COLLECTION COMPRESSED_NFT_UNVERIFY_COLLECTION
COMPRESSED_NFT_SET_VERIFY_COLLECTION DECOMPRESS_NFT COMPRESS_NFT
```
##### treeId string

```
The address of the related merkle tree.
```
##### assetId string

```
The id of the compressed nft.
```
##### leafIndex integer

```
The index of the leaf being appended or modied.
```
##### instructionIndex integer

```
The index of the parsed instruction in the transaction.
```
##### innerInstructionIndex integer

```
The index of the parsed inner instruction in the transaction.
```
##### newLeafOwner string

```
The new owner of the leaf.
```
##### oldLeafOwner string

```
The previous owner of the leaf.
```

##### distributeCompressionRewards DistributeCompressionRewardsEvent

##### (object)

##### amount integer

```
Amount transfered in the DistributeCompressionRewardsV0 instruction.
```
##### setAuthority SetAuthorityEvent (object)

##### account string

```
Tthe account whose authority is changing.
```
##### from string

```
Current authority.
```
##### to string

```
New authority.
```
##### instructionIndex integer

```
The index of the parsed instruction in the transaction.
```
##### innerInstructionIndex integer

```
The index of the parsed inner instruction in the transaction.
```
##### Request JavaScript

```
Test it
```
##### Response^200

```
const response = await fetch('https://api.helius.xyz/v0/transactions?api-
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({}),
});
const data = await response.json();
```

###### [

###### {

"description": "Human readable interpretation of the transaction",
"type": "UNKNOWN",
"source": "FORM_FUNCTION",
"fee": 5000 ,
"feePayer": "8cRrU1NzNpjL3k2BwjW3VixAcX6VFc29KHr4KZg8cs2Y",
"signature": "yy5BT9benHhx8fGCvhcAfTtLEHAtRJ3hRTzVL16bdrTCWm63t2vapfr
"slot": 148277128 ,
"timestamp": 1656442333 ,
"nativeTransfers": [
{
"fromUserAccount": "text",
"toUserAccount": "text",
"amount": 0
}
],
"tokenTransfers": [
{
"fromUserAccount": "text",
"toUserAccount": "text",
"fromTokenAccount": "text",
"toTokenAccount": "text",
"tokenAmount": 0 ,
"mint": "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
}
],
"accountData": [
{
"account": "text",
"nativeBalanceChange": 0 ,
"tokenBalanceChanges": [
{
"userAccount": "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ",
"tokenAccount": "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn
"mint": "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ",
"rawTokenAmount": {
"tokenAmount": "text",
"decimals": 0
}
}
]
}
],
"transactionError": {
"error": "text"
},
"instructions": [


instructions : [
{
"accounts": [
"8uX6yiUuH4UjUb1gMGJAdkXorSuKshqsFGDCFShcK88B"
],
"data": "kdL8HQJrbbvQRGXmoadaja1Qvs",
"programId": "MEisE1HzehtrDpAAT8PnLHjpSSkRYakotTuJRPjTpo8",
"innerInstructions": [
{
"accounts": [
"text"
],
"data": "text",
"programId": "text"
}
]
}
],
"events": {
"nft": {
"description": "text",
"type": "NFT_BID",
"source": "FORM_FUNCTION",
"amount": 1000000 ,
"fee": 5000 ,
"feePayer": "8cRrU1NzNpjL3k2BwjW3VixAcX6VFc29KHr4KZg8cs2Y",
"signature": "4jzQxVTaJ4Fe4Fct9y1aaT9hmVyEjpCqE2bL8JMnuLZbzHZwaL
"slot": 148277128 ,
"timestamp": 1656442333 ,
"saleType": "AUCTION",
"buyer": "text",
"seller": "text",
"staker": "text",
"nfts": [
{
"mint": "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx",
"tokenStandard": "NonFungible"
}
]
},
"swap": {
"nativeInput": {
"account": "2uySTNgvGT2kwqpfgLiSgeBLR3wQyye1i1A2iQWoPiFr",
"amount": "100000000"
},
"nativeOutput": {
"account": "2uySTNgvGT2kwqpfgLiSgeBLR3wQyye1i1A2iQWoPiFr",
"amount": "100000000"
},


"tokenInputs": [
{
"userAccount": "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ",
"tokenAccount": "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn
"mint": "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ",
"rawTokenAmount": {
"tokenAmount": "text",
"decimals": 0
}
}
],
"tokenOutputs": [
{
"userAccount": "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ",
"tokenAccount": "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn
"mint": "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ",
"rawTokenAmount": {
"tokenAmount": "text",
"decimals": 0
}
}
],
"tokenFees": [
{
"userAccount": "F54ZGuxyb2gA7vRjzWKLWEMQqCfJxDY1whtqtjdq4CJ",
"tokenAccount": "2kvmbRybhrcptDnwyNv6oiFGFEnRVv7MvVyqsxkirgdn
"mint": "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ",
"rawTokenAmount": {
"tokenAmount": "text",
"decimals": 0
}
}
],
"nativeFees": [
{
"account": "2uySTNgvGT2kwqpfgLiSgeBLR3wQyye1i1A2iQWoPiFr",
"amount": "100000000"
}
],
"innerSwaps": [
{
"tokenInputs": [
{
"fromUserAccount": "text",
"toUserAccount": "text",
"fromTokenAccount": "text",
"toTokenAccount": "text",
"tokenAmount": 0 ,


```
parseTransaction.js
```
```
"mint": "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
}
],
"tokenOutputs": [
{
"fromUserAccount": "text",
"toUserAccount": "text",
"fromTokenAccount": "text",
"toTokenAccount": "text",
"tokenAmount": 0 ,
"mint": "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
}
],
"tokenFees": [
{
"fromUserAccount": "text",
"toUserAccount": "text",
"fromTokenAccount": "text",
"toTokenAccount": "text",
"tokenAmount": 0 ,
"mint": "DsfCsbbPH77p6yeLS1i4ag9UA5gP9xWSvdCx72FJjLsx"
}
],
"nativeFees": [
{
"fromUserAccount": "text",
"toUserAccount": "text",
"amount": 0
}
],
"programInfo": {
"source": "ORCA",
"account": "whirLbMiicVdio4qvUfM5KAg6Ct8VwpYzGff3uctyCc",
"programName": "ORCA_WHIRLPOOLS",
"instructionName": "whirlpoolSwap"
}
}
]
},
"compressed": {
"type": "COMPRESSED_NFT_MINT",
"t Id" "t t"
```
## Code Example


const url = "https://api.helius.xyz/v0/transactions/?api-key=<your-key>";

const parseTransaction = async () => {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
transactions: ["your-txn-id-here"],
}),
});

const data = await response.json();
console.log("parsed transaction: ", data);
};

parseTransaction();