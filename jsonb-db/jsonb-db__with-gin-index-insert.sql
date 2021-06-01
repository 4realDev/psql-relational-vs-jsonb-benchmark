\echo *** INSERT RECORDS INTO JSONB DB WITH GIN INDEX ***
\echo 


\echo INSERT INTO customers_jsonb (customerid, personal, location, credit, login)
\echo WITH tmp AS (
\echo     SELECT
\echo         MAX(customerid) AS max
\echo     FROM
\echo         customers_jsonb
\echo )
\echo SELECT
\echo     g + tmp.max AS customerid,
\echo     jsonb_build_object('age', random()::integer * 100, 'name', jsonb_build_object('lastname', substr(md5(random()::text), 1, 50), 'firstname', substr(md5(random()::text), 1, 50)), 'gender', substr(md5(random()::text), 1, 1), 'income', random()::integer * 100000, 'contact', jsonb_build_object('email', substr(md5(random()::text), 1, 50), 'phone', substr(md5(random()::text), 1, 50))),
\echo     jsonb_build_object('zip', random()::integer * 99999, 'city', substr(md5(random()::text), 1, 50), 'state', substr(md5(random()::text), 1, 50), 'region', random()::integer * 2, 'country', substr(md5(random()::text), 1, 50), 'address1', substr(md5(random()::text), 1, 50), 'address2', NULL),
\echo     jsonb_build_object('creditcard', substr(md5(random()::text), 1, 50), 'creditcardtype', random()::integer * 5, 'creditcardexpiration', substr(md5(random()::text), 1, 50)),
\echo     jsonb_build_object('username', substr(md5(random()::text), 1, 50), 'password', 'password')
\echo FROM
\echo     tmp,
\echo     generate_series(1, 2500000) AS g;


INSERT INTO customers_jsonb(customerid, personal, location, credit, login)
WITH tmp as (SELECT MAX(customerid) as max FROM customers_jsonb)
SELECT
	g + tmp.max as customerid,
	jsonb_build_object(
		'age', random()::integer * 100,
		'name', jsonb_build_object(
			'lastname', substr(md5(random()::text), 1, 50),	 
			'firstname', substr(md5(random()::text), 1, 50)
		),  
		'gender', substr(md5(random()::text), 1, 1),
		'income', random()::integer * 100000,
		'contact', jsonb_build_object(
			'email', substr(md5(random()::text), 1, 50),
			'phone', substr(md5(random()::text), 1, 50)
		)
	),
	
	jsonb_build_object(
		'zip', random()::integer * 99999,
		'city', substr(md5(random()::text), 1, 50),
		'state', substr(md5(random()::text), 1, 50),
		'region', random()::integer * 2,
		'country', substr(md5(random()::text), 1, 50),
		'address1', substr(md5(random()::text), 1, 50),
		'address2', NULL
	),
	
	jsonb_build_object(
		'creditcard', substr(md5(random()::text), 1, 50),
		'creditcardtype', random()::integer * 5,
		'creditcardexpiration', substr(md5(random()::text), 1, 50)
	),
	
	jsonb_build_object(
		'username', substr(md5(random()::text), 1, 50),
		'password', 'password'
	)
FROM tmp, generate_series(1,2500000) as g;

VACUUM ANALYZE

\echo
\echo


