# blockUnsubscribe

#### Unsubscribe from block notications

#### Description: Subscription ID to cancel.

#### Returns a <bool> indicating whether the unsubscribe operation was successful:

## • true : Unsubscribe operation succeeded.

## • false : Unsubscribe operation failed.

#### Request Example:

#### Response Example:

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "blockUnsubscribe",
"params": [ 0 ]
}
```
## Parameters

## integer (required)

## Result

## Code Sample


##### {

"jsonrpc": "2.0",
"result": true,
"id": 1
}