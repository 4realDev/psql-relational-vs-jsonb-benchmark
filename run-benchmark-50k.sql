\echo
\echo ______________________________________________________________________
\echo
\echo *** SETUP ***
\echo

\i create-benchmark-databases/create-benchmark-database-50k.sql
\i create-cache-fill-tables/create-cache-fill-table-50k.sql
\i convert-relational-db-into-jsonb-db.sql

\echo
\echo ______________________________________________________________________
\echo
\echo *** BENCHMARK BETWEEN RELATIONAL AND JSONB DATABASE ***
\echo

\i run-benchmark.sql

\echo
\echo ______________________________________________________________________