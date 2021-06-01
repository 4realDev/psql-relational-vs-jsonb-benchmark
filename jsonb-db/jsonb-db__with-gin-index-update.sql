\echo *** UPDATE RECORDS FROM THE JSONB DB WITH GIN INDEX ***
\echo 


\echo UPDATE
\echo     customers_jsonb
\echo SET
\echo     location = jsonb_set(location, '{location}', location -> 'location' || '{"region": "3"}'),
\echo     credit = jsonb_set(credit, '{creditcardtype}', '6')
\echo WHERE
\echo     location@ > '{"location": {"country": "China"}}';


UPDATE customers_jsonb SET location = jsonb_set(location, '{location}', location->'location' || '{"region": "3"}'),
credit = jsonb_set(credit, '{creditcardtype}', '6')
WHERE location@>'{"location": {"country": "China"}}';

VACUUM ANALYZE

\echo
\echo






