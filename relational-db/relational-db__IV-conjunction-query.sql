\echo *** IV. Conjunction Query ***
\echo

\echo SELECT
\echo     firstname,
\echo     lastname,
\echo     gender,
\echo     age
\echo FROM
\echo     customers
\echo WHERE
\echo     age = 26
\echo     AND gender = 'F'

EXPLAIN ANALYZE SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';

SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';
SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';
SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';

\echo
\echo

