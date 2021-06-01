\echo *** INSERT RECORDS INTO THE RELATIONAL DB WITH B-TREE INDEX ***
\echo 


\echo INSERT INTO customers (customerid, firstname, lastname, address1, address2, city, state, zip, country, region, email, phone, creditcardtype, creditcard, creditcardexpiration, username, PASSWORD, age, income, gender)
\echo WITH tmp AS (
\echo     SELECT
\echo         MAX(customerid) AS max
\echo     FROM
\echo         customers
\echo )
\echo SELECT
\echo     g + tmp.max AS customerid,
\echo     substr(md5(random()::text), 1, 50),
\echo     substr(md5(random()::text), 1, 50),
\echo     substr(md5(random()::text), 1, 50),
\echo     NULL,
\echo     substr(md5(random()::text), 1, 50),
\echo     substr(md5(random()::text), 1, 50),
\echo     random()::integer * 99999,
\echo     substr(md5(random()::text), 1, 50),
\echo     random()::integer * 2,
\echo     substr(md5(random()::text), 1, 50),
\echo     substr(md5(random()::text), 1, 50),
\echo     random()::integer * 5,
\echo     substr(md5(random()::text), 1, 50),
\echo     substr(md5(random()::text), 1, 50),
\echo     substr(md5(random()::text), 1, 50),
\echo     'password',
\echo     random()::integer * 100,
\echo     random()::integer * 100000,
\echo     substr(md5(random()::text), 1, 1)
\echo FROM
\echo     tmp,
\echo     generate_series(1, 2500000) AS g;


INSERT INTO customers(
	customerid, 
	firstname, 
	lastname, 
	address1, 
	address2, 
	city, 
	state, 
	zip, 
	country, 
	region, 
	email, 
	phone, 
	creditcardtype, 
	creditcard, 
	creditcardexpiration, 
	username, 
	password, 
	age, 
	income, 
	gender)
	WITH tmp as (SELECT MAX(customerid) as max FROM customers)
	SELECT
		g + tmp.max as customerid, --customerid int between 1.000.001 and 10.000.000

		substr(md5(random()::text), 1, 50),	-- firstname varchar(50)
		substr(md5(random()::text), 1, 50),	-- lastname varchar(50) 

		substr(md5(random()::text), 1, 50),	--address1 varchar(50) 
		NULL,	--address2 varchar(50)
		substr(md5(random()::text), 1, 50),	--city varchar(50)
		substr(md5(random()::text), 1, 50),	--state varchar(50) with 52 DISTINCT VALUES
		random()::integer * 99999,	--zip int max = 99999 
		substr(md5(random()::text), 1, 50),	-- country varchar(50)11 DISTINCT VALUES
		random()::integer * 2,	-- region smallint max = 2 ? 2 DISTINCT VALUES (1,2) - smallint

		substr(md5(random()::text), 1, 50),	-- email varchar(50) 
		substr(md5(random()::text), 1, 50),	-- phone varchar(50) 

		random()::integer * 5, -- creditcardtype int max = 5 
		substr(md5(random()::text), 1, 50),	-- creditcard varchar(50)
		substr(md5(random()::text), 1, 50),	-- creditcardexpiration varchar(50)

		substr(md5(random()::text), 1, 50),	-- username varchar(50) is a DISTINCT value
		'password',	-- password varchar(50) always password

		random()::integer * 100,	-- age smallint max = 100 
		random()::integer * 100000,	-- income int max = 100000
		substr(md5(random()::text), 1, 1)	-- gender varchar(1) with 2 DISTINCT values (M,F)
FROM tmp, generate_series(1,2500000) as g;

VACUUM ANALYZE

\echo
\echo


