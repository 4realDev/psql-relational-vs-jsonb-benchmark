\echo *** II. Multipoint Query ***
\echo 

\echo SELECT
\echo     firstname,
\echo     lastname,
\echo     gender,
\echo     age
\echo FROM
\echo     customers
\echo WHERE
\echo     state = 'SD';

EXPLAIN ANALYZE SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';

SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';
SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';
SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';

\echo
\echo



