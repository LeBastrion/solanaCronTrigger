# Paginating DAS Requests

##### Explores the different pagination mechanisms offered by the DAS API.

##### The DAS API methods will only return up to 1000 records. If you need to retrieve more than

##### 1000 items, you will need to paginate the records. This is achieved by making multiple API

##### calls and crawling through multiple "pages" of data. We support two mechanisms: page-

##### based and keyset pagination.

##### We recommend page-based pagination for beginners. It is the simplest and best

##### way to get started. Keyset pagination is recommended for advanced users who

##### need to query across large (500k+) datasets efciently.

##### With the DAS API, you can sort the data by different elds:

##### 1. id: Sort by the asset ID in binary (default).

##### 2. created: Sort by the date the asset was created.

##### 3. recent_action : Sort by the date the asset was last updated (not recommended).

##### 4. none: Do not sort the data (not recommended).

##### Disabling the sorting will yield the fastest results, but since the data is not ordered, you may

##### have inconsistent results when paginating.

## Introduction

## Sorting Options

## Pagination Options

## Page-based


##### With this method, the user species the page number and the number of items they want

##### per page. To iterate to the next page, increment the page number. This is easy, intuitive, and

##### fast for most use cases.

##### Example

```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const example = async () => {
let page = 1 ;
let items = [];
while (true) {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
grouping: ['collection', '5PA96eCFHJSFPY9SWF
page: page,
limit: 1000 ,
sortBy: { sortBy: 'id', sortDirection: 'asc
},
}),
});
const { result } = await response.json();
if (result.items.length == 0 ) {
console.log('No items remaining');
break;
} else {
console.log(`Processing results from page ${page}`)
items.push(...result.items);
page += 1 ;
}
}
console.log(`Got ${items.length} total items`);
};
example();
```

##### Using pages requires the database to crawl across all items until it reaches the next page.

##### For example, if you ask for page 100 and page size 1000, the database must traverse the

##### rst 1M records before returning your data.

##### For this reason, page-based pagination is not recommended for large datasets. Keyset

##### pagination is far better suited for these types of workloads.

##### With this method, the user denes pages by providing conditions that lter the data set. For

##### example, you can say, "Get me all assets with an ID > X but an ID < Y". The user can traverse

##### the entire dataset by modifying X or Y on each call. We provide two methods of keyset

##### pagination:

##### 1. Cursor-based – Easier to use but less exible.

##### 2. Range-based – More complex but very exible.

##### Keyset pagination is only supported when sorting by id.

##### A DAS query without any pagination parameters will return a cursor. You can give the

##### cursor to the DAS API to continue from where you left off.

##### Example

### Keyset

#### Cursor-based


##### At the time of writing, the cursor will be the last asset ID of the response;

##### however, the cursor design is exible and can support any string.

```
const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`
```
```
const example = async () => {
let items = [];
let cursor;
while (true) {
let params = {
grouping: ['collection', '5PA96eCFHJSFPY9SWFeRJUHrpo
limit: 1000 ,
sortBy: { sortBy: 'id', sortDirection: 'asc' },
} as any;
if (cursor != undefined) {
params.cursor = cursor;
}
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: params,
}),
});
const { result } = await response.json();
if (result.items.length == 0 ) {
console.log('No items remaining');
break;
} else {
console.log(`Processing results for cursor ${cursor}
cursor = result.cursor;
items.push(...result.items);
}
}
console.log(`Got ${items.length} total items`);
};
example();
```

##### To query across a range, you can specify before and/or after. The query is essentially

##### identical to "get me all assets after X but before Y". You can traverse the dataset by

##### updating each call's before or after parameter.

##### Example

#### Range-based


const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const example = async () => {
// Two NFTs from the Tensorian collection.
// The "start" item has a lower asset ID (in binary) than th
// We will traverse in ascending order.
let start = '6CeKtAYX5USSvPCQicwFsvN4jQSHNxQuFrX2bimWrNey';
let end = 'CzTP4fUbdfgKzwE6T94hsYV7NWf1SzuCCsmJ6RP1xsDw';
let sortDirection = 'asc';
let after = start;
let before = end;
let items = [];

while (true) {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
grouping: ['collection', '5PA96eCFHJSFPY9SWF
limit: 1000 ,
after: after,
before: before,
sortBy: { sortBy: 'id', sortDirection: sortD
},
}),
});
const { result } = await response.json();
if (result.items.length == 0 ) {
console.log('No items remaining');
break;
} else {
console.log(`Processing results with (after: ${after
after = result.items[result.items.length - 1 ].id;
items.push(...result.items);
}
}
console.log(`Got ${items.length} total items`);
};
example();


##### Advanced users needing to query large datasets (e.g., entire compressed NFT collections)

##### must use keyset-based pagination for performance reasons. The following example shows

##### how users can parallel query by partitioning the Solana address range and leveraging the

##### before/after parameters. This method is fast, efcient, and safe. If you have any questions

##### or need help, don't hesitate to reach out on Discord!

##### In the example below, we scan the entire Tensorian collection (~10k records). It

##### partitions the Solana address space into 8 ranges and scans those ranges

##### concurrently. You'll notice that this example is far faster than any other.

##### Example

### Parallel Querying with Keysets (advanced)


import base58 from 'bs58';

const url = `https://mainnet.helius-rpc.com/?api-key=<api_key>`

const main = async () => {
let numParitions = 8 ;
let partitons = partitionAddressRange(numParitions);
let promises = [];
for (const [i, partition] of partitons.entries()) {
let [s, e] = partition;
let start = bs58.encode(s);
let end = bs58.encode(e);
console.log(`Parition: ${i}, Start: ${start}, End: ${end

let promise: Promise<number> = new Promise(async (resolv
let current = start;
let totalForPartition = 0 ;
while (true) {
const response = await fetch(url, {
method: 'POST',
headers: {
'Content-Type': 'application/json',
},
body: JSON.stringify({
jsonrpc: '2.0',
id: 'my-id',
method: 'searchAssets',
params: {
grouping: ['collection', '5PA96eCFHJ
limit: 1000 ,
after: current,
before: end,
sortBy: { sortBy: 'id', sortDirectio
},
}),
});
const { result } = await response.json();
totalForPartition += result.items.length;
console.log(`Found ${totalForPartition} total it
if (result.items.length == 0 ) {
break;
} else {
current = result.items[result.items.length -
}
}
resolve(totalForPartition);
});
i h( i )


promises.push(promise);
}
let results = await Promise.all(promises);
let total = results.reduce((a, b) => a + b, 0 );
console.log(`Got ${total} total items`);
};

// Function to convert a BigInt to a byte array
function bigIntToByteArray(bigInt: bigint): Uint8Array {
const bytes = [];
let remainder = bigInt;
while (remainder > 0 n) {
// use 0n for bigint literal
bytes.unshift(Number(remainder & 0xffn));
remainder >>= 8 n;
}
while (bytes.length < 32 ) bytes.unshift( 0 ); // pad with zero
return new Uint8Array(bytes);
}

function partitionAddressRange(numPartitions: number) {
let N = BigInt(numPartitions);

// Largest and smallest Solana addresses in integer form.
// Solana addresses are 32 byte arrays.
const start = 0 n;
const end = 2 n ** 256 n - 1 n;

// Calculate the number of partitions and partition size
const range = end - start;
const partitionSize = range / N;

// Calculate partition ranges
const partitions: Uint8Array[][] = [];
for (let i = 0 n; i < N; i++) {
const s = start + i * partitionSize;
const e = i === N - 1 n? end : s + partitionSize;
partitions.push([bigIntToByteArray(s), bigIntToByteArray
}

return partitions;
}

main();