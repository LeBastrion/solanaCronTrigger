-- Create a helper function to check cron jobs
CREATE OR REPLACE FUNCTION public.check_cron_jobs()
RETURNS TABLE (
    jobid bigint,
    jobname text,
    schedule text,
    command text,
    last_run timestamptz,
    next_run timestamptz,
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
        j.next_run,
        (
            SELECT status 
            FROM cron.job_run_details 
            WHERE jobid = j.jobid 
            ORDER BY start_time DESC 
            LIMIT 1
        ) as last_status
    FROM cron.job j
    LEFT JOIN cron.job_run_details jrd ON j.jobid = jrd.jobid
    GROUP BY j.jobid, j.jobname, j.schedule, j.command, j.next_run;
END;
$$; 