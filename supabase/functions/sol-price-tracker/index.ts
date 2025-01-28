import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.0'

// Use environment variables with different names
const PROJECT_URL = Deno.env.get('PROJECT_URL') || '';
const DB_ANON_KEY = Deno.env.get('DB_ANON_KEY') || '';

if (!PROJECT_URL || !DB_ANON_KEY) {
  throw new Error('Missing required environment variables PROJECT_URL or DB_ANON_KEY');
}

const TOKENS = {
  SOL: {
    address: 'So11111111111111111111111111111111111111112',
    table: 'sol_price_history'
  },
  AI16Z: {
    address: 'HeLp6NuQkmYB4pYWo2zYs22mESHXPQYzXbB8n4V98jwC',
    table: 'ai16z_price_history'
  },
  BONK: {
    address: 'DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263',
    table: 'bonk_price_history'
  },
  MOBILE: {
    address: 'mb1eu7TzEc71KxDpsmsKoucSSuuoGLv1drys1oP2jh6',
    table: 'mobile_price_history'
  }
}

interface JupiterPriceResponse {
  data: {
    [key: string]: {
      price: string;
      extraInfo: {
        lastSwappedPrice: {
          lastJupiterBuyPrice: string;
          lastJupiterSellPrice: string;
          lastJupiterBuyAt: number;
          lastJupiterSellAt: number;
        };
        quotedPrice: {
          buyPrice: string;
          sellPrice: string;
        };
        confidenceLevel: string;
        depth: {
          buyPriceImpactRatio: {
            depth: {
              "10": number | null;
              "1000": number | null;
            };
          };
          sellPriceImpactRatio: {
            depth: {
              "10": number | null;
              "1000": number | null;
            };
          };
        };
      };
    };
  };
}

async function fetchTokenPrices(): Promise<JupiterPriceResponse> {
  const tokenAddresses = Object.values(TOKENS).map(t => t.address).join(',');
  const response = await fetch(
    `https://api.jup.ag/price/v2?ids=${tokenAddresses}&showExtraInfo=true`
  );
  return response.json();
}

function transformPriceData(data: JupiterPriceResponse, tokenAddress: string) {
  const tokenData = data.data[tokenAddress];
  if (!tokenData) {
    throw new Error(`No data found for token ${tokenAddress}`);
  }

  const now = Math.floor(Date.now() / 1000);
  
  // Ensure we have valid price data
  if (!tokenData.price || !tokenData.extraInfo?.quotedPrice?.sellPrice || !tokenData.extraInfo?.quotedPrice?.buyPrice) {
    throw new Error(`Invalid price data for token ${tokenAddress}`);
  }

  // Calculate immediate and depth impact as average of buy and sell impacts
  const immediateImpact = calculateImpact(tokenData, "10");
  const depthImpact = calculateImpact(tokenData, "1000");

  // Ensure all required fields have valid values
  const price = parseFloat(tokenData.price);
  const bid = parseFloat(tokenData.extraInfo.quotedPrice.sellPrice);
  const ask = parseFloat(tokenData.extraInfo.quotedPrice.buyPrice);
  const lastBuyPrice = parseFloat(tokenData.extraInfo.lastSwappedPrice.lastJupiterBuyPrice || '0');
  const lastSellPrice = parseFloat(tokenData.extraInfo.lastSwappedPrice.lastJupiterSellPrice || '0');
  const lastTradeTime = Math.max(
    tokenData.extraInfo.lastSwappedPrice.lastJupiterBuyAt || 0,
    tokenData.extraInfo.lastSwappedPrice.lastJupiterSellAt || 0
  );

  if (isNaN(price) || isNaN(bid) || isNaN(ask)) {
    throw new Error(`Invalid numeric values in price data for token ${tokenAddress}`);
  }

  return {
    timestamp: now,
    price,
    bid,
    ask,
    last_buy_price: lastBuyPrice || price,
    last_sell_price: lastSellPrice || price,
    last_trade_time: lastTradeTime || now,
    confidence: tokenData.extraInfo.confidenceLevel || 'low',
    immediate_impact: immediateImpact,
    depth_impact: depthImpact
  };
}

function calculateImpact(solData: any, size: "10" | "1000"): number | null {
  const buyImpact = solData.extraInfo.depth.buyPriceImpactRatio.depth[size];
  const sellImpact = solData.extraInfo.depth.sellPriceImpactRatio.depth[size];
  
  if (buyImpact === null && sellImpact === null) return null;
  if (buyImpact === null) return sellImpact;
  if (sellImpact === null) return buyImpact;
  return Math.max(buyImpact, sellImpact);
}

async function processToken(supabase: any, tokenKey: string, priceData: JupiterPriceResponse) {
  const token = TOKENS[tokenKey as keyof typeof TOKENS];
  if (!token) return null;

  try {
    const transformedData = transformPriceData(priceData, token.address);
    
    // Insert new price record
    const { error: insertError } = await supabase
      .from(token.table)
      .insert([transformedData]);

    if (insertError) {
      console.error(`Insert error for ${tokenKey}: ${insertError.message}`);
      return { error: `Insert error for ${tokenKey}: ${insertError.message}` };
    }

    // Clean up old records
    const cutoffTime = Math.floor(Date.now() / 1000) - (72 * 60 * 60);
    const { error: deleteError } = await supabase
      .from(token.table)
      .delete()
      .lt('timestamp', cutoffTime);

    if (deleteError) {
      console.error(`Delete error for ${tokenKey}: ${deleteError.message}`);
      // Don't return error here as the insert was successful
    }

    return transformedData;
  } catch (error) {
    console.error(`Error processing ${tokenKey}:`, error);
    return { error: error instanceof Error ? error.message : 'Unknown error' };
  }
}

Deno.serve(async (req) => {
  const startTime = Date.now();
  const executionId = crypto.randomUUID();
  console.log(`Function execution started: ${executionId}`);
  
  try {
    const supabase = createClient(PROJECT_URL, DB_ANON_KEY)
    console.log('Supabase client initialized');
    
    // Fetch all token prices
    console.log('Fetching token prices from Jupiter...');
    const priceData = await fetchTokenPrices();
    if (!priceData?.data) {
      throw new Error(`Jupiter API error: ${JSON.stringify(priceData)}`);
    }
    console.log('Successfully fetched token prices');

    // Process each token
    const results = {};
    for (const [tokenKey, tokenInfo] of Object.entries(TOKENS)) {
      console.log(`Processing ${tokenKey}...`);
      try {
        results[tokenKey] = await processToken(supabase, tokenKey, priceData);
        console.log(`Successfully processed ${tokenKey}`);
      } catch (error) {
        console.error(`Error processing ${tokenKey}:`, error);
        results[tokenKey] = { error: error.message };
      }
    }

    const duration = Date.now() - startTime;
    
    // Log successful execution
    await supabase
      .from('function_executions')
      .insert([{
        success: true,
        duration_ms: duration,
        results: results
      }]);

    return new Response(JSON.stringify({ 
      success: true,
      executionId,
      duration,
      data: results 
    }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200,
    });
  } catch (error) {
    const duration = Date.now() - startTime;
    
    // Log failed execution
    await supabase
      .from('function_executions')
      .insert([{
        success: false,
        duration_ms: duration,
        error: error.message
      }]);

    console.error(`Execution ${executionId} failed:`, error);
    return new Response(JSON.stringify({ 
      error: error.message,
      executionId,
      duration,
      stack: error.stack 
    }), {
      headers: { 'Content-Type': 'application/json' },
      status: 500,
    });
  }
}) 