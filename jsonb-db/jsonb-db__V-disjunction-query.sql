\echo *** V. Disjunction Query ***
\echo 

\echo SELECT
\echo     personal #> '{personal, name}' ->> 'firstname' AS "firstname",
\echo     personal #> '{personal, name}' ->> 'lastname' AS "lastname",
\echo     personal -> 'personal' ->> 'gender' AS "gender",
\echo     personal -> 'personal' ->> 'age' AS "age"
\echo FROM
\echo     customers_jsonb
\echo WHERE
\echo     personal@ > '{"personal": {"age": 26}}'
\echo     OR personal@ > '{"personal": {"gender": "F"}}';

EXPLAIN ANALYSE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
OR personal@>'{"personal": {"gender": "F"}}'; 

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
OR personal@>'{"personal": {"gender": "F"}}'; 

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
OR personal@>'{"personal": {"gender": "F"}}'; 

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
OR personal@>'{"personal": {"gender": "F"}}'; 

\echo
\echo