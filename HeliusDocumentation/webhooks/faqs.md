# FAQs

#### Have a question about Helius webhooks?

#### Currently, we resend unacknowledged webhook events once per minute for three minutes.

#### We also offer customizable retry policies for enterprise plans.

#### Webhooks notify as soon as a transaction is conrmed.

#### Raw webhooks are regular Solana transactions. When a transaction occurs for the given

#### addresses in a raw webhook, those transactions will be directly sent to the webhook URL

#### supplied by the user.

#### Enhanced webhooks are for Helius' interpreted transaction types. We parse over 100 types

#### of Solana transactions, including NFT listings, DeFi swaps, Solana transfers, etc., and

#### abstract these into our own schema. If you want to listen for any transaction and don't want

#### Helius abstractions, use raw webhooks. If you want built-in transaction type detection , use

#### enhanced webhooks.

#### Yes!

## What is the retry policy for webhooks?

## When does the Webhook send a notification?

## What is the difference between "raw" and "enhanced"

## webhooks?

## Are webhooks available on Devnet?

## How many addresses can I input for 1 webhook?


#### Up to 100,000 addresses.

#### You can specify an authorization header when creating (or updating) a webhook. Helius will

#### include set the value in the Authorization header when sending data to your webhook.

#### No! This is a very common mistake. We can not detect your own local servers from just

#### "localhost."

#### Yes, you can! See the Helius SDK for a code example.

#### It depends on the type. Enhanced webhooks do not, but raw webhooks do!

### How can I verify that the webhook came from Helius?

### Can I input "localhost" for my webhook URL?

### Can I monitor an entire NFT collection?

### Do webhooks post failed transactions?