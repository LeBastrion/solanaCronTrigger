# logsSubscribe

#### Subscribe to transaction logging

#### Filter criteria for the logs to receive results by account type.

#### String Options:

## • all : Subscribe to all transactions except for simple vote transactions.

## • allWithVotes : Subscribe to all transactions, including simple vote transactions.

#### Object Options:

#### An object with the following eld:

## • mentions (array of strings): Array containing a single Pubkey (base-58 encoded^

#### string). Subscribes only to transactions mentioning this address.

#### Note: The mentions eld supports only one Pubkey string per method call. Providing

#### additional addresses will result in an error.

#### Conguration object containing the following eld:

## • commitment (string, optional): Species the desired level of commitment.

## Parameters

## filter (string | object, required)

## object (optional)

## Result


#### Returns an <integer> representing the subscription ID. This ID is required for

#### unsubscribing.

#### Request Example 1 (Filter by mentions with optional conguration):

#### Request Example 2 (Subscribe to all transactions):

#### Response Example:

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "logsSubscribe",
"params": [
{
"mentions": ["11111111111111111111111111111111"]
},
{
"commitment": "finalized"
}
]
}
```
##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "logsSubscribe",
"params": ["all"]
}
```
##### {

```
"jsonrpc": "2.0",
"result": 24040 ,
"id": 1
}
```
## Code Sample


#### The notication is an RpcResponse JSON object with the following elds in value:

- **signature** (string): The transaction signature, base58 encoded.
- **err** (object | null): Error if the transaction failed; null if the transaction^

#### succeeded.

- **logs** (array | null): Array of log messages output by the transaction instructions^

#### during execution. If simulation failed before the transaction could execute (e.g., due to

#### an invalid blockhash or signature verication failure), this will be null.

##### {

```
"jsonrpc": "2.0",
"method": "logsNotification",
"params": {
"result": {
"context": {
"slot": 5208469
},
"value": {
"signature": "5h6xBEauJ3PK6SWCZ1PGjBvj8vDdWG3KpwATGy1ARAXFSDwt8GFX
"err": null,
"logs": [
"SBF program 83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri succe
]
}
},
"subscription": 24040
}
}
```
## Notification Format

### Example Notification