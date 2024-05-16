-- FUNCTION: postgisftw.countries_name(text)

-- DROP FUNCTION IF EXISTS postgisftw.countries_name(text);

CREATE OR REPLACE FUNCTION postgisftw.countries_name(
	name_prefix text DEFAULT 'A'::text)
    RETURNS TABLE(name text, abbrev text, continent text, geom geometry) 
    LANGUAGE 'plpgsql'
    COST 100
    STABLE PARALLEL SAFE 
    ROWS 1000

AS $BODY$
BEGIN
	RETURN QUERY
		SELECT t.name::text,
            t.abbrev::text,
            t.continent::text,
            t.geom
    FROM cultural.ne_10m_admin_0_countries_lakes t
    WHERE t.name ILIKE name_prefix || '%';
END;
$BODY$;

ALTER FUNCTION postgisftw.countries_name(text)
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION postgisftw.countries_name(text) TO featureserv;

COMMENT ON FUNCTION postgisftw.countries_name(text)
    IS 'Filters the countries table by the initial letters of the name using the "name_prefix" parameter.';
