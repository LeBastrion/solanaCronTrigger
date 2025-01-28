# slotSubscribe

#### Subscribe to receive notication anytime a slot is processed by the validator

#### No parameters are required for this method.

#### Returns an <integer> representing the subscription ID. This ID is required to

#### unsubscribe.

#### Request Example:

#### Response Example:

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "slotSubscribe"
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


#### The notication is an object with the following elds:

- **parent** (u64): The parent slot.
- **root** (u64): The current root slot.
- **slot** (u64): The newly set slot value.

##### {

```
"jsonrpc": "2.0",
"method": "slotNotification",
"params": {
"result": {
"parent": 75 ,
"root": 44 ,
"slot": 76
},
"subscription": 0
}
}
```
## Notification Format

### Example Notification