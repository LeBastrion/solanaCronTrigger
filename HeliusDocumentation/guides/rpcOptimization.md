# RPC Optimization Techniques

#### In-depth technical insights into optimizing Solana RPC usage.

#### Follow these best practices for optimizing Solana transaction sending and conrmation. For

#### a detailed guide, visit Helius Transaction Optimization Guide.

#### Optimize Compute Unit (CU) Usage

## • Simulate CUs Used: Test your transaction to determine CU usage. Example:

## • Set a CU Limit: Add a margin (~10%) to the simulated value:

#### Serialize & Encode Transactions

## • Serialize and Base58 encode your transaction for APIs:

#### Set Priority Fees

## • Get Fee Estimate: Fetch a recommended priority fee from Helius:

## • Apply the Fee:

#### Send & Conrm Transactions

```
const rpcResponse = await connection.simulateTransaction(testTransacti
const unitsConsumed = rpcResponse.value.unitsConsumed;
```
```
const computeUnitIx = ComputeBudgetProgram.setComputeUnitLimit({ units
instructions.push(computeUnitIx);
```
```
const serializedTx = testTransaction.serialize();
const encodedTx = bs58.encode(serializedTx);
```
```
const response = await fetch(HeliusURL, { method: "POST", body: JSON.s
const priorityFee = (await response.json()).result.priorityFeeEstimate
```
```
const computeBudgetIx = ComputeBudgetProgram.setComputeUnitPrice({ mic
instructions.push(computeBudgetIx);
```
## Transaction Optimization Patterns


- Assemble, serialize, and send your transaction using sendTransaction or

#### sendRawTransaction.

- **Tip:** Set skipPreflight: true to reduce transaction time by ~100ms, but note the^

#### loss of pre-validation.

#### Monitor & Rebroadcast

#### If a transaction isn’t conrmed:

#### 1. Use getSignatureStatuses to check its status.

#### 2. Rebroadcast until the blockhash expires.

#### For a comprehensive breakdown, visit our guide.

#### Key Facts

- **Bundles** : Groups of up to 5 transactions executed sequentially and atomically via Jito.
- **Tips** : Incentives for block builders to execute bundles.
- **Auctions** : Bundles compete via out-of-protocol auctions every 200ms based on tip^

#### amounts.

- **Validators** : Only Jito-Solana client validators (currently >90% of stake) can process^

#### bundles.

- **Prioritization** : Tips, compute efciency, and account locking patterns determine bundle^

#### order.

- **Use Cases** : Ideal for landing transactions at the top of a block.

#### When to Use Jito Tips

- **MEV Opportunities** : Arbitrage trading, liquidation transactions, front-running^

#### protection, specic transaction ordering.

- **Time-Critical DeFi Operations** : Token launches, high-volatility trades, NFT mints.
- **High-Stakes Transactions** : Immediate settlement or time-sensitive interactions.

### When to Use Jito Tips


#### Examples of Jito Usage

#### 1. Arbitrage Trading : A trader identies a price difference between two decentralized

#### exchanges (DEXs). Using Jito tips ensures their arbitrage transaction is processed at the

#### top of the block, securing prot before others can react.

#### 2. NFT Minting : During a high-demand mint, competition is erce. Adding Jito tips

#### guarantees priority placement in the block, increasing the chances of a successful mint.

#### 3. Liquidation Transactions : In lending protocols, liquidations can be time-critical. Jito

#### tips allow the liquidator’s transaction to execute ahead of others, ensuring timely

#### liquidation and prot capture.

#### Best Practices for Jito Tips

- **Use Tips for Priority** : Apply Jito tips only when transaction timing and order are critical.
- **Avoid Overusing Tips** : Routine actions like token transfers or minor interactions^

#### typically don’t benet from Jito tips.

- **Optimize for Efciency** :

## ◦ Assess the urgency and value of the transaction.

## ◦ Ensure compute resources and account locking patterns are optimal to avoid^

#### unnecessary tip spending.

- **Monitor Network Conditions** : High congestion may necessitate higher tips to compete^

#### effectively.

#### Evaluation Checklist Before Using Jito Tips

- Is the transaction time-sensitive?
- Does the transaction require specic ordering in the block?
- Are the accounts being accessed under high contention (hot state)?
- What is the potential ROI compared to the cost of the tip?
- Are current network conditions favorable for using Jito?

## JavaScript/TypeScript Optimization Tips for Solana


#### Lazy Loading

#### Load components only when needed to reduce initial load time:

#### Optimized Loops

#### Use for loops instead of forEach for better performance with large datasets:

#### Use Map or Set for Lookups

#### For frequent lookups, Map and Set are faster than arrays:

#### Prefer const

#### const enables better optimizations than var or let:

#### Manage Memory

#### Clear unused intervals or subscriptions to avoid leaks:

```
if (condition) {
const module = await import("./heavyModule.js");
module.doSomething();
}
```
```
for (let i = 0 ; i < array.length; i++) {
process(array[i]);
}
```
```
const map = new Map([ ["key", "value"] ]);
const value = map.get("key");
```
```
const counter = 0 ;
```
```
const intervalId = setInterval(doSomething, 1000 );
clearInterval(intervalId);
```

#### Batch or Debounce API Calls

#### Minimize redundant RPC calls:

#### Simplify Object Handling

#### Avoid deep cloning of large objects; use shallow copies:

#### Optimize JSON Handling

#### For large payloads, use libraries like json-bigint:

#### Why:

- Better performance and scalability
- Reduced resource usage
- Cleaner, maintainable code

```
let timeoutId;
function debounce(func, delay) {
clearTimeout(timeoutId);
timeoutId = setTimeout(func, delay);
}
debounce(() => connection.getLatestBlockhash(), 300 );
```
```
const newObj = { ...originalObj };
```
```
import JSONbig from "json-bigint";
const parsed = JSONbig.parse(largeJsonString);
```
## Data Transfer Optimizations

### Base64 Is Faster than Base


#### For serialized transaction data on Solana, Base64 is faster and more efcient than Base58.

#### Base64 avoids complex calculations and is widely supported by Solana APIs.

#### Use Base64 Encoding:

#### Why:

- Faster encoding/decoding
- Native support in APIs
- Ideal for performance-critical tasks

#### Instead of:

#### In the above approach, you make one call to fetch the token accounts, then make multiple

#### additional calls—one per token account—to retrieve balances. This approach quickly

#### becomes expensive for wallets with many token accounts (e.g., NFTs or multiple SPL

#### tokens).

#### Use:

```
// Serialize and encode
const serializedTx = testTransaction.serialize();
const encodedTx = encode(serializedTx);
```
```
// Decode when needed
const decodedBytes = decode(encodedTx);
```
```
const accounts = await connection.getTokenAccountsByOwner(owner);
const balances = await Promise.all(
accounts.map(acc => connection.getTokenAccountBalance(acc.pubkey))
);
// ~500ms + (100ms * N accounts)
```
### Efficient Token Balance Lookup


#### By requesting jsonParsed data in a single RPC call, you eliminate the need for separate

#### getTokenAccountBalance calls for each account. This drastically reduces both the round-

#### trip overhead and the total data transferred (from ~2 KB per account to ~200 B).

#### Why:

- **Fewer RPC calls** : Collapses N calls into 1.
- **Less data** : Fetching parsed token data directly avoids redundant information.

#### Instead of:

#### This strategy downloads the entire dataset and lters it on the client side, which can be

#### slow and expensive.

#### Use:

```
const accounts = await connection.getTokenAccountsByOwner(owner, {
encoding: "jsonParsed",
commitment: "confirmed"
});
const balances = accounts.value.map(acc => acc.account.data.parsed.info.t
// ~500ms total, 95% reduction in time for large wallets
```
```
const accounts = await connection.getProgramAccounts(programId);
const filtered = accounts.filter(acc =>
acc.account.data.readUint8( 0 ) === 1
);
// Downloads all account data (~1MB for 1000 accounts)
```
### Smart Program Account Selection


#### Using server-side lters (dataSize and memcmp) and slicing the data signicantly

#### reduces the volume of data your application processes locally.

#### Why:

- **Reduced data transfer** : Server-side ltering avoids downloading unneeded data.
- **Better performance** : Less CPU usage on the client, fewer bytes over the wire.

#### Instead of:

#### Calling getTransaction for each signature quickly adds up to hundreds or thousands of

#### RPC calls.

#### Use:

```
const accounts = await connection.getProgramAccounts(programId, {
filters: [
{ dataSize: 100 }, // exact size match
{ memcmp: { offset: 0 , bytes: "01" }}
],
dataSlice: { offset: 0 , length: 100 }
});
// Downloads only filtered accounts (~100KB for the same dataset)
```
```
const sigs = await connection.getSignaturesForAddress(address, { limit: 1
const txs = await Promise.all(
sigs.map(sig => connection.getTransaction(sig))
);
// ~1s + (200ms * 1000 txs) = ~200s
```
```
const sigs = await connection.getSignaturesForAddress(address, { limit: 1
const txs = await connection.getTransactions(
sigs.map(s => s.signature),
{ maxSupportedTransactionVersion: 0 }
);
// ~2s total, 99% reduction in time
```
### Better Transaction History Search


#### By batching all signatures into a single getTransactions call, you drastically reduce total

#### latency.

#### Why:

- **Fewer round trips** : One request instead of 1000.
- **Server-side optimization** : The RPC node handles bulk processing more efciently than^

#### many small requests.

#### Instead of:

#### A polling approach can waste both bandwidth and compute resources if the account rarely

#### changes.

#### Use:

#### Using WebSockets (onAccountChange) pushes updates to your application in near-real

#### time and eliminates repetitive polling.

#### Why:

```
setInterval(async () => {
const info = await connection.getAccountInfo(pubkey);
}, 1000 );
// 1 RPC call per second, high latency
```
```
const sub = connection.onAccountChange(
pubkey,
(account, context) => {
// Handle real-time updates here
},
"processed",
{ encoding: "base64", dataSlice: { offset: 0 , length: 100 }}
);
// Zero polling calls, 100-200ms latency
```
### Real-Time Account Monitoring


- **Lower latency** : Changes are delivered as they happen, rather than on a xed schedule.
- **Less network overhead** : You only receive data when it changes, rather than every^

#### second.

#### Instead of:

#### Polling for each new block can become costly over time.

#### Use:

#### By subscribing to slot changes, your application gets block data in real time without

#### constant polling.

#### Why:

- **Eliminates polling** : New data is pushed as soon as the RPC node observes a new block.
- **Finer control** : You can decide which transaction details to fetch (signatures, full,^

#### etc.).

```
let slot = await connection.getSlot();
while (true) {
const block = await connection.getBlock(slot);
slot++;
}
// 1 RPC call per block, high latency
```
```
connection.onSlotChange(async (slotInfo) => {
const block = await connection.getBlock(slotInfo.slot, {
maxSupportedTransactionVersion: 0 ,
transactionDetails: "signatures"
});
// Process block data
});
```
### Block Info Streaming


#### Instead of:

#### This approach unnecessarily downloads data for every token account in existence.

#### Use:

#### Why:

- **Targeted queries** : Only fetch accounts for the specied mint.
- **Signicant bandwidth savings** : Up to a 99% reduction in data transfer.

#### Instead of:

```
const accounts = await connection.getProgramAccounts(TOKEN_PROGRAM_ID);
const holders = accounts.filter(acc =>
acc.account.data.parsed.info.mint === mintAddress
);
// Downloads all token accounts (~100MB+)
```
```
const accounts = await connection.getProgramAccounts(TOKEN_PROGRAM_ID, {
filters: [
{ memcmp: { offset: 0 , bytes: mintAddress }},
{ dataSize: 165 } // Token account size
],
encoding: "jsonParsed"
});
// Downloads only relevant accounts (~1MB)
```
## Advanced Query Patterns

### Token Holder Breakdown

### Program State Analysis


#### Filtering locally means downloading a large dataset rst.

#### Use:

#### Why:

- **Reduced data transfer** : Leverage the RPC node to lter by dataSize and memcmp.
- **Faster client processing** : Only download essential elds via dataSlice.

#### Instead of:

#### Fetching block production metrics individually is inefcient.

#### Use:

```
const accounts = await connection.getProgramAccounts(programId);
const states = accounts.filter(acc => acc.account.data.length === STATE_S
// Downloads all accounts
```
```
const accounts = await connection.getProgramAccounts(programId, {
filters: [
{ dataSize: STATE_SIZE },
{ memcmp: { offset: 0 , bytes: STATE_DISCRIMINATOR }}
],
dataSlice: { offset: 8 , length: 32 }
});
// Downloads only state data (~90% reduction)
```
```
const slots = await connection.getBlocks(start, end);
const leaders = await Promise.all(
slots.map(slot => connection.getSlotLeader(slot))
);
// N+1 RPC calls
```
### Validator Performance Check


#### Why:

- **One request** : Retrieves aggregated block production stats in bulk.
- **Fewer network calls** : Lowers overhead and speeds up data processing.

#### Instead of:

#### Re-fetching historical data for every transaction can be slow and memory-intensive.

#### Use:

#### Why:

```
const production = await connection.getBlockProduction({
range: { firstSlot: start, lastSlot: end },
identity: validatorId
});
// Single RPC call with filtered data
```
```
const txs = await connection.getSignaturesForAddress(address);
const states = await Promise.all(
txs.map(async tx => {
const info = await connection.getAccountInfo(address, { slot: tx.slot
return info;
})
);
// N+1 RPC calls, downloads full history
```
```
const changes = await connection.onAccountChange(
address,
() => {
// Handle state changes in real time
},
"confirmed",
{ encoding: "base64", dataSlice: { offset: 0 , length: 32 }}
);
// Real-time updates with minimal data
```
### Account Updates Analysis


- **Streaming approach** : Capture state changes as they occur.
- **Less data** : Only fetch slices of the account if you need partial info.

#### Instead of:

#### Processing thousands of accounts at once can lead to out-of-memory errors.

#### Use:

#### Chunking ensures that you only load manageable subsets of data at a time.

#### Why:

- **Prevents OOM** : Keeps memory usage in check by processing smaller batches.

```
const accounts = await connection.getProgramAccounts(programId);
const processed = accounts.map(acc => processAccount(acc));
// Loads all data into memory
```
```
const accounts = await connection.getProgramAccounts(programId, {
dataSlice: { offset: 0 , length: 32 },
filters: [
{ dataSize: ACCOUNT_SIZE }
]
});
```
```
const chunks = chunk(accounts, 100 );
for (const chunk of chunks) {
const details = await connection.getMultipleAccountsInfo(
chunk.map(acc => acc.pubkey)
);
// Process chunk
}
```
## Memory Optimization Patterns

### Processing Large Data


- **Improved throughput** : Parallel processing of chunks can speed up overall operation.

#### Instead of:

#### Sequentially processing a large number of transactions can be slow.

#### Use:

#### Why:

- **Faster** : Batching transactions reduces overhead.
- **Controlled memory usage** : Large sets are split into smaller requests.

```
const txs = await connection.getSignaturesForAddress(address);
const graph = new Map();
for (const tx of txs) {
const details = await connection.getTransaction(tx.signature);
graph.set(tx.signature, details);
}
// Sequential processing, high memory usage
```
```
const txs = await connection.getSignaturesForAddress(address);
const graph = new Map();
const chunks = chunk(txs, 25 );
```
```
for (const batch of chunks) {
const details = await connection.getTransactions(
batch.map(tx => tx.signature),
{ maxSupportedTransactionVersion: 0 }
);
// Process each transaction in the batch
batch.forEach((tx, i) => {
if (details[i]) {
graph.set(tx.signature, details[i]);
}
});
}
// Parallel processing with chunking, 60% less memory
```
### Transaction Graph Analysis


#### Instead of:

#### Holding all buffer data in memory can become very large, very quickly.

#### Use:

#### Why:

- **Lazy loading** : Only fetch buffer contents when needed.
- **90% reduction in initial memory usage** : You avoid loading all buffers at once.

```
const accounts = await connection.getProgramAccounts(BUFFER_PROGRAM_ID);
const buffers = new Map();
accounts.forEach(acc => {
buffers.set(acc.pubkey, acc.account.data);
});
// Loads all buffers into memory
```
```
const accounts = await connection.getProgramAccounts(BUFFER_PROGRAM_ID, {
filters: [
{ dataSize: 32 }, // Header only
{ memcmp: { offset: 0 , bytes: BUFFER_SEED }}
]
});
const bufferMap = new Map();
accounts.forEach(acc => {
bufferMap.set(acc.pubkey, null);
});
```
```
// Load buffers on-demand
const getBuffer = async (key) => {
if (!bufferMap.has(key)) return null;
if (!bufferMap.get(key)) {
const info = await connection.getAccountInfo(key);
bufferMap.set(key, info.data);
}
return bufferMap.get(key);
};
```
### Managing Program Buffers


#### Instead of:

#### Fetching all token accounts globally is often unnecessary.

#### Use:

#### Why:

- **Targeted queries** : Only query token accounts for known owners.

```
const accounts = await connection.getProgramAccounts(TOKEN_PROGRAM_ID);
const balances = new Map();
accounts.forEach(acc => {
const { mint, owner, amount } = acc.account.data.parsed;
if (!balances.has(owner)) balances.set(owner, new Map());
balances.get(owner).set(mint, amount);
});
// Processes all token accounts
```
```
const owners = new Set(/* known owners */);
const balances = new Map();
```
```
for (const owner of owners) {
const accounts = await connection.getTokenAccountsByOwner(
owner,
{ programId: TOKEN_PROGRAM_ID },
"confirmed"
);
```
```
balances.set(
owner,
new Map(
accounts.value.map(acc => [
acc.account.data.parsed.info.mint,
acc.account.data.parsed.info.tokenAmount.amount
])
)
);
}
```
### Token Account Reconciliation


- **Less memory usage** : An 80% reduction compared to pulling every token account on^

#### chain.

#### Instead of:

#### If you have a large number of compression trees, this can be a bottleneck.

#### Use:

```
const trees = await connection.getProgramAccounts(SPL_ACCOUNT_COMPRESSION
const leaves = await Promise.all(
trees.map(async tree => {
const canopy = await getConcurrentMerkleTreeAccountInfo(tree.pubkey);
return getLeafAssetId(canopy, 0 , tree.pubkey);
})
);
// Processes all trees sequentially
```
```
const trees = await connection.getProgramAccounts(SPL_ACCOUNT_COMPRESSION
filters: [
{ memcmp: { offset: 0 , bytes: TREE_DISCRIMINATOR }},
{ dataSize: CONCURRENT_MERKLE_TREE_HEADER_SIZE }
]
});
```
```
const leafPromises = trees.map(tree => {
const start = Date.now();
return getConcurrentMerkleTreeAccountInfo(tree.pubkey)
.then(canopy => {
if (Date.now() - start > 1000 ) return null; // Timeout for slow tre
return getLeafAssetId(canopy, 0 , tree.pubkey);
})
.catch(() => null);
});
```
```
const leaves = await Promise.all(leafPromises);
const validLeaves = leaves.filter(Boolean);
// Parallel processing with timeouts, 70% faster
```
### Compressed NFT Indexing


#### Why:

- **Parallel execution** : Processes multiple trees simultaneously.
- **Timeouts** : Prevents tasks from blocking the entire ow.

#### Instead of:

#### A rigid retry pattern can fail in scenarios with variable network conditions or rate limits.

#### Use:

```
const getWithRetry = async (signature) => {
for (let i = 0 ; i < 3 ; i++) {
try {
return await connection.getTransaction(signature);
} catch (e) {
await sleep( 1000 );
}
}
};
// Fixed retry pattern
```
## Network Optimization Patterns

### Smart Retry Logic


#### Why:

- **Adaptive backoff** : Dynamically extends wait time for repeated failures.
- **Handles rate limits** : Checks for specic errors (e.g., "429 Too Many Requests").

#### Instead of:

```
const getWithSmartRetry = async (signature) => {
const backoff = new ExponentialBackoff({
min: 100 ,
max: 5000 ,
factor: 2 ,
jitter: 0.
});
```
```
while (true) {
try {
const tx = await connection.getTransaction(signature);
if (!tx) {
if (backoff.attempts > 5 ) throw new Error("Transaction not found"
await backoff.delay();
continue;
}
return tx;
} catch (e) {
if (e.message.includes("429")) {
await backoff.delay();
continue;
}
throw e;
}
}
};
// Smart retries with 40% better success rate
```
```
const sub1 = connection.onAccountChange(acc1, () => {});
const sub2 = connection.onAccountChange(acc2, () => {});
const sub3 = connection.onAccountChange(acc3, () => {});
// Multiple WebSocket connections
```
### WebSocket Optimization


#### Too many individual subscriptions can strain the WebSocket connection.

#### Use:

#### Why:

- **Fewer connections** : Consolidates multiple subscriptions into one.
- **Lower overhead** : Reduces the complexity of maintaining many WebSocket channels.

```
class BatchSubscription {
private subs = new Map();
private batch: string[] = [];
private timer: NodeJS.Timeout | null = null;
```
```
constructor(private connection: Connection) {}
```
```
subscribe(address: string, callback: Function) {
this.batch.push(address);
this.subs.set(address, callback);
```
```
if (this.timer) clearTimeout(this.timer);
this.timer = setTimeout(() => this.flush(), 100 );
}
```
```
private async flush() {
const addresses = [...this.batch];
this.batch = [];
```
```
// Hypothetical batch subscription method
const sub = this.connection.onAccountChange(
addresses,
(account, context) => {
const callback = this.subs.get(context.key);
if (callback) callback(account, context);
}
);
}
}
```
```
const batchSub = new BatchSubscription(connection);
batchSub.subscribe(acc1, () => {});
batchSub.subscribe(acc2, () => {});
batchSub.subscribe(acc3, () => {});
// Single WebSocket connection, 70% less overhead
```

#### Instead of:

#### Receiving updates for every account in a program can ood your application with unneeded

#### data.

#### Use:

#### Why:

- **Reduced bandwidth** : Filter out accounts you don’t care about.
- **Less processing** : Limits the data you must handle on each event.

```
connection.onProgramAccountChange(programId, () => {});
// Receives all account changes
```
```
const filters = [
{ dataSize: 1024 },
{ memcmp: { offset: 0 , bytes: ACCOUNT_DISCRIMINATOR }}
];
```
```
connection.onProgramAccountChange(
programId,
() => {
// Handle relevant changes
},
"confirmed",
{
filters,
encoding: "base64",
dataSlice: { offset: 0 , length: 100 }
}
);
// Receives only relevant changes, 90% less data
```
### Custom Data Feeds

### Transaction Monitoring


#### Instead of:

#### Polling for signatures can lead to duplicate checks and wasted requests.

#### Use:

#### Why:

- **Push-based** : Gets new signatures immediately via logs.
- **Less duplication** : Eliminates repeated polling intervals.

```
setInterval(async () => {
const sigs = await connection.getSignaturesForAddress(address);
const newSigs = sigs.filter(sig => !processed.has(sig));
for (const sig of newSigs) {
const tx = await connection.getTransaction(sig);
// Process tx
}
}, 1000 );
// Polling with high overhead
```
```
const ws = new WebSocket(wsEndpoint);
const sub = {
jsonrpc: "2.0",
id: 1 ,
method: "logsSubscribe",
params: [
{ mentions: [address] },
{ commitment: "confirmed" }
]
};
```
```
ws.on("open", () => ws.send(JSON.stringify(sub)));
ws.on("message", async (data) => {
const msg = JSON.parse(data);
if (!msg.params?.result?.value?.signature) return;
```
```
const sig = msg.params.result.value.signature;
const tx = await connection.getTransaction(sig);
// Process tx
});
// Real-time updates with 80% less overhead
```

#### 1. Use Appropriate Commitment Levels

- processed for WebSocket subscriptions.
- confirmed for general queries.
- finalized only when absolute certainty is required.

#### 2. Implement Robust Error Handling

- Use exponential backoff for retries.
- Handle rate limit (HTTP 429) errors gracefully.
- Validate responses to avoid processing incomplete or corrupted data.

#### 3. Optimize Data Transfer

- Utilize dataSlice wherever possible to limit payload size.
- Leverage server-side ltering (memcmp and dataSize).
- Choose the most efcient encoding option (base64, jsonParsed, etc.).

#### 4. Manage Resources

- Batch operations to reduce overhead.
- Cache results to avoid redundant lookups.
- Bundle multiple instructions into a single transaction where applicable.

#### 5. Monitor Performance

- Track RPC usage and latency.
- Monitor memory consumption for large dataset processing.
- Log and analyze errors to detect bottlenecks.

#### 6. Circuit Breakers & Throttling

- Employ circuit breakers to halt or pause operations under excessive error rates.
- Throttle requests to respect rate limits and ensure stable performance.

#### By following these techniques and best practices, you can signicantly reduce operational

#### costs, enhance real-time responsiveness, and scale more effectively on Solana.

## Best Practices


