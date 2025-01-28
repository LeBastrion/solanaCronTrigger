-- Drop existing policies
DROP POLICY IF EXISTS "Enable insert for service role" ON public.function_executions;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.function_executions;

-- Create new policies with correct roles
CREATE POLICY "Enable insert for authenticated users and anon" ON public.function_executions
    FOR INSERT TO authenticated, anon
    WITH CHECK (true);

CREATE POLICY "Enable read access for all users" ON public.function_executions
    FOR SELECT TO authenticated, anon
    USING (true);

-- Grant necessary permissions
GRANT ALL ON public.function_executions TO anon;
GRANT ALL ON public.function_executions TO authenticated;
GRANT ALL ON public.function_executions TO service_role;

-- Grant sequence permissions
GRANT USAGE, SELECT ON SEQUENCE public.function_executions_id_seq TO anon;
GRANT USAGE, SELECT ON SEQUENCE public.function_executions_id_seq TO authenticated;
GRANT USAGE, SELECT ON SEQUENCE public.function_executions_id_seq TO service_role; 