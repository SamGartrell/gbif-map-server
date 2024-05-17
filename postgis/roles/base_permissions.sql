-- Create a reader ROLE for the datareader
CREATE ROLE gbif_reader NOINHERIT; -- it cannot inherit from any other account

-- Grant CONNECT ON to the reader role
GRANT CONNECT ON DATABASE gbif TO gbif_reader;

-- Grant USAGE and SELECT privileges to the "gbif_reader" role on the "fungus" schema
GRANT USAGE ON SCHEMA fungus TO gbif_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA fungus TO gbif_reader;

-- Grant USAGE and SELECT privileges to the "gbif_reader" role on the "invasive" schema
GRANT USAGE ON SCHEMA invasive TO gbif_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA invasive TO gbif_reader;

-- Grant USAGE and SELECT privileges to the "gbif_reader" role on the "endangered" schema
GRANT USAGE ON SCHEMA endangered TO gbif_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA endangered TO gbif_reader;

-- Grant USAGE and SELECT privileges to the "gbif_reader" role on the "edible" schema
GRANT USAGE ON SCHEMA edible TO gbif_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA edible TO gbif_reader;