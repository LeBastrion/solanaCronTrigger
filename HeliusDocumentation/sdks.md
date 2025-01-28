# SDKs

#### SDKs for building the future of Solana

#### At Helius, we've developed a Node.js and a Rust SDK to make developing on Solana easier.

#### The following page includes information on installing and using these SDKs. It also covers

#### common error handling, where to nd the latest documentation, and how to contribute to

#### these SDKs. We also outline a list of unofcial community SDKs made by our wonderful

#### community. Note that those SDKs are not ofcially maintained by our team — only the

#### Node.js and Rust SDKs are

#### The Helius Node.js SDK can be installed with any of the following package managers:

#### Here's a straightforward example of how to use the Node.js SDK to fetch a list of assets

#### owned by a given address:

```
Package Manager Command
```
```
npm npm install helius-sdk
```
```
pnpm pnpm install helius-sdk
```
```
Yarn yarn add helius-sdk
```
## Node.js SDK

## Installation

## Quick Start


#### The README le is lled with in-depth code examples covering each method and basic

#### usage. For API reference documentation, refer to our documentation and the ofcial Solana

#### documentation for general Solana JSON RPC API help.

#### To start using the Helius Rust SDK in your project, add it as a dependency via cargo. Open

#### your project's Cargo.toml and add the following line under [dependencies]:

#### where x.y.z is your desired version. Alternatively, use cargo add helius to add the

#### dependency directly via the command line. This will automatically nd the latest version

#### compatible with your project and add it to your Cargo.toml.

#### Remember to run cargo update regularly to fetch the latest version of the SDK.

```
import { Helius } from "helius-sdk";
```
```
const helius = new Helius("YOUR_API_KEY");
const response = await helius.rpc.getAssetsByOwner({
ownerAddress: "86xCnPeV69n6t3DnyGvkKobf9FdN2H9oiVDdaMpo2MMY",
page: 1 ,
});
```
```
console.log(response.items);
```
```
helius = "x.y.z"
```
### Documentation

## Rust SDK

### Installation

### Quick Start


#### Here is a straightforward example of using the Enhanced Transactions API to parse a given

#### transaction:

#### The latest documentation can be found here on docs.rs. For API reference documentation,

#### refer to our documentation and the ofcial Solana documentation for general Solana JSON

#### RPC API help.

#### More examples of how to use the SDK can be found in the examples directory.

#### An error message will be thrown when the API returns a non-success (i.e., 4xx or 5xx status

#### code). For example:

```
use helius::error::Result;
use helius::types::*;
use helius::Helius;
```
```
#[tokio::main]
async fn main() -> Result<()> {
let api_key: &str = "your_api_key";
let cluster: Cluster = Cluster::MainnetBeta;
```
```
let helius: Helius = Helius::new(api_key, cluster).unwrap();
```
```
let request: ParseTransactionsRequest = ParseTransactionsRequest {
transactions: vec![
"2sShYqqcWAcJiGc3oK74iFsYKgLCNiY2DsivMbaJGQT8pRzR8z5iBcdmTMXR
],
};
```
```
let response: Result<Vec<EnhancedTransaction>, HeliusError> = helius.
println!("Assets: {:?}", response);
```
```
Ok(())
}
```
### Documentation

## Error Handling


#### When working with the Helius SDK, you may encounter several error codes. Below is a

#### table detailing some of the common error codes along with additional information to help

#### you troubleshoot:

#### If you encounter any of these errors:

- Refer to errors.rs for a list of all possible errors returned by the Helius client, if^

#### using the Rust SDK

- Refer to the Helius documentation for further guidance
- Reach out to the Helius support team for more detailed assistance

```
// From our Node.js SDK
try {
const response = await helius.rpc.getAssetsByOwner({
ownerAddress: "86xCnPeV69n6t3DnyGvkKobf9FdN2H9oiVDdaMpo2MMY",
page: 1 ,
});
console.log(response.items);
} catch (error) {
console.log(error);
}
```
```
Error Code Error Message More Information
```
```
401 Unauthorized
```
```
This occurs when an invalid
API key is provided or access is
restricted due to RPC rules.
```
```
429 Too Many Requests
```
```
This indicates that the user
has exceeded the request limit
in a given timeframe or is out
of credits.
```
```
5XX Internal Server Error
```
```
This is a generic error message
for server-side issues. Please
contact Helius support for
assistance.
```
### Common Error Codes


#### We welcome all contributions to our SDKs! If you're interested, here are our GitHub

#### Repositories:

- Node.js SDK
- Rust SDK

### ◦ Interested in contributing to the Helius Rust SDK specically? Read the following

#### contributions guide before opening up a pull request!

#### Our amazing community members have also created their own SDKs to interact with our

#### REST APIs. Please note our team does not ofcially maintain these. Unofcial community

#### SDKs in other languages include:

- Kotlin SDK
- PHP SDK
- Python SDK
- Rust SDK (Synchronous)
- Rust SDK (Asynchronous)

#### Dashboard | Helius

## Contribution to Our SDKs

## Unofficial Community SDKs

## Start Building Today


