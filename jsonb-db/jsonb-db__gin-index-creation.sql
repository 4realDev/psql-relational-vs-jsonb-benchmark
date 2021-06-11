\echo *** CREATE GIN INDEX FOR JSONB DATABASE ***
\echo

\echo DROP INDEX personal_gin_idx;
DROP INDEX IF EXISTS personal_gin_idx;
\echo

\echo DROP INDEX location_gin_idx;
DROP INDEX IF EXISTS location_gin_idx;

\echo

\echo CREATE INDEX personal_gin_idx ON customers_jsonb USING GIN (personal jsonb_path_ops);
CREATE INDEX personal_gin_idx ON customers_jsonb USING GIN (personal jsonb_path_ops);
\echo

\echo CREATE INDEX location_gin_idx ON customers_jsonb USING GIN (location jsonb_path_ops);
CREATE INDEX location_gin_idx ON customers_jsonb USING GIN (location jsonb_path_ops);

\echo
\echo *** INDEX SIZE ***
\echo

SELECT pg_size_pretty(pg_table_size('personal_gin_idx')) as personal_gin_idx;
\echo
SELECT pg_size_pretty(pg_table_size('location_gin_idx')) as location_gin_idx;

\echo
\echo


