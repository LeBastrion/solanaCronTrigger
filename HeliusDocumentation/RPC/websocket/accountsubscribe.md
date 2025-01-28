# accountSubscribe

#### Subscribe to an account to receive notications when the lamports or data for a given

#### account public key changes

#### Description: Account Pubkey, as a base-58 encoded string.

#### Description: Conguration object containing the following elds:

## • commitment (string, optional):

#### Species the desired level of commitment.

## • encoding (string, optional):

#### Species the encoding format for Account data.

#### Values:

## ◦ base

## ◦ base

## ◦ base64+zstd

## ◦ jsonParsed

#### The result of the subscription will return a <number> which serves as the subscription ID.

#### This ID is required for unsubscribing from the account notications.

## Parameters

## string (required)

## object (optional)

## Details

## Result


#### Request Example:

#### Response Example:

#### The notication format follows the same structure as the getAccountInfo RPC HTTP

#### method.

##### {

```
"jsonrpc": "2.0",
"id": 1 ,
"method": "accountSubscribe",
"params": [
"CM78CPUeXjn8o3yroDHxUtKsZZgoy4GPkPPXfouKNH12",
{
"encoding": "jsonParsed",
"commitment": "finalized"
}
]
}
```
##### {

```
"jsonrpc": "2.0",
"result": 23784 ,
"id": 1
}
```
## Code Sample

## Notification Format

### Base58 Encoding Example:


##### {

```
"jsonrpc": "2.0",
"method": "accountNotification",
"params": {
"result": {
"context": {
"slot": 5199307
},
"value": {
"data": [
"11116bv5nS2h3y12kD1yUKeMZvGcKLSjQgX6BeV7u1FrjeJcKfsHPXHRDEHrBe
"base58"
],
"executable": false,
"lamports": 33594 ,
"owner": "11111111111111111111111111111111",
"rentEpoch": 635 ,
"space": 80
}
},
"subscription": 23784
}
}
```
### Parsed-JSON Encoding Example:


- The base58 encoding format represents raw account data as a string.
- The jsonParsed encoding format provides structured information, parsed into JSON.

##### {

```
"jsonrpc": "2.0",
"method": "accountNotification",
"params": {
"result": {
"context": {
"slot": 5199307
},
"value": {
"data": {
"program": "nonce",
"parsed": {
"type": "initialized",
"info": {
"authority": "Bbqg1M4YVVfbhEzwA9SpC9FhsaG83YMTYoR4a8oTDLX",
"blockhash": "LUaQTmM7WbMRiATdMMHaRGakPtCkc2GHtH57STKXs6k",
"feeCalculator": {
"lamportsPerSignature": 5000
}
}
}
},
"executable": false,
"lamports": 33594 ,
"owner": "11111111111111111111111111111111",
"rentEpoch": 635 ,
"space": 80
}
},
"subscription": 23784
}
}
```
## Notes