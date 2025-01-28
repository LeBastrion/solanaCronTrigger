# Sending Transactions on Solana

##### Optimize your transactions to minimize conrmation latency and maximize delivery rates.

##### Helius' staked connections guarantee 100% transaction delivery with minimal

##### conrmation times.

##### We recommend the following best practices to help you land transactions:

## • Use Staked Connections available with standard paid plans.

## • Use commitment "processed" or "conrmed" to fetch the latest blockhash^

## • Add priority fees and calculate them dynamically

## • Optimize compute unit (CU) usage

## • Set maxRetries to 0 and implement robust retry logic

## • Send with skipPreflight set to true

##### Want to go deeper? We cover all fundamentals in this blog post.

##### We recommend the following optimizations for latency-sensitive traders. You must already

##### be applying the best practices for sending transactions mentioned above.

##### 1. Send transactions from Eastern US or Western Europe.

##### a. Choose Frankfurt or Pittsburg if you want to co-locate with Helius transaction-

##### sending servers.

##### b. Avoid sending regions far away from the validator network (e.g. LATAM or South

##### Africa).

##### 2. Warm the Helius regional caches to minimize tail latency.

## Summary

## Recommended Optimizations for Traders


##### a. Send a getHealth call every second using the same endpoint & API key you use

##### for sending transactions.

##### b. Only one warming thread is required per region. Any more will have zero benet.

##### The benets will only be noticeable to experienced traders. We recommend the

##### Sending Smart Transactions section instead for app developers.

##### Staked Connections help you land transactions faster with an increased land rate. Helius

##### provides two methods to access staked connections with any standard paid plan (not

##### available on Dedicated Nodes).

##### 1. Shared Staked Endpoint (default)

- Requirements:

### ◦ Priority fees meet or exceed the recommended value provided by the Priority^

##### Fee API

### ◦ Set maxRetries to 0

- Endpoint: https://mainnet.helius-rpc.com/?api-key=xxx
- Cost: 1 credit per request
- Tips:

### ◦ Check if you're getting staked connections by logging the X-Helius-

##### ConnectionType response header. The value will be regular or staked.

##### 2. Dedicated Staked Endpoint

- Recommended for top traders or teams who want guaranteed access to staked^

##### connections, even during market congestion

- Transactions will be sent over staked connections via an optimized network (Asia,^

##### Europe, and North America), minimizing latency and conrmation times.

- Endpoint: https://staked.helius-rpc.com?api-key=xxx
- Cost: 50 credits per request or a monthly subscription add-on (starts at^

##### $4,000/month, contact our sales team for access).

## Staked Connections


##### Usage metrics display staked endpoint calls as sendTransactionWithStake to

##### avoid collisions with regular sendTransaction.

##### Both the Helius Node.js and Rust SDKs can send smart transactions. This new method

##### builds and sends an optimized transaction while handling its conrmation status. Users can

##### congure the transaction's send options, such as whether the transaction should skip

##### preight checks.

##### At the most basic level, users must supply their keypair and the instructions they wish to

##### execute, and we handle the rest.

##### We:

- Fetch the latest blockhash
- Build the initial transaction
- Simulate the initial transaction to fetch the compute units consumed
- Set the compute unit limit to the compute units consumed in the previous step, with^

##### some margin

- Get the Helius recommended priority fee via our Priority Fee API
- Set the priority fee (microlamports per compute unit) as the Helius recommended fee

### ◦ Adds a small safety buffer fee in case the recommended value changes in the next^

##### few seconds

- Build and send the optimized transaction
- Return the transaction signature if successful

##### Requiring the recommended value (or higher) for our staked connections ensures

##### that Helius sends high-quality transactions and that we won't be rate-limited by

##### validators.

## Sending Smart Transactions


##### This method is designed to be the easiest way to build, send, and land a transaction on

##### Solana.

##### Note that by using the Helius recommended fee, transactions sent by Helius users on one

##### of our standard paid plans will be routed through our staked connections, guaranteeing

##### nearly 100% transaction delivery.

##### The sendSmartTransaction method is available in our Helius Node.js SDK for versions

##### >= 1.3.2. To update to a more recent version of the SDK, run npm update helius-sdk.

##### The following example transfers SOL to an account of your choice. It leverages

##### sendSmartTransaction to send an optimized transaction that does not skip preight

##### checks

```
import { Helius } from "helius-sdk";
import {
Keypair,
SystemProgram,
LAMPORTS_PER_SOL,
TransactionInstruction,
} from "@solana/web3.js";
```
```
const helius = new Helius("YOUR_API_KEY");
```
```
const fromKeypair = /* Your keypair goes here */;
const fromPubkey = fromKeypair.publicKey;
const toPubkey = /* The person we're sending 0.5 SOL to */;
```
```
const instructions: TransactionInstruction[] = [
SystemProgram.transfer({
fromPubkey: fromPubkey,
toPubkey: toPubkey,
lamports: 0.5 * LAMPORTS_PER_SOL,
}),
];
```
```
const transactionSignature = await helius.rpc.sendSmartTransaction(instru
console.log(`Successful transfer: ${transactionSignature}`);
```
### Node.js SDK


##### The send_smart_transaction method is available in our Rust SDK for versions >= 0.1.5.

##### To update to a more recent version of the SDK, run cargo update helius.

##### The following example transfers 0.01 SOL to an account of your choice. It leverages

##### send_smart_transaction to send an optimized transaction that skips preight checks

##### and retries twice, if necessary:

### Rust SDK


use helius::types::*;
use helius::Helius;
use solana_sdk::{
pubkey::Pubkey,
signature::Keypair,
system_instruction
};

#[tokio::main]
async fn main() {
let api_key: &str = "YOUR_API_KEY";
let cluster: Cluster = Cluster::MainnetBeta;
let helius: Helius = Helius::new(api_key, cluster).unwrap();

let from_keypair: Keypair = /* Your keypair goes here */;
let from_pubkey: Pubkey = from_keypair.pubkey();
let to_pubkey: Pubkey = /* The person we're sending 0.01 SOL to */;

// Create a simple instruction (transfer 0.01 SOL from from_pubkey to
let transfer_amount = 100_000; // 0.01 SOL in lamports
let instruction = system_instruction::transfer(&from_pubkey, &to_pubk

// Create the SmartTransactionConfig
let config = SmartTransactionConfig {
instructions,
signers: vec![&from_keypair],
send_options: RpcSendTransactionConfig {
skip_preflight: true,
preflight_commitment: None,
encoding: None,
max_retries: Some( 2 ),
min_context_slot: None,
},
lookup_tables: None,
};

// Send the optimized transaction
match helius.send_smart_transaction(config).await {
Ok(signature) => {
println!("Transaction sent successfully: {}", signature);
}
Err(e) => {
eprintln!("Failed to send transaction: {:?}", e);
}
}
}


##### We recommend sending smart transactions with one of our SDKs but the same

##### functionality can be achieved without using one. Both the Node.js SDK and Rust SDK are

##### open-source, so the underlying code for the send smart transaction functionality can be

##### viewed anytime.

##### First, prepare and build the initial transaction. This includes creating a new transaction with

##### a set of instructions, adding the recent blockhash, and assigning a fee payer. For versioned

##### transactions, create a TransactionMessage and compile it with lookup tables if any are

##### present. Then, create a new versioned transaction and sign it — this is necessary for the

##### next step when we simulate the transaction, as the transaction must be signed.

##### For example, if we wanted to prepare a versioned transaction:

##### To optimize the transaction's compute unit (CU) usage, we can use the

##### simulateTransaction RPC method to simulate the transaction. Simulating the

```
// Prepare your instructions and set them to an instructions variable
// The payerKey is the public key that will be paying for this transactio
// Prepare your lookup tables and set them to a lookupTables variable
```
```
let recentBlockhash = (await this.connection.getLatestBlockhash()).blockh
```
```
const v0Message = new TransactionMessage({
instructions: instructions,
payerKey: pubKey,
recentBlockhash: recentBlockhash,
}).compileToV0Message(lookupTables);
```
```
versionedTransaction = new VersionedTransaction(v0Message);
versionedTransaction.sign([fromKeypair]);
```
## Sending Transactions Without the SDK

### Prepare and Build the Initial Transaction

### Optimize the Transaction's Compute Unit (CU) Usage


##### transaction will return the amount of CUs used, so we can use this value to set our compute

##### limit accordingly.

##### It's recommended to use a test transaction with the desired instructions rst, plus an

##### instruction that sets the compute limit to 1.4m CUs. This is done to ensure the transaction

##### simulation succeeds.

##### For example:

##### It is also recommended to add a bit of margin to ensure the transaction executes without

##### any issues.

##### We can do so by setting the following:

##### Then, create an instruction that sets the compute unit limit to this value and add it to your

##### array of instructions:

```
const testInstructions = [
ComputeBudgetProgram.setComputeUnitLimit({ units: 1_400_000 }),
...instructions,
];
```
```
const testTransaction = new VersionedTransaction(
new TransactionMessage({
instructions: testInstructions,
payerKey: payer,
recentBlockhash: (await this.connection.getLatestBlockhash()).blo
}).compileToV0Message(lookupTables)
);
```
```
const rpcResponse = await this.connection.simulateTransaction(testTransac
replaceRecentBlockhash: true,
sigVerify: false,
});
```
```
const unitsConsumed = rpcResponse.value.unitsConsumed;
```
```
let customersCU = Math.ceil(unitsConsumed * 1.1);
```

##### This is relatively straightforward.

##### First, to serialize the transaction, both Transaction and VersionedTransaction types

##### have a .serialize() method. Then use the bs58 package to encode the transaction.

##### Your code should look something like bs58.encode(txt.serialize());

##### First, use the Priority Fee API to get the priority fee estimate. We want to pass in our

##### transaction and get the Helius recommended fee via the recommended parameter:

```
const computeUnitIx = ComputeBudgetProgram.setComputeUnitLimit({
units: customersCU
});
```
```
instructions.push(computeUnitIx);
```
```
const response = await fetch(HeliusURL, {
method: "POST",
headers: { "Content-Type": "application/json" },
body: JSON.stringify({
jsonrpc: "2.0",
id: "1",
method: "getPriorityFeeEstimate",
params: [
{
transaction: bs58.encode(versionedTransaction), // Pass t
options: { recommended: true },
},
],
}),
});
```
```
const data = await response.json();
const priorityFeeRecommendation = data.result.priorityFeeEstimate;
```
### Serialize and Encode the Transaction

### Setting the Right Priority Fee


##### Then, create an instruction that sets the compute unit price to this value, and add that

##### instruction to your previous instructions:

##### This step is almost a repeat of the rst step. However, the array of initial instructions has

##### been altered to add two instructions to set the compute unit limit and price optimally.

##### Now, send the transaction.

##### It doesn't matter if you send with or without preight checks or change any other send

##### options — the transaction will be routed through our staked connections.

##### While staked connections will forward a transaction directly to the leader, it is still possible

##### for the transaction to be dropped in the Banking Stage. It is recommended that users

##### employ their own rebroadcasting logic rather than rely on the RPC to retry the transaction

##### for them.

##### The sendTransaction RPC method has a maxRetries parameter that can be set to

##### override the RPC's default retry logic, giving developers more control over the retry

##### process. It is a common pattern to fetch the current blockhash via getLatestBlockhash,

##### store the lastValidBlockHeight, and retry the transaction until the blockhash expires. It

##### is crucial to only re-sign a transaction when the blockhash is no longer valid, or else it is

##### possible for both transactions to be accepted by the network.

##### Once a transaction is sent, it is important to poll its conrmation status to see whether the

##### network has processed and conrmed it before retrying. Use the getSignatureStatuses

##### RPC method to check a list of transactions' conrmation status.

```
const computeBudgetIx = ComputeBudgetProgram.setComputeUnitPrice({
microLamports: priorityFeeRecommendation,
});
```
```
instructions.push(computeBudgetIx);
```
### Build and Send the Optimized Transaction

### Polling the Transaction's Status and Rebroadcasting


##### The @solana/web3.js SDK also has a getSignatureStatuses method on its Connection

##### class to fetch the current status of multiple signatures.

##### The sendSmartTransaction method has a timeout period of 60 seconds. Since a

##### blockhash is valid for 150 slots, and assuming perfect 400ms slots, we can reasonably

##### assume a transaction's blockhash will be invalid after one minute.

##### The method sends the transaction and polls its transaction signature using this timeout

##### period:

##### txtSig is set to the signature of the transaction that was just sent. The method then uses

##### the pollTransactionConfirmation() method to poll the transaction's conrmation

##### status. This method checks a transaction's status every ve seconds for a maximum of three

##### times.

```
try {
// Create a smart transaction
const transaction = await this.createSmartTransaction(instructions, si
```
```
const timeout = 60000 ;
const startTime = Date.now();
let txtSig;
```
```
while (Date.now() - startTime < timeout) {
try {
txtSig = await this.connection.sendRawTransaction(transaction.seri
skipPreflight: sendOptions.skipPreflight,
...sendOptions,
});
```
```
return await this.pollTransactionConfirmation(txtSig);
} catch (error) {
continue;
}
}
} catch (error) {
throw new Error(`Error sending smart transaction: ${error}`);
}
```
#### How sendSmartTransaction Handles Polling and Rebroadcasting


##### If the transaction is not conrmed during this time, an error is returned:

##### We continue sending the transaction, polling its conrmation status, and retrying it until a

##### minute has elapsed. If the transaction has not been conrmed at this time, an error is

##### thrown.

```
async pollTransactionConfirmation(txtSig: TransactionSignature): Promise<T
// 15 second timeout
const timeout = 15000 ;
// 5 second retry interval
const interval = 5000 ;
let elapsed = 0 ;
```
```
return new Promise<TransactionSignature>((resolve, reject) => {
const intervalId = setInterval(async () => {
elapsed += interval;
```
```
if (elapsed >= timeout) {
clearInterval(intervalId);
reject(new Error(`Transaction ${txtSig}'s confirmation timed ou
}
```
```
const status = await this.connection.getSignatureStatuses([txtSig
```
```
if (status?.value[ 0 ]?.confirmationStatus === "confirmed") {
clearInterval(intervalId);
resolve(txtSig);
}
}, interval);
});
}
```

