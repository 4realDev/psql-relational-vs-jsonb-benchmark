\echo 
\echo 
\echo *** DELETE RECORDS FROM JSONB DB WITH GIN INDEX ***
\echo

\echo DELETE
\echo FROM CUSTOMERS_JSONB
\echo WHERE customerid > (SELECT ((COUNT(*)/2)) FROM CUSTOMERS_JSONB);

DELETE
FROM CUSTOMERS_JSONB
WHERE customerid > (SELECT ((COUNT(*)/2)) FROM CUSTOMERS_JSONB);

VACUUM ANALYZE

\echo
\echo


