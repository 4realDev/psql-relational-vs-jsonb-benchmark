\echo *** DELETE RECORDS FROM THE RELATIONAL DB WITH B-TREE INDEX ***
\echo

\echo DELETE FROM customers WHERE customerid > 1000000;
DELETE FROM customers WHERE customerid > 1000000;

VACUUM ANALYZE

\echo
\echo


