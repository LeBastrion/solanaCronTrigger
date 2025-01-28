# Websocket

#### Stream data directly to your applications with our websocket integration.

#### Websockets allow for two-way communication between a client and a server. Unlike

#### traditional request-response models, Websockets keep a persistent connection open,

#### enabling real-time data exchange. This is perfect for applications that require instant

#### updates, such as chat apps, online games and marketplaces.

#### Helius supports all stable Solana Websockets.

#### You can use these with your Helius WSS URL:

## • Mainnet –^ wss://mainnet.helius-rpc.com

## • Devnet – wss://devnet.helius-rpc.com

#### WebSocket methods marked as "unstable" in Solana's documentation, such as

#### blockSubscribe, slotsUpdatesSubscribe and voteSubscribe are not

#### supported. This could be enabled for dedicated nodes.

#### After connecting to the websocket:

## • Submit subscription requests to the websocket using the methods.

## • Multiple subscriptions may be active at once.

## • Many subscriptions take the optional commitment parameter, dening how nalized a^

#### change should be to trigger a notication. For subscriptions, if commitment is

#### unspecied, the default value is finalized.

## Standard Websockets

## Javascript Examples


#### Program Susbcribe


const WebSocket = require('ws');

// Create a WebSocket connection
const ws = new WebSocket('wss://mainnet.helius-rpc.com/?api-key=

// Function to send a request to the WebSocket server
function sendRequest(ws) {
const request = {
"jsonrpc": "2.0",
"id": 1 ,
"method": "programSubscribe",
"params": [
"6EF8rrecthR5Dkzon8Nwu78hRvfCKubJ14M5uBEwF6P",
{
"encoding": "jsonParsed"
}
]
};
ws.send(JSON.stringify(request));
}

// Function to send a ping to the WebSocket server
function startPing(ws) {
setInterval(() => {
if (ws.readyState === WebSocket.OPEN) {
ws.ping();
console.log('Ping sent');
}
}, 30000 ); // Ping every 30 seconds
}

// Define WebSocket event handlers

ws.on('open', function open() {
console.log('WebSocket is open');
sendRequest(ws); // Send a request once the WebSocket is ope
startPing(ws); // Start sending pings
});

ws.on('message', function incoming(data) {
const messageStr = data.toString('utf8');
try {
const messageObj = JSON.parse(messageStr);
console.log('Received:', messageObj);
} catch (e) {
console.error('Failed to parse JSON:', e);
}
});


#### This subscription is for a single notication. The server automatically cancels it

#### after sending the signatureNotification via the RPC.

##### });

```
ws.on('error', function error(err) {
console.error('WebSocket error:', err);
});
```
```
ws.on('close', function close() {
console.log('WebSocket is closed');
});
```
#### Signature Subscribe


const WebSocket = require('ws');

// Create a WebSocket connection
const ws = new WebSocket('wss://mainnet.helius-rpc.com/?api-key=

// Function to send a request to the WebSocket server
function sendRequest(ws) {
const request = {
"jsonrpc": "2.0",
"id": 1 ,
"method": "signatureSubscribe",
"params": [
"2EBVM6cB8vAAD93Ktr6Vd8p67XPbQzCJX47MpReuiCXJAtcjaxpvW
{
"commitment": "finalized",
"enableReceivedNotification": false
}
]
};
ws.send(JSON.stringify(request));
}

// Function to send a ping to the WebSocket server
function startPing(ws) {
setInterval(() => {
if (ws.readyState === WebSocket.OPEN) {
ws.ping();
console.log('Ping sent');
}
}, 30000 ); // Ping every 30 seconds
}

// Define WebSocket event handlers

ws.on('open', function open() {
console.log('WebSocket is open');
sendRequest(ws); // Send a request once the WebSocket is ope
startPing(ws); // Start sending pings
});

ws.on('message', function incoming(data) {
const messageStr = data.toString('utf8');
try {
const messageObj = JSON.parse(messageStr);
console.log('Received:', messageObj);
} catch (e) {
console.error('Failed to parse JSON:', e);
}


##### }

##### });

ws.on('error', function error(err) {
console.error('WebSocket error:', err);
});

ws.on('close', function close() {
console.log('WebSocket is closed');
});