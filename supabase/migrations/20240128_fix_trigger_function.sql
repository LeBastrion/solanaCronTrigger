-- Drop the existing function
DROP FUNCTION IF EXISTS public.trigger_price_tracker();

-- Create schemas if they don't exist
CREATE SCHEMA IF NOT EXISTS net;
CREATE SCHEMA IF NOT EXISTS extensions;

-- Create required extensions
CREATE EXTENSION IF NOT EXISTS "http" WITH SCHEMA extensions;
CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA net;

-- Grant usage to public
GRANT USAGE ON SCHEMA extensions TO PUBLIC;
GRANT USAGE ON SCHEMA net TO PUBLIC;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA extensions TO PUBLIC;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA net TO PUBLIC;

-- Recreate the function with pg_net
CREATE OR REPLACE FUNCTION public.trigger_price_tracker()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = net, public
AS $$
DECLARE
  request_id bigint;
  response_status integer;
  response_body text;
BEGIN
  -- Make async HTTP request
  SELECT net.http_post(
    url:='https://iejvyhazishlvayithuj.supabase.co/functions/v1/sol-price-tracker',
    headers:=jsonb_build_object(
      'Content-Type', 'application/json',
      'Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImllanZ5aGF6aXNobHZheWl0aHVqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMTE4MjU5NSwiZXhwIjoyMDQ2NzU4NTk1fQ.EBXVSNLa7izfICX1yPAQ6iPJYRRrRHRiiFOnAv7owIE'
    ),
    body:='{}'::jsonb
  ) INTO request_id;

  -- Wait for response (up to 10 seconds)
  SELECT 
    status,
    content::text
  INTO 
    response_status,
    response_body
  FROM net.http_get_result(request_id, timeout_milliseconds:=10000);

  IF response_status != 200 THEN
    RAISE EXCEPTION 'Edge function returned status % with body: %', response_status, response_body;
  END IF;
END;
$$; 