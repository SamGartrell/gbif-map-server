-- TODO: Reconfigure "postgrest" anto inherit permissions from "readacess"

-- create "web_anon" role for postgrest access
CREATE ROLE web_anon nologin;
-- Grant USAGE and SELECT privileges to the "web_anon" role on the "api" schema
GRANT USAGE ON SCHEMA api TO web_anon;
GRANT SELECT ON api.todos TO web_anon;

-- create "authenticator" role for postgrest access
CREATE ROLE authenticator noinherit LOGIN PASSWORD 'postgrest';
-- Grant "web_anon" usage of "authenticator" role for postgrest access
GRANT web_anon TO authenticator;