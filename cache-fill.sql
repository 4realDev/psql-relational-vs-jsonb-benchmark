-- Run this commands in the command line to execute the filling:
-- cd C:\_CURRENT\FS21\Seminar_Datenbanksysteme\Postgres 1o1\JSON-MAPPING
-- set PGPASSWORD=postgres
-- psql -U postgres -d test-data-100M -f initial-cache-fill.sql
-- 
-- To fill the cache before the benchmark, a table with 200M random records was created.
-- This table is querried with a simple "SELECT *"
-- 
-- To create the random table with the 50M records use the following code:


\o ignore.txt

\echo > overriding cache <
SELECT * FROM towns;
\echo
\echo

\o




