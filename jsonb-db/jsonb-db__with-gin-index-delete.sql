\echo *** DELETE RECORDS FROM JSONB DB WITH GIN INDEX ***
\echo

\echo DELETE FROM customers_jsonb WHERE customerid > 1000000;
DELETE FROM customers_jsonb WHERE customerid > 1000000;

VACUUM ANALYZE

\echo
\echo


