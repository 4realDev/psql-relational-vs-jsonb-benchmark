\echo *** I. Point Query ***
\echo 

\echo SELECT
\echo     personal #> '{personal, name}' ->> 'firstname' AS "firstname",
\echo     personal #> '{personal, name}' ->> 'lastname' AS "lastname",
\echo     personal -> 'personal' ->> 'gender' AS "gender",
\echo     personal -> 'personal' ->> 'age' AS "age"
\echo FROM
\echo     customers_jsonb
\echo WHERE
\echo     personal@ > '{"personal": {"name": {"firstname": "VKUUXF"}}}'
\echo     AND personal@ > '{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}';

EXPLAIN ANALYZE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 

SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 

\echo
\echo