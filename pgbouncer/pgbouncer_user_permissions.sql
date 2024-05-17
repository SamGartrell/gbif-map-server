-- Create the "pgbouncer" user with a password that inherits the "gbif_reader" role
CREATE ROLE pgbouncer WITH LOGIN PASSWORD 'pgbouncer';

-- Inherit permissions from "gbif_reader"
GRANT gbif_reader TO pgbouncer;


-- I tried to econfigure "pgbouncer" to inherit permissions from "readacess"
-- Does it work? :)

-- If not...
-- -- Create the "pgbouncer" role with a password
-- CREATE ROLE pgbouncer WITH LOGIN PASSWORD 'pgbouncer';
-- -- Grant USAGE and SELECT privileges to the "pgbouncer" role on the "fungus" schema
-- GRANT USAGE ON SCHEMA fungus TO pgbouncer;
-- GRANT SELECT ON ALL TABLES IN SCHEMA fungus TO pgbouncer;
-- -- Ensure the role does not have the ability to modify the schema
-- REVOKE CREATE ON SCHEMA fungus FROM pgbouncer;

-- -- Grant USAGE and SELECT privileges to the "pgbouncer" role on the "invasive" schema
-- GRANT USAGE ON SCHEMA invasive TO pgbouncer;
-- GRANT SELECT ON ALL TABLES IN SCHEMA invasive TO pgbouncer;
-- -- Ensure the role does not have the ability to modify the schema
-- REVOKE CREATE ON SCHEMA invasive FROM pgbouncer;

-- -- Grant USAGE and SELECT privileges to the "pgbouncer" role on the "endangered" schema
-- GRANT USAGE ON SCHEMA endangered TO pgbouncer;
-- GRANT SELECT ON ALL TABLES IN SCHEMA endangered TO pgbouncer;
-- -- Ensure the role does not have the ability to modify the schema
-- REVOKE CREATE ON SCHEMA endangered FROM pgbouncer;