\echo *** V. Disjunction Query ***
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
\echo     OR gender = 'F';

EXPLAIN ANALYZE SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';

SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';
SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';
SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';

\echo
\echo
