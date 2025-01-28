# rootSubscribe

#### Subscribe to receive notication anytime a new root is set by the validator.

#### No parameters are required for this method.

#### Returns an integer representing the subscription ID. This ID is required to unsubscribe.

#### Request Example:

#### Response Example:

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "rootSubscribe"
}
```
##### {

```
"jsonrpc": "2.0",
"result": 0 ,
"id": 1
}
```
## Parameters

## None

## Result

## Code Sample


#### The notication provides the latest root slot number.

#### Example Notication:

##### {

```
"jsonrpc": "2.0",
"method": "rootNotification",
"params": {
"result": 42 ,
"subscription": 0
}
}
```
## Notification Format