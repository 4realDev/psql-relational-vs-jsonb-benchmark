\echo *** I. Point Query ***
\echo 

\echo SELECT
\echo     firstname,
\echo     lastname,
\echo     gender,
\echo     age
\echo FROM
\echo     customers
\echo WHERE
\echo     firstname = 'VKUUXF'
\echo     AND lastname = 'ITHOMQJNYX';

EXPLAIN ANALYZE SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';

SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';
SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';
SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';

\echo
\echo