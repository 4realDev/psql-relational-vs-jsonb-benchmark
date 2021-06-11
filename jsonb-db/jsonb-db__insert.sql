\echo 
\echo 
\echo *** INSERT RECORDS INTO JSONB DB WITH GIN INDEX ***
\echo 


\echo INSERT INTO customers_jsonb(customerid, personal, location, credit, login)
\echo WITH tmp as (SELECT MAX(customerid) as max FROM customers_jsonb)
\echo SELECT
\echo 	g + tmp.max as customerid,
\echo 	jsonb_build_object(
\echo 		'age', random()::integer * 100,
\echo 		'name', jsonb_build_object(
\echo 			'lastname', substr(md5(random()::text), 1, 50),	 
\echo 			'firstname', substr(md5(random()::text), 1, 50)
\echo 		),  
\echo 		'gender', substr(md5(random()::text), 1, 1),
\echo 		'income', random()::integer * 100000,
\echo 		'contact', jsonb_build_object(
\echo 			'email', substr(md5(random()::text), 1, 50),
\echo 			'phone', substr(md5(random()::text), 1, 50)
\echo 		)
\echo 	),
\echo 	
\echo 	jsonb_build_object(
\echo 		'zip', random()::integer * 99999,
\echo 		'city', substr(md5(random()::text), 1, 50),
\echo 		'state', substr(md5(random()::text), 1, 50),
\echo 		'region', random()::integer * 2,
\echo 		'country', substr(md5(random()::text), 1, 50),
\echo 		'address1', substr(md5(random()::text), 1, 50),
\echo 		'address2', NULL
\echo 	),
\echo 	
\echo 	jsonb_build_object(
\echo 		'creditcard', substr(md5(random()::text), 1, 50),
\echo 		'creditcardtype', random()::integer * 5,
\echo 		'creditcardexpiration', substr(md5(random()::text), 1, 50)
\echo 	),
\echo 	
\echo 	jsonb_build_object(
\echo 		'username', substr(md5(random()::text), 1, 50),
\echo 		'password', 'password'
\echo 	)
\echo FROM tmp, generate_series(1,max) as g;


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
FROM tmp, generate_series(1,max) as g;

VACUUM ANALYZE

\echo
\echo


