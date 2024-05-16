CREATE OR REPLACE
FUNCTION postgisftw.countries_name_ts(
            z integer, x integer, y integer,
            name_prefix text default 'B')
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(t.geom, 3857), bounds.geom) AS geom,
        t.name
      FROM cultural.ne_10m_admin_0_countries_lakes t, bounds
      WHERE ST_Intersects(t.geom, ST_Transform(bounds.geom, 4326))
      AND upper(t.name) LIKE (upper(name_prefix) || '%')
    )
    SELECT ST_AsMVT(mvtgeom, 'postgisftw.countries_name_ts') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION postgisftw.countries_name_ts IS 'Filters the countries table by the initial letters of the name using the "name_prefix" parameter.';
