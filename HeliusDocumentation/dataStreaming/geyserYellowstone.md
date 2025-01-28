# Geyser (Yellowstone)

### Highly congurable real-time data streams.

### Geyser or gRPC streams provide the fastest and most efcient way to stream Solana data

### directly to your backend. With gRPC, you can subscribe to blocks, slots, transactions, and

### account updates. It is highly congurable. You can lter or limit each subscription. It allows

### the client-server to create new subscriptions or cancel existing ones immediately.

### To learn more, please read the examples provided in the source repo.

### gRPC is only available for dedicated nodes. You can provision a dedicated node

### directly from the Dashboard. To learn more, please visit Dedicated Nodes.

### In the subscribe request, you need to include the following:

### commitment: Species the commitment level, which can be processed , conrmed , or

### nalized.

### accounts_data_slice: An array of objects { offset: uint64, length: uint64 }

### that allows you to receive only the required data slices from accounts.

### ping: An optional boolean. Some cloud providers (e.g., Cloudare) close idle streams. To

### keep the connection alive, set this to true. The server will respond with a Pong message

### every 15 seconds, avoiding the need to resend lters.

### Next, you’ll need to specify the lters for the data you want to subscribe to, such as

### accounts, blocks, slots, or transactions.

## What are gRPC streams?

## Subscribe Request


### filter_by_commitment — By default, slots are sent for all commitment levels.

### With this lter, you can choose to receive only the selected commitment level.

### account : Matches any public key from the provided array.

### owner : The account owner's public key. Matches any public key from the

### provided array.

### filters : Similar to the lters in getProgramAccounts. This is an array of

### dataSize and/or Memcmp lters. Supported encoding includes bytes,

### base58, and base64.

### If all elds are empty, all accounts are broadcasted. Otherwise:

- Fields operate as a logical **AND**.
- Values within arrays act as a logical **OR** (except within lters, which operate^

### as a logical AND )

### vote: Enable or disable the broadcast of vote transactions.

### failed : Enable or disable the broadcast of failed transactions.

### signature: Broadcast only transactions matching the specied signature.

### account_include: Filter transactions that involve any account from the

### provided list.

### account_exclude: Exclude transactions that involve any account from the

### provided list (opposite of account_include).

### account_required: Filter transactions that involve all accounts from the

### provided list (all accounts must be used).

### Slots

### Accounts

### Transaction


### If all elds are left empty, all transactions are broadcasted. Otherwise:

- Fields operate as a logical **AND**.
- Values within arrays are treated as a logical **OR**.

### account_include: Filters transactions and accounts that involve any account

### from the provided list.

### include_transactions: Includes all transactions in the broadcast.

### include_accounts: Includes all account updates in the broadcast.

### include_entries: Includes all entries in the broadcast.

### This functions similarly to Blocks but excludes transactions, accounts, and

### entries. Currently, no lters are available for block metadata—all messages are

### broadcasted by default.

### Currently, there are no lters available for entries; all entries are broadcasted.

### The following code examples subscribe to slot updates and include a ping to the

### gRPC server to keep the connection alive.

### Block

### Blocks Meta

### Entries

### Typescript Slot Subscription

## Examples


import Client, {
CommitmentLevel,
SubscribeRequest,
SubscribeRequestFilterAccountsFilter,
} from "@triton-one/yellowstone-grpc";

const GRPC_URL = "add-geyser-url";
const X_TOKEN = "add-x-token";
const PING_INTERVAL_MS = 30_000; // 30s

async function main() {
// Open connection.
const client = new Client(GRPC_URL, X_TOKEN, {
"grpc.max_receive_message_length": 64 * 1024 * 1024 , // 64Mi
});

// Subscribe for events
const stream = await client.subscribe();

// Create `error` / `end` handler
const streamClosed = new Promise<void>((resolve, reject) => {
stream.on("error", (error) => {
reject(error);
stream.end();
});
stream.on("end", () => {
resolve();
});
stream.on("close", () => {
resolve();
});
});

// Handle updates
stream.on("data", (data) => {
let ts = new Date();
if (data.filters[ 0 ] == "slot") {
console.log(
`${ts.toUTCString()}: Received slot update: ${data.slot
);
} else if (data.pong) {
console.log(`${ts.toUTCString()}: Processed ping response
}
});

// Example subscribe request.
// Listen to all slot updates.
const slotRequest: SubscribeRequest = {


const slotRequest: SubscribeRequest {
slots: {
slot: { filterByCommitment: true },
},
commitment: CommitmentLevel.CONFIRMED,

// Required, but unused arguments
accounts: {},
accountsDataSlice: [],
transactions: {},
transactionsStatus: {},
blocks: {},
blocksMeta: {},
entry: {},
};

// Send subscribe request
await new Promise<void>((resolve, reject) => {
stream.write(slotRequest, (err) => {
if (err === null || err === undefined) {
resolve();
} else {
reject(err);
}
});
}).catch((reason) => {
console.error(reason);
throw reason;
});

// Send pings every 5s to keep the connection open
const pingRequest: SubscribeRequest = {
ping: { id: 1 },
// Required, but unused arguments
accounts: {},
accountsDataSlice: [],
transactions: {},
transactionsStatus: {},
blocks: {},
blocksMeta: {},
entry: {},
slots: {},
};
setInterval(async () => {
await new Promise<void>((resolve, reject) => {
stream.write(pingRequest, (err) => {
if (err === null || err === undefined) {
resolve();
} else {


```
reject(err);
}
});
}).catch((reason) => {
console.error(reason);
throw reason;
});
}, PING_INTERVAL_MS);
```
```
await streamClosed;
}
```
```
main();
```
### TypeScript Transaction Subscription with Parsed Data


import Client, {
CommitmentLevel,
SubscribeRequest,
SubscribeRequestFilterAccountsFilter
} from "@triton-one/yellowstone-grpc";
import bs58 from 'bs58';

const GRPC_URL = "add-geyser-url";
const X_TOKEN = "add-x-token";
const PING_INTERVAL_MS = 30_000; // 30s

// Add this utility function to process the transaction object
function convertBuffers(obj: any): any {
if (obj === null || obj === undefined) {
return obj;
}

// Handle Buffer objects
if (obj.type === 'Buffer' && Array.isArray(obj.data)) {
return bs58.encode(new Uint8Array(obj.data));
}

// Handle arrays
if (Array.isArray(obj)) {
return obj.map(item => convertBuffers(item));
}

// Handle objects
if (typeof obj === 'object') {
// Handle Uint8Array directly
if (obj instanceof Uint8Array) {
return bs58.encode(obj);
}

const converted: any = {};
for (const [key, value] of Object.entries(obj)) {
// Skip certain keys that shouldn't be converted
if (key === 'uiAmount' || key === 'decimals' || key === 'u
converted[key] = value;
} else {
converted[key] = convertBuffers(value);
}
}
return converted;
}

return obj;
}


#### }

async function main() {
// Open connection.
const client = new Client(GRPC_URL, X_TOKEN, {
"grpc.max_receive_message_length": 1024 * 1024 * 1024 , // 64
});

// Subscribe for events
const stream = await client.subscribe();

// Create `error` / `end` handler
const streamClosed = new Promise<void>((resolve, reject) => {
stream.on("error", (error) => {
reject(error);
stream.end();
});
stream.on("end", () => {
resolve();
});
stream.on("close", () => {
resolve();
});
});

// Handle updates
stream.on("data", (data) => {
let ts = new Date();
if (data) {

if(data.transaction) {
const tx = data.transaction;
// Convert the entire transaction object
const convertedTx = convertBuffers(tx);
// If you want to see the entire converted transaction:
console.log(`${ts.toUTCString()}: Received update: ${JSO
}

else {
console.log(`${ts.toUTCString()}: Received update: ${dat
}
stream.end();
} else if (data.pong) {
console.log(`${ts.toUTCString()}: Processed ping response
}
});

// Example subscribe request.
const request: SubscribeRequest = {


### It's possible to add limits for lters in the cong. If filters eld is omitted,

### then lters don't have any limits.

```
commitment: CommitmentLevel.PROCESSED,
accountsDataSlice: [],
ping: undefined,
transactions: {
client: {
vote: false,
failed: false,
accountInclude: [
"675kPX9MHTjS2zt1qfr1NYHuzeLXfQM9H24wFSUt1Mp8"
],
accountExclude: [],
accountRequired: [],
},
},
// unused arguments
accounts: {},
slots: {},
transactionsStatus: {},
entry: {},
blocks: {},
blocksMeta: {},
};
```
```
// Send subscribe request
await new Promise<void>((resolve, reject) => {
stream.write(request, (err: any) => {
if (err === null || err === undefined) {
resolve();
} else {
reject(err);
}
});
}).catch((reason) => {
console.error(reason);
throw reason;
});
```
```
// Send pings every 5s to keep the connection open
const pingRequest: SubscribeRequest = {
// Required, but unused arguments
accounts: {},
accountsDataSlice: [],
transactions: {},
blocks: {},
blocksMeta: {},
slots: {},
transactionsStatus: {},
entry: {},
```
### Subscribe Requests with all lters

```
"grpc": {
"filters": {
"accounts": {
"max": 1 ,
"any": false,
"account_max": 10 ,
"account_reject": ["TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss
"owner_max": 10 ,
"owner_reject": ["11111111111111111111111111111111"]
},
"slots": {
"max": 1
},
"transactions": {
"max": 1 ,
"any": false,
"account_include_max": 10 ,
"account_include_reject": ["TokenkegQfeZyiNwAJbNbGKPFXC
"account_exclude_max": 10 ,
"account_required_max": 10
},
"blocks": {
"max": 1 ,
"account_include_max": 10 ,
"account_include_any": false,
"account_include_reject": ["TokenkegQfeZyiNwAJbNbGKPFXC
"include_transactions": true,
"include_accounts" : false,
"include_entries" : false
},
"blocks_meta": {
"max": 1
},
"entry": {
"max": 1
}
}
}
```

### You can also refer to the examples in Rust and Go.

### gRPC is typically accessed behind a load-balancer or proxy, terminating an

### inactive connection after 10 minutes. The best solution is to ping the gRPC every

### N seconds or minutes.

#### };

```
setInterval(async () => {
await new Promise<void>((resolve, reject) => {
stream.write(pingRequest, (err: null | undefined) => {
if (err === null || err === undefined) {
resolve();
} else {
reject(err);
}
});
}).catch((reason) => {
console.error(reason);
throw reason;
});
}, PING_INTERVAL_MS);
```
```
await streamClosed;
}
```
```
main();
```

