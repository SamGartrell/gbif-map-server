
-- Create the Natural Earth PostGIS DB
CREATE DATABASE natural_earth
    WITH
    OWNER = postgres
    TEMPLATE = template_postgis
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- create schemas to store natural earth data
CREATE SCHEMA physical;
CREATE SCHEMA cultural;
