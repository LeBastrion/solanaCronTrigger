# Solana Token Price Tracker

A service that tracks prices of various Solana tokens (SOL, AI16Z, BONK, MOBILE) using Supabase Edge Functions and GitHub Actions.

## Features

- Tracks token prices every 5 minutes
- Stores historical price data in Supabase
- Maintains a 72-hour rolling window of price history
- Uses GitHub Actions for reliable scheduling

## Architecture

- **Edge Function**: Fetches current token prices and stores them in the database
- **GitHub Action**: Triggers the Edge Function every 5 minutes
- **Database**: Stores price history with automatic cleanup of old data

## Setup

1. Deploy the Supabase Edge Function
2. Set up the database tables and functions
3. Configure GitHub Actions for scheduled execution

## Development

```bash
# Deploy Edge Function
supabase functions deploy sol-price-tracker

# Test the function
curl -X POST 'https://[PROJECT_REF].supabase.co/functions/v1/sol-price-tracker' \
-H 'Authorization: Bearer [ANON_KEY]'
```

## License

MIT 