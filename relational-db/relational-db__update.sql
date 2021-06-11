\echo
\echo
\echo *** UPDATE RECORDS FROM THE RELATIONAL DB WITH B-TREE INDEX ***
\echo 


\echo UPDATE
\echo     customers
\echo SET
\echo     region = 3,
\echo     creditcardtype = 6
\echo WHERE
\echo     country = 'China';


UPDATE customers SET region = 3, creditcardtype = 6
WHERE country = 'China';

VACUUM ANALYZE

\echo
\echo


