\echo *** III. Range Query ***
\echo 

\echo SELECT
\echo     firstname,
\echo     lastname,
\echo     gender,
\echo     age
\echo FROM
\echo     customers
\echo WHERE
\echo     age >= 26;

EXPLAIN ANALYZE SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;

SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;
SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;
SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;

\echo
\echo


