-- First, create a function that will make the HTTP call to our Edge Function
CREATE OR REPLACE FUNCTION public.trigger_price_tracker()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  response_status integer;
BEGIN
  SELECT INTO response_status status 
  FROM http_post(
    'https://iejvyhazishlvayithuj.supabase.co/functions/v1/sol-price-tracker',
    '{}',
    'application/json',
    ARRAY[
      ('Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImllanZ5aGF6aXNobHZheWl0aHVqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMTE4MjU5NSwiZXhwIjoyMDQ2NzU4NTk1fQ.EBXVSNLa7izfICX1yPAQ6iPJYRRrRHRiiFOnAv7owIE')::http_header
    ]
  );

  IF response_status != 200 THEN
    RAISE EXCEPTION 'Edge function returned status %', response_status;
  END IF;
END;
$$;

-- Enable the required extensions if not already enabled
CREATE EXTENSION IF NOT EXISTS pg_cron;
CREATE EXTENSION IF NOT EXISTS http;

-- Schedule the job to run every 5 minutes
SELECT cron.schedule('price-tracker', '*/5 * * * *', 'SELECT public.trigger_price_tracker()');

-- Clean up old execution logs every day at midnight
SELECT cron.schedule('cleanup-job-run-details', '0 0 * * *', 
  $$DELETE FROM cron.job_run_details WHERE end_time < now() - interval '7 days'$$
); 