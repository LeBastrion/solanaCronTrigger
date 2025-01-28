# signatureSubscribe

#### Subscribe to receive a notication when the transaction with the given signature reaches

#### the specied commitment level.

#### The transaction signature, as a base-58 encoded string.

#### Info:

## • The transaction signature must be the rst signature from the transaction.

#### Conguration object containing the following elds:

## • commitment (string, optional): Species the desired level of commitment.

## • enableReceivedNotification (bool, optional): Determines whether to subscribe for^

#### notications when signatures are received by the RPC, in addition to when they are

#### processed.

#### Returns an <integer> representing the subscription ID. This ID is required for

#### unsubscribing.

## Parameters

## string (required)

## object (optional)

## Result

## Code Sample


#### Request Example:

#### Response Example:

#### The notication is an RpcResponse JSON object with the following elds in value:

- **slot** (u64): The corresponding slot.
- **value** (object | string):

## ◦ If enableReceivedNotification is true and the signature is received, the^

#### literal string "receivedSignature".

## ◦ When the signature is processed:

## ▪ err (object | null):

- null if the transaction succeeded at the specied commitment level.
- A TransactionError object if the transaction failed.

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "signatureSubscribe",
"params": [
"2EBVM6cB8vAAD93Ktr6Vd8p67XPbQzCJX47MpReuiCXJAtcjaxpvWpcg9Ege1Nr5Tk3a
{
"commitment": "finalized",
"enableReceivedNotification": false
}
]
}
```
##### {

```
"jsonrpc": "2.0",
"result": 0 ,
"id": 1
}
```
## Notification Format


#### Notication for a Successfully Processed Transaction:

#### Notication for a Successfully Received Transaction Signature:

##### {

```
"jsonrpc": "2.0",
"method": "signatureNotification",
"params": {
"result": {
"context": {
"slot": 5207624
},
"value": {
"err": null
}
},
"subscription": 24006
}
}
```
##### {

```
"jsonrpc": "2.0",
"method": "signatureNotification",
"params": {
"result": {
"context": {
"slot": 5207624
},
"value": "receivedSignature"
},
"subscription": 24006
}
}
```
### Example Responses