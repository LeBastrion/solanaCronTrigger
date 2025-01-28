# getClusterNodes

#### Returns information about all the nodes participating in the cluster

## getClusterNodes

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
Example: "getClusterNodes"
```
```
getClusterNodes
```
#### Response^200

```
Successfully retrieved cluster node information.
```
#### Body application/json

#### jsonrpc enum

```
The JSON-RPC protocol version.
Example: "2.0"
```
```
2.0
```
#### id string

```
Identi er matching the request.
Example: "1"
```
#### result array of object


List of nodes in the cluster with their details.

#### pubkey string

```
Node public key as a base-58 encoded string.
Example: "9QzsJf7LPLj8GkXbYT3LFDKqsj2hHG7TA3xinJHu8epQ"
```
#### gossip nullable string

```
Gossip network address for the node.
Example: "10.239.6.48:8001"
```
#### tpu nullable string

```
TPU network address for the node.
Example: "10.239.6.48:8856"
```
#### rpc nullable string

```
JSON RPC network address for the node, or null if not enabled.
Example: "10.239.6.48:8899"
```
#### version nullable string

```
Software version of the node.
Example: "1.0.0 c375ce1f"
```
#### featureSet nullable integer

```
Unique identi er of the node's feature set.
```
#### shredVersion nullable integer

```
Shred version the node has been congured to use.
```
#### Request JavaScript


```
Test it
```
#### Response^200

```
const response = await fetch('https://mainnet.helius-rpc.com/?api-key=<ap
method: 'POST',
headers: {
"Content-Type": "application/json"
},
body: JSON.stringify({
"jsonrpc": "2.0",
"id": "1",
"method": "getClusterNodes"
}),
});
const data = await response.json();
```
##### {

```
"jsonrpc": "2.0",
"id": "1"
```