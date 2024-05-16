-- TODO: Reconfigure "tileserv" and "featureserv" to inherit permissions from "ne_reader"

-- Create the "featureserv" role with a password
CREATE ROLE featureserv WITH LOGIN PASSWORD 'featureserv';
-- Inherit permissions from "ne_reader"
GRANT ne_reader TO featureserv;

-- -- Grant USAGE and SELECT privileges to the "featureserv" role on the "physical" schema
-- GRANT USAGE ON SCHEMA physical TO featureserv;
-- GRANT SELECT ON ALL TABLES IN SCHEMA physical TO featureserv;
-- -- Ensure the role does not have the ability to modify the schema
-- REVOKE CREATE ON SCHEMA physical FROM featureserv;

-- -- Grant USAGE and SELECT privileges to the "featureserv" role on the "cultural" schema
-- GRANT USAGE ON SCHEMA cultural TO featureserv;
-- GRANT SELECT ON ALL TABLES IN SCHEMA cultural TO featureserv;
-- -- Ensure the role does not have the ability to modify the schema
-- REVOKE CREATE ON SCHEMA cultural FROM featureserv;


-- Grant USAGE and EXECUTE privileges to the "featureserv" role on the "postgisftw" schema
GRANT USAGE ON SCHEMA postgisftw TO featureserv;
GRANT EXECUTE ON FUNCTION postgisftw.countries_name_fs(text) TO featureserv;