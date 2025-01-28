# voteSubscribe

#### Subscribe to receive notication anytime a new vote is observed in gossip. These votes are

#### pre-consensus therefore there is no guarantee these votes will enter the ledger.

#### voteSubscribe is marked as unstable in the Solana documentation. As a result,

#### Helius does not support this method.

#### No parameters are required for this method.

#### Returns an <integer> representing the subscription ID. This ID is required to

#### unsubscribe.

#### Request Example:

#### Response Example:

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "voteSubscribe"
}
```
## Parameters

## None

## Result

## Code Sample


#### The notication is an object with the following elds:

- **hash** (string): The vote hash.
- **slots** (array): The slots covered by the vote, as an array of u64 integers.
- **timestamp** (i64 | null): The timestamp of the vote.
- **signature** (string): The signature of the transaction containing this vote.
- **votePubkey** (string): The public key of the vote account, as a base-58 encoded^

#### string.

##### {

```
"jsonrpc": "2.0",
"result": 0 ,
"id": 1
}
```
##### {

```
"jsonrpc": "2.0",
"method": "voteNotification",
"params": {
"result": {
"hash": "8Rshv2oMkPu5E4opXTRyuyBeZBqQ4S477VG26wUTFxUM",
"slots": [ 1 , 2 ],
"timestamp": null,
"signature": "5h6xBEauJ3PK6SWCZ1PGjBvj8vDdWG3KpwATGy1ARAXFSDwt8GFXM
"votePubkey": "Vote111111111111111111111111111111111111111"
},
"subscription": 0
}
}
```
## Notification Format

### Example Notification