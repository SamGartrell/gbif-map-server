-- TODO: Reconfigure "tileserv" and "featureserv" to inherit permissions from "readacess"

-- -- Create the "tileserv" user with a password that inherits the "ne_reader" role
CREATE ROLE tileserv WITH LOGIN PASSWORD 'tileserv';
-- Inherit permissions from "ne_reader"
GRANT ne_reader TO tileserv;

-- -- Grant USAGE and SELECT privileges to the "tileserv" role on the "physical" schema
-- GRANT USAGE ON SCHEMA physical TO tileserv;
-- GRANT SELECT ON ALL TABLES IN SCHEMA physical TO tileserv;
-- -- Ensure the role does not have the ability to modify the schema
-- REVOKE CREATE ON SCHEMA physical FROM tileserv;

-- -- Grant USAGE and SELECT privileges to the "tileserv" role on the "cultural" schema
-- GRANT USAGE ON SCHEMA cultural TO tileserv;
-- GRANT SELECT ON ALL TABLES IN SCHEMA cultural TO tileserv;
-- -- Ensure the role does not have the ability to modify the schema
-- REVOKE CREATE ON SCHEMA cultural FROM tileserv;

-- Grant USAGE and EXECUTE privileges to the "tileserv" role on the "postgisftw" schema
GRANT USAGE ON SCHEMA postgisftw TO tileserv;
GRANT EXECUTE ON FUNCTION postgisftw.countries_name_ts(integer, integer, integer, text) TO tileserv;