-- Create a base ROLE for read-only access
CREATE ROLE gbif_reader NOINHERIT;
GRANT gbif_base TO gbif_reader;

-- Grant USAGE and SELECT privileges to the "gbif_reader" role on the "physical" schema
-- GRANT USAGE ON SCHEMA physical TO gbif_reader;
-- GRANT SELECT ON ALL TABLES IN SCHEMA physical TO gbif_reader;
-- Ensure the role does not have the ability to modify the schema
REVOKE CREATE ON SCHEMA physical FROM gbif_reader;

-- Grant USAGE and SELECT privileges to the "gbif_reader" role on the "cultural" schema
-- GRANT USAGE ON SCHEMA cultural TO gbif_reader;
-- GRANT SELECT ON ALL TABLES IN SCHEMA cultural TO gbif_reader;
-- Ensure the role does not have the ability to modify the schema
REVOKE CREATE ON SCHEMA cultural FROM gbif_reader;