# slotsUpdatesSubscribe

#### Subscribe to receive a notication from the validator on a variety of updates on every slot

#### slotsUpdatesSubscribe is marked as unstable in the Solana documentation.

#### As a result, Helius does not support this method.

#### No parameters are required for this method.

#### Returns an <integer> representing the subscription ID. This ID is required to

#### unsubscribe.

#### Request Example:

#### Response Example:

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "slotsUpdatesSubscribe"
}
```
## Parameters

## None

## Result

## Code Sample


#### The notication is an object with the following elds:

- **err** (string | undefined): The error message. Present only if the update type is

#### "dead".

- **parent** (u64 | undefined): The parent slot. Present only if the update type is

#### "createdBank".

- **slot** (u64): The updated slot.
- **stats** (object | undefined): Present only if the update type is "frozen".^

#### Contains the following elds:

## ◦ maxTransactionsPerEntry (u64)

## ◦ numFailedTransactions (u64)

## ◦ numSuccessfulTransactions (u64)

## ◦ numTransactionEntries (u64)

## ◦ timestamp (i64): The Unix timestamp of the update in milliseconds.

- **type** (string): The type of update. Possible values:

## ◦ "firstShredReceived"

## ◦ "completed"

## ◦ "createdBank"

## ◦ "frozen"

## ◦ "dead"

## ◦ "optimisticConfirmation"

## ◦ "root"

##### {

```
"jsonrpc": "2.0",
"result": 0 ,
"id": 1
}
```
## Notification Format


##### {

```
"jsonrpc": "2.0",
"method": "slotsUpdatesNotification",
"params": {
"result": {
"parent": 75 ,
"slot": 76 ,
"timestamp": 1625081266243 ,
"type": "optimisticConfirmation"
},
"subscription": 0
}
}
```
### Example Notification