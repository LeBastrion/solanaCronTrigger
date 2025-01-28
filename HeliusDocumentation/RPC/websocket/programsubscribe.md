# programSubscribe

#### Subscribe to a program to receive notications when the lamports or data for an account

#### owned by the given program changes

#### Pubkey of the program_id, as a base-58 encoded string.

#### Conguration object containing the following elds:

## • commitment (string, optional): Species the desired level of commitment.

## • filters (array, optional): Filters to rene the results. The resultant account must^

#### meet all lter criteria to be included.

## • encoding (string, optional): Species the encoding format for Account data.

#### Values:

## ◦ base58

## ◦ base64

## ◦ base64+zstd

## ◦ jsonParsed

#### Details:

## ◦ base58 encoding is slower.

## ◦ jsonParsed attempts to use program-specic state parsers to return more^

#### human-readable and explicit account state data.

## ◦ If jsonParsed is requested but a parser cannot be found, the encoding falls back^

#### to base64 (detectable when the data eld is type string).

## Parameters

## string (required)

## object (optional)


#### Returns an <integer> representing the subscription ID. This ID is required for

#### unsubscribing.

#### Request Example 1 (Default conguration):

#### Request Example 2 (jsonParsed encoding):

#### Request Example 3 (Filter by data size):

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "programSubscribe",
"params": [
"11111111111111111111111111111111",
{
"encoding": "base64",
"commitment": "finalized"
}
]
}
```
##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "programSubscribe",
"params": [
"11111111111111111111111111111111",
{
"encoding": "jsonParsed"
}
]
}
```
## Result

## Code Samples


#### Response Example:

#### The notication format is a single program account object, structured similarly to the

#### getProgramAccounts RPC HTTP method.

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "programSubscribe",
"params": [
"11111111111111111111111111111111",
{
"encoding": "base64",
"filters": [
{
"dataSize": 80
} ] } ] } {
```
```
"jsonrpc": "2.0",
"result": 24040 ,
"id": 1
}
```
## Notification Format

### Base58 Encoding Example:


##### {

```
"jsonrpc": "2.0",
"method": "programNotification",
"params": {
"result": {
"context": {
"slot": 5208469
},
"value": {
"pubkey": "H4vnBqifaSACnKa7acsxstsY1iV1bvJNxsCY7enrd1hq",
"account": {
"data": [
"11116bv5nS2h3y12kD1yUKeMZvGcKLSjQgX6BeV7u1FrjeJcKfsHPXHRDEHr
"base58"
],
"executable": false,
"lamports": 33594 ,
"owner": "11111111111111111111111111111111",
"rentEpoch": 636 ,
"space": 80
}
}
},
"subscription": 24040
}
}
```
### Parsed-JSON Encoding Example:


##### {

"jsonrpc": "2.0",
"method": "programNotification",
"params": {
"result": {
"context": {
"slot": 5208469
},
"value": {
"pubkey": "H4vnBqifaSACnKa7acsxstsY1iV1bvJNxsCY7enrd1hq",
"account": {
"data": {
"program": "nonce",
"parsed": {
"type": "initialized",
"info": {
"authority": "Bbqg1M4YVVfbhEzwA9SpC9FhsaG83YMTYoR4a8oTDLX
"blockhash": "LUaQTmM7WbMRiATdMMHaRGakPtCkc2GHtH57STKXs6k
"feeCalculator": {
"lamportsPerSignature": 5000
}
}
}
},
"executable": false,
"lamports": 33594 ,
"owner": "11111111111111111111111111111111",
"rentEpoch": 636 ,
"space": 80
}
}
},
"subscription": 24040
}
}