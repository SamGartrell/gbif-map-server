-- TODO: Reconfigure "pgbouncer" to inherit permissions from "readacess"

-- Create the "pgbouncer" role with a password
CREATE ROLE pgbouncer WITH LOGIN PASSWORD 'pgbouncer';
-- Grant USAGE and SELECT privileges to the "pgbouncer" role on the "physical" schema
GRANT USAGE ON SCHEMA physical TO pgbouncer;
GRANT SELECT ON ALL TABLES IN SCHEMA physical TO pgbouncer;
-- Ensure the role does not have the ability to modify the schema
REVOKE CREATE ON SCHEMA physical FROM pgbouncer;

-- Grant USAGE and SELECT privileges to the "pgbouncer" role on the "cultural" schema
GRANT USAGE ON SCHEMA cultural TO pgbouncer;
GRANT SELECT ON ALL TABLES IN SCHEMA cultural TO pgbouncer;
-- Ensure the role does not have the ability to modify the schema
REVOKE CREATE ON SCHEMA cultural FROM pgbouncer;