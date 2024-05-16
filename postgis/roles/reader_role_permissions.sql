-- Create a base ROLE for read-only access
CREATE ROLE ne_reader NOINHERIT;
GRANT ne_base TO ne_reader;

-- Grant USAGE and SELECT privileges to the "ne_reader" role on the "physical" schema
-- GRANT USAGE ON SCHEMA physical TO ne_reader;
-- GRANT SELECT ON ALL TABLES IN SCHEMA physical TO ne_reader;
-- Ensure the role does not have the ability to modify the schema
REVOKE CREATE ON SCHEMA physical FROM ne_reader;

-- Grant USAGE and SELECT privileges to the "ne_reader" role on the "cultural" schema
-- GRANT USAGE ON SCHEMA cultural TO ne_reader;
-- GRANT SELECT ON ALL TABLES IN SCHEMA cultural TO ne_reader;
-- Ensure the role does not have the ability to modify the schema
REVOKE CREATE ON SCHEMA cultural FROM ne_reader;