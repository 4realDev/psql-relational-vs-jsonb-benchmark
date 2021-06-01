\echo *** II. Multipoint Query ***
\echo 

\echo SELECT
\echo     personal #> '{personal, name}' ->> 'firstname' AS "firstname",
\echo     personal #> '{personal, name}' ->> 'lastname' AS "lastname",
\echo     personal -> 'personal' ->> 'gender' AS "gender",
\echo     personal -> 'personal' ->> 'age' AS "age"
\echo FROM
\echo     customers_jsonb
\echo WHERE
\echo     location@ > '{"location": {"state": "SD"}}';

EXPLAIN ANALYZE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

\echo
\echo



