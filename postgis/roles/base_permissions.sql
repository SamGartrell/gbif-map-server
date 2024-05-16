-- Create a base ROLE for the database
CREATE ROLE ne_base NOINHERIT;

-- Grant CONNECT ON to the base role
GRANT CONNECT ON DATABASE natural_earth TO ne_base;

-- Grant USAGE and SELECT privileges to the "naturalearth" role on the "physical" schema
GRANT USAGE ON SCHEMA physical TO ne_base;
GRANT SELECT ON ALL TABLES IN SCHEMA physical TO ne_base;

-- Grant USAGE and SELECT privileges to the "readaccess" role on the "cultural" schema
GRANT USAGE ON SCHEMA cultural TO ne_base;
GRANT SELECT ON ALL TABLES IN SCHEMA cultural TO ne_base;