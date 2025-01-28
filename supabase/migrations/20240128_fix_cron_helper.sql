-- Drop the existing function first
DROP FUNCTION IF EXISTS public.check_cron_jobs();

-- Fix the helper function
CREATE OR REPLACE FUNCTION public.check_cron_jobs()
RETURNS TABLE (
    jobid bigint,
    jobname text,
    schedule text,
    command text,
    last_run timestamptz,
    last_status text
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        j.jobid,
        j.jobname,
        j.schedule,
        j.command,
        MAX(jrd.start_time) as last_run,
        (
            SELECT status 
            FROM cron.job_run_details rd
            WHERE rd.jobid = j.jobid 
            ORDER BY rd.start_time DESC 
            LIMIT 1
        ) as last_status
    FROM cron.job j
    LEFT JOIN cron.job_run_details jrd ON j.jobid = jrd.jobid
    GROUP BY j.jobid, j.jobname, j.schedule, j.command;
END;
$$; 