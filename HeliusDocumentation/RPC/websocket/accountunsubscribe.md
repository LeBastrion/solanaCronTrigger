# accountUnsubscribe

#### Unsubscribe from account change notications

#### Description: ID of the account subscription to cancel.

#### The result will return a <bool> indicating the success of the unsubscribe operation.

## • true : Unsubscribe operation succeeded.

## • false : Unsubscribe operation failed.

#### Request Example:

#### Response Example:

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "accountUnsubscribe",
"params": [ 0 ]
}
```
## Parameters

## number (required)

## Result

## Code Sample


- The id provided in the parameters should match the subscription ID obtained during^

#### the initial subscription process.

- The response will conrm if the subscription was successfully canceled.

##### {

```
"jsonrpc": "2.0",
"result": true,
"id": 1
}
```
## Notes