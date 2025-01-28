# FAQs

##### Have a question about the Enhanced Transaction API?

##### Each Enhanced Transaction API call uses 100 credits.

##### Both APIs support Finalized and Conrmed commitment levels, with Finalized set as the

##### default. The Processed level is not supported.

##### You can pass up to 100 transactions in the Parse Transaction(s) API.

##### The API can fetch a maximum of 100 transactions. You can set the limit between 1 and 100

##### in the query.

##### The API retrieves and parses transactions, with the before and after parameters specifying

##### the starting and ending points of the search. Including a type parameter lters the results to

##### only include specied transactions. For example, if a user has made 50 transfers within their

##### last 100 transactions, the API call will return only those 50 transfer transactions.

## How many credits does each call use?

## Which commitment levels are supported?

## How many transactions can be passed in Parse Transaction(s)

## API?

## How many transactions can the Parse Transaction History

## API fetch?

## How does the Parsed Transaction History API fetch

## transactions?


##### Parsing occurs at runtime. When ltering by type , latency may vary as the API might need

##### to search through thousands of transactions. Note that the call has a timeout limit of 10

##### seconds.

##### Use pagination to fetch the entire history. Check out the example code sample.

##### Token transfers involve changes to the address's associated token accounts. You can view

##### the accounts involved in a transaction using tools like Solana Explorer. If the account you

##### are tracking is not listed among the accounts list for a transaction, it will not be reected in

##### the API response.

##### You can still track all transactions and lter the relevant ones from those categorized under

##### the UNKNOWN type.

### How long does the Parsed History Transaction API take?

### How do I get the entire transaction history of an address?

### Why don't I see token transfers in the Parsed Transaction

### History API?

### What if the transaction source I need is not listed?