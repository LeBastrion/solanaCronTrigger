Price API V2: Improved On-Chain Price For Any Token
Jupiter Price API V2 is an improved version of the Price API, aiming to enhance accuracy by incorporating both buy and sell-side liquidity to derive the average price of the two. This provides more reliable real-time data for SPL tokens.

Support
If you have a use case that is not supported yet, let us know in #developer-support in our discord: discord.gg/jup

Usage
Jupiter Price API will always return the unit buy price for the token specified with the ids parameter. This price is based on the best pricing data available across all DEXes queried. Please remember the addresses are case-sensitive.

For example, the most basic call will provide the unit price for the token based on the buy amount of USDC.

# Unit price of 1 JUP & 1 SOL based on the Derived Price in USDC
https://api.jup.ag/price/v2?ids=JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN,So11111111111111111111111111111111111111112

{
    "data": {
        "So11111111111111111111111111111111111111112": {
            "id": "So11111111111111111111111111111111111111112",
            "type": "derivedPrice",
            "price": "133.890945000"
        },
        "JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN": {
            "id": "JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN",
            "type": "derivedPrice",
            "price": "0.751467"
        }
    },
    "timeTaken": 0.00395219
}

Including showExtraInfo provides more detailed information, helping you determine the most suitable price for your use case.

# Unit price of 1 JUP & 1 SOL based on the Derived Price in USDC
https://api.jup.ag/price/v2?ids=JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN,So11111111111111111111111111111111111111112&showExtraInfo=true

{
    "data": {
        "So11111111111111111111111111111111111111112": {
            "id": "So11111111111111111111111111111111111111112",
            "type": "derivedPrice",
            "price": "132.176540000",
            "extraInfo": {
                "lastSwappedPrice": {
                    "lastJupiterSellAt": 1726232167,
                    "lastJupiterSellPrice": "132.1815918927837",
                    "lastJupiterBuyAt": 1726232168,
                    "lastJupiterBuyPrice": "132.3113422757551"
                },
                "quotedPrice": {
                    "buyPrice": "132.183970000",
                    "buyAt": 1726232166,
                    "sellPrice": "132.169110000",
                    "sellAt": 1726232168
                },
                "confidenceLevel": "high",
                "depth": {
                    "buyPriceImpactRatio": {
                        "depth": {
                            "10": 0.011976036126034885,
                            "100": 0.05308426581530216,
                            "1000": 0.1168049189323158
                        },
                        "timestamp": 1726232167
                    },
                    "sellPriceImpactRatio": {
                        "depth": {
                            "10": 0.01582101846363979,
                            "100": 0.03166775883921609,
                            "1000": 0.06880960201997424
                        },
                        "timestamp": 1726232167
                    }
                }
            }
        },
        "JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN": {
            "id": "JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN",
            "type": "derivedPrice",
            "price": "0.742851",
            "extraInfo": {
                "lastSwappedPrice": {
                    "lastJupiterSellAt": 1726232039,
                    "lastJupiterSellPrice": "0.7442999683998961",
                    "lastJupiterBuyAt": 1726232097,
                    "lastJupiterBuyPrice": "0.7431593824200015"
                },
                "quotedPrice": {
                    "buyPrice": "0.742917",
                    "buyAt": 1726232165,
                    "sellPrice": "0.742784",
                    "sellAt": 1726232168
                },
                "confidenceLevel": "high",
                "depth": {
                    "buyPriceImpactRatio": {
                        "depth": {
                            "10": 0.009393981894911491,
                            "100": 0.08127843280940066,
                            "1000": 0.3417234655853332
                        },
                        "timestamp": 1726232167
                    },
                    "sellPriceImpactRatio": {
                        "depth": {
                            "10": 0.05174412761856207,
                            "100": 0.06288330728860267,
                            "1000": 0.281508676845538
                        },
                        "timestamp": 1726232167
                    }
                }
            }
        }
    },
    "timeTaken": 0.00388851
}


If you include a vsToken, the buy token can be specified.

For example, this call will return the unit price for 1 JUP, based on the buy amount of Bonk.

Simply put, the vsToken argument tells you how much of the vsToken (Bonk in this case) you will need to buy the target token (JUP). For every one JUP we want to buy, we will need ~40,560 Bonk.

note
vsToken cannot be used with showExtraInfo when it's true. A response 400: Bad request would be returned.

# Unit price of 1 JUP based on the buy amount of Bonk
https://api.jup.ag/price/v2?ids=JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN&vsToken=DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263&showExtraInfo=true

{
  "data": {
    "JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN": {
      "id": "JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN",
      "type": "derivedPrice",
      "price": "40560.32136735473"
    },
    "DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263": {
      "id": "DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263",
      "type": "derivedPrice",
      "price": "1"
    }
  },
  "timeTaken": 0.003043602
}


Try it out!
Try the API calls by making simple GET request via your browser or one of the terminal commands below:

GEThttps://api.jup.ag/price/v2
Rate Limits: This endpoint is rate limited to 600 requests/min.

Making sense of the data
Field	Explanation
type	derivedPrice is the midpoint between buyPrice and sellPrice.
price	based on the type above
extraInfo	extraInfo Fields (More info below)
buyPrice	An Option<String> representing the quoted buy price.
sellPrice	An Option<String> representing the quoted sell price.
timeTaken	A f32 representing the time taken for the request.
lastSwappedPrice	A SwapPrice struct that holds the last Jupiter swapped price details.
extraInfo Fields
Note: This is flattened, please refer to the JSON response.

lastJupiterSellAt	Epoch seconds of the lastJupiterSellPrice.
lastJupiterSellPrice	Price of last Jupiter sell
lastJupiterBuyAt	Epoch seconds of the lastJupiterBuyPrice.
lastJupiterBuyPrice	Price of last Jupiter buy
buyPrice	An Option<String> representing the quoted buy price.
buyAt	Epoch seconds of when the buy quote was retrieved.
sellPrice	An Option<String> representing the quoted sell price.
sellAt	Epoch seconds of when the sell quote was retrieved.
confidenceLevel	A String indicating the confidence level (High, Medium, or Low).
buyPriceImpactRatio	A Map broken down into 3 key-value pairs: 10, 100 & 1000 (SOL). The value is expressed as a percentage.
sellPriceImpactRatio	A Map broken down into 3 key-value pairs: 10, 100 & 1000 (SOL). The value is expressed as a percentage.
Limitations
If the price for a token cannot be found, it is either because

The token is not tradable on Jupiter - it does not fit Jupiter’s routing criteria.

There is no route for this token to SOL.

sellPrice, sellAt & lastSwappedPrice might be null in cases

sellPrice & sellAt is not cached and cannot be retrieved (in these cases type will be buyPrice, same as PriceV1).

lastSwappedPrice might be null if the token has not been traded recently or cannot be retrieved w

Tokens that have not been traded via USDC in the last 3 days.
Note that this is only for swaps done via Jupiter, it will not be done for swaps done e.g. directly on Raydium’s platform
buyPriceImpactRatio & sellPriceImpactRatio in the depth field might be null in cases

We are to get the respective price impacts for the 10, 100 and 1000 SOL buys or sells
It could be because the token’s liquidity does not have enough liquidity for larger values
We cannot find the sell quote for the respective token and the buy/sell values