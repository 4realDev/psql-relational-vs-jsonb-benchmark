-- To fill the cache before the benchmark, a table with x random records was created.
-- This table is querried with a simple "SELECT *"

\o ignore.txt

\echo > overriding cache <
SELECT * FROM cache_fill_towns;
\echo
\echo

\o




