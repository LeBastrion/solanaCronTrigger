-- Create function_executions table
CREATE TABLE IF NOT EXISTS public.function_executions (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    success BOOLEAN NOT NULL,
    duration_ms INTEGER NOT NULL,
    results JSONB,
    error TEXT
);

-- Add indexes
CREATE INDEX IF NOT EXISTS idx_function_executions_created_at ON public.function_executions(created_at);
CREATE INDEX IF NOT EXISTS idx_function_executions_success ON public.function_executions(success);

-- Set up RLS
ALTER TABLE public.function_executions ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Enable insert for service role" ON public.function_executions
    FOR INSERT TO service_role
    WITH CHECK (true);

CREATE POLICY "Enable read access for all users" ON public.function_executions
    FOR SELECT TO authenticated, anon
    USING (true); 