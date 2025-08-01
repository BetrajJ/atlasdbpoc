-- Create a readonly user
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'readonly_user') THEN
    CREATE ROLE readonly_user LOGIN PASSWORD 'readonly123';
  END IF;
END
$$;

-- Grant SELECT privilege only
GRANT CONNECT ON DATABASE postgres TO readonly_user;
GRANT USAGE ON SCHEMA public TO readonly_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly_user;

-- Create a readwrite user
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'readwrite_user') THEN
    CREATE ROLE readwrite_user LOGIN PASSWORD 'readwrite123';
  END IF;
END
$$;

-- Grant SELECT, INSERT, UPDATE, DELETE privileges
GRANT CONNECT ON DATABASE postgres TO readwrite_user;
GRANT USAGE ON SCHEMA public TO readwrite_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO readwrite_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite_user;
