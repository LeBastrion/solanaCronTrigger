# getFeeForMessage

#### Get the fee the network will charge for a particular Message

## getFeeForMessage

```
POST https://mainnet.helius-rpc.com/?api-key=<api-key>
```
#### Body application/json

#### jsonrpc* enum

```
The JSON-RPC protocol version.
Example: "2.0"
```
```
2.0
```
#### id* string

```
A unique identi er for the request.
Example: "1"
```
#### method* enum

```
The name of the RPC method to invoke.
Example: "getFeeForMessage"
```
```
getFeeForMessage
```
#### params* array of one of

```
Parameters for the method.
```
#### items one of string

#### string

```
Base-64 encoded message (required).
Example:
"AQABAgIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEBAQAA"
```
#### Response^200

```
Successfully retrieved the fee for the given message.
```

#### Body application/json

#### jsonrpc enum

The JSON-RPC protocol version.

Example: "2.0"

```
2.0
```
#### id string

Identi er matching the request.

Example: "1"

#### result object

Fee information for the message.

#### context object

```
Context of the response.
```
#### slot integer

```
The slot at which the fee was calculated.
Example: 5068
```
#### value nullable integer

```
Fee corresponding to the message at the specied blockhash.
Example: 5000
```
#### Request JavaScript


const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": "1",
"method": "getFeeForMessage",
"params": [
"AQABAgIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAA
]
}),
});
const data = await response.json();