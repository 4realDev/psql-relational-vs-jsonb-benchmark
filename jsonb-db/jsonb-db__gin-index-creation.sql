\echo *** CREATE GIN INDEX FOR JSONB DATABASE ***
\echo

\echo DROP INDEX personal_gin_idx;
DROP INDEX personal_gin_idx;
\echo

\echo DROP INDEX location_gin_idx;
DROP INDEX location_gin_idx;

\echo

\echo CREATE INDEX personal_gin_idx ON customers_jsonb USING GIN (personal jsonb_path_ops);
CREATE INDEX personal_gin_idx ON customers_jsonb USING GIN (personal jsonb_path_ops);
\echo

\echo CREATE INDEX location_gin_idx ON customers_jsonb USING GIN (location jsonb_path_ops);
CREATE INDEX location_gin_idx ON customers_jsonb USING GIN (location jsonb_path_ops);

\echo
\echo


