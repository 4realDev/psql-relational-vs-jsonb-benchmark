
/*
      To run the Script type the following commands in your windows console:
      cd C:\_CURRENT\HSR\FS21\Seminar_Datenbanksysteme\Postgres 1o1\JSON-MAPPING
      set PGPASSWORD=postgres
      psql -U postgres -d ds2_500mb -f relational-jsonb-benchmark.sql

      To see the Queries inside regions install the "#region folding for VS Code extension".
      Source: https://marketplace.visualstudio.com/items?itemName=maptz.regionfolder

	  prompt $p$g
	  EXPLAIN ANALYSE


*/

-- vacuum nur nach update insert delete operationen
-- \i Datei nachladen

-- 1. APT-TENNIS-CACHE-FILL.sql
-- 2. VACUUM-ANALYZE.sql

-- 3. CREATE B-TREE INDEX
-- 3. RELATIONAL-DB-POINT-QUERY.sql
-- 4. RELATIONAL-DB-POINT-QUERY.sql
-- 5. RELATIONAL-DB-POINT-QUERY.sql

-- 6. RELATIONAL-DB-MULTIPOINT-QUERY.sql
-- 7. RELATIONAL-DB-MULTIPOINT-QUERY.sql
-- 8. RELATIONAL-DB-MULTIPOINT-QUERY.sql

-- nicht nötig die Indexe zu droppen
-- Datenbank aufräumen indem sie ganz gelöscht werden

--timing on
\i config.psql
\echo
\echo Benchmark between relational and jsonb databases with 1.000.000 records
\echo

\echo *** RELATIONAL DATABASE WITHOUT ANY INDEX ***
\echo

/* #region I. Point Query  */
\echo *** I. Point Query ***
\echo

-- \echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE customerid = 99283;
-- EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE customerid = 99283;

\echo EXPLAIN ANALYZE SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';
EXPLAIN ANALYZE SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';

SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';
SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';
SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';
GOTO eof 

\echo
\echo
/* #endregion */
/* #region II. Multipoint Query  */
\echo *** II. Multipoint Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';

\echo
\echo
/* #endregion */
/* #region III. Range Query  */
\echo *** III. Range Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;
\echo
\echo
/* #endregion */
/* #region IV. Conjunction Query  */
\echo *** IV. Conjunction Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';
\echo
\echo
/* #endregion */
/* #region V. Disjunction Query  */
\echo *** V. Disjunction Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';
\echo
\echo
/* #endregion */

\echo *** RELATIONAL DATABASE WITH B-TREE INDEX ***
\echo

/* #region  CREATE B-TREE INDEXES */
\echo CREATE INDEX state_idx ON customers USING btree(state);
CREATE INDEX state_idx ON customers USING btree(state);
\echo

\echo CREATE INDEX age_above_fifthy_idx ON customers USING btree(age) WHERE age >= 26;
CREATE INDEX age_above_fifthy_idx ON customers USING btree(age) WHERE age >= 26;
\echo

\echo CREATE INDEX age_above_fifthy_gender_male_idx ON customers USING btree(age, gender) WHERE age = 26 AND gender='F';
CREATE INDEX age_above_fifthy_gender_male_idx ON customers USING btree(age, gender) WHERE age = 26 AND gender='F';
\echo
/* #endregion */

/* #region I. Point Query  */
-- Not necessary to create index for primary key
\echo *** I. Point Query ***
\echo

-- \echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE customerid = 99283;
-- EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE customerid = 99283;

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE firstname = 'VKUUXF' AND lastname = 'ITHOMQJNYX';

\echo
\echo
/* #endregion */
/* #region II. Multipoint Query  */
\echo *** II. Multipoint Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE state = 'SD';

\echo
\echo
/* #endregion */
/* #region III. Range Query  */
\echo *** III. Range Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age >= 26;

\echo
\echo
/* #endregion */
/* #region IV. Conjunction Query  */
\echo *** IV. Conjunction Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 AND gender='F';

\echo
\echo
/* #endregion */
/* #region V. Disjunction Query  */
-- also uses the age_above_fifthy_gender_male_idx
\echo *** V. Disjunction Query ***
\echo

\echo EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';
EXPLAIN SELECT firstname, lastname, gender, age FROM customers WHERE age = 26 OR gender='F';

\echo
\echo
/* #endregion */



-- !!! INDEXE SOLLEN NICHT GELÖSCHT WERDEN !!!

/* #region  DROP B-TREE INDEXES */
-- \echo DROP INDEX state_idx;
-- DROP INDEX state_idx;
-- \echo

-- \echo DROP INDEX age_above_fifthy_gender_male_idx;
-- DROP INDEX age_above_fifthy_gender_male_idx;
-- \echo

-- \echo DROP INDEX age_above_fifthy_gender_male_idx;
-- DROP INDEX age_above_fifthy_gender_male_idx;
-- \echo
/* #endregion */

\echo *** JSONB DATABASE WITHOUT INDEX ***
\echo

/* #region I. Point Query */
-- Not necessary to create index for primary key
\echo *** I. Point Query ***
\echo

-- \echo EXPLAIN SELECT 
-- \echo personal#>'{personal, name}'->>'firstname' as "firstname",
-- \echo personal#>'{personal, name}'->>'lastname' as "lastname",
-- \echo personal->'personal'->>'gender' as "gender",
-- \echo personal->'personal'->>'age' as "age"
-- \echo FROM customers_jsonb WHERE customerid = 99283;

-- EXPLAIN SELECT 
-- personal#>'{personal, name}'->>'firstname' as "firstname",
-- personal#>'{personal, name}'->>'lastname' as "lastname",
-- personal->'personal'->>'gender' as "gender",
-- personal->'personal'->>'age' as "age"
-- FROM customers_jsonb WHERE customerid = 99283;

\echo EXPLAIN ANALYZE SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb 
\echo WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
\echo AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 

EXPLAIN ANALYZE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 


\echo
\echo
/* #endregion */
/* #region II. Multipoint Query */
\echo *** II. Multipoint Query ***
\echo

\echo EXPLAIN SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

EXPLAIN SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

\echo
\echo
/* #endregion */
/* #region III. Range Query  */
\echo *** III. Range Query ***
\echo

\echo EXPLAIN SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb WHERE personal->'personal'->>'age'>='26';

EXPLAIN SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE personal->'personal'->>'age'>='26';

\echo
\echo
/* #endregion */
/* #region IV. Conjunction Query  */
\echo *** IV. Conjunction Query ***
\echo

\echo EXPLAIN ANALYSE SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb 
\echo WHERE personal@> '{"personal": {"age": 26}}' 
\echo AND personal@>'{"personal": {"gender": "F"}}'; 

EXPLAIN ANALYSE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
AND personal@>'{"personal": {"gender": "F"}}'; 

\echo
\echo
/* #endregion */
/* #region V. Disjunction Query  */
\echo *** V. Disjunction Query ***
-- also uses the age_above_fifthy_gender_male_idx
\echo

\echo EXPLAIN ANALYSE SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb 
\echo WHERE personal@> '{"personal": {"age": 26}}' 
\echo OR personal@>'{"personal": {"gender": "F"}}'; 

EXPLAIN ANALYSE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
OR personal@>'{"personal": {"gender": "F"}}'; 

\echo
\echo
/* #endregion */

\echo *** JSONB DATABASE WITH GIN INDEX ***
\echo

/* #region  CREATE GIN INDEXES */
\echo CREATE INDEX personal_gin_idx ON customers_jsonb USING GIN(personal jsonb_path_ops);
CREATE INDEX personal_gin_idx ON customers_jsonb USING GIN(personal jsonb_path_ops);
\echo

\echo CREATE INDEX location_gin_idx ON customers_jsonb USING GIN(location jsonb_path_ops);
CREATE INDEX location_gin_idx ON customers_jsonb USING GIN(location jsonb_path_ops);
\echo
/* #endregion */

/* #region I. Point Query */
-- Not necessary to create index for primary key
\echo *** I. Point Query ***
\echo

-- \echo EXPLAIN SELECT 
-- \echo personal#>'{personal, name}'->>'firstname' as "firstname",
-- \echo personal#>'{personal, name}'->>'lastname' as "lastname",
-- \echo personal->'personal'->>'gender' as "gender",
-- \echo personal->'personal'->>'age' as "age"
-- \echo FROM customers_jsonb WHERE customerid = 99283;

-- EXPLAIN SELECT 
-- personal#>'{personal, name}'->>'firstname' as "firstname",
-- personal#>'{personal, name}'->>'lastname' as "lastname",
-- personal->'personal'->>'gender' as "gender",
-- personal->'personal'->>'age' as "age"
-- FROM customers_jsonb WHERE customerid = 99283;

\echo EXPLAIN ANALYZE SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb 
\echo WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
\echo AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 

EXPLAIN ANALYZE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"name": {"firstname": "VKUUXF"}}}' 
AND personal@>'{"personal": {"name": {"lastname": "ITHOMQJNYX"}}}'; 

\echo
\echo
/* #endregion */
/* #region II. Multipoint Query */
\echo *** II. Multipoint Query ***
\echo

\echo EXPLAIN SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

EXPLAIN SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE location@>'{"location": {"state": "SD"}}';

\echo
\echo
/* #endregion */
/* #region III. Range Query  */
\echo *** III. Range Query ***
\echo

\echo EXPLAIN SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb WHERE personal->'personal'->>'age'>='26';

EXPLAIN SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb WHERE personal->'personal'->>'age'>='26';

\echo
\echo
/* #endregion */
/* #region IV. Conjunction Query  */
\echo *** IV. Conjunction Query ***
\echo

\echo EXPLAIN ANALYSE SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb 
\echo WHERE personal@> '{"personal": {"age": 26}}' 
\echo AND personal@> '{"personal": {"gender": "F"}}'; 

EXPLAIN ANALYSE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
AND personal@> '{"personal": {"gender": "F"}}'; 

\echo
\echo
/* #endregion */
/* #region V. Disjunction Query  */
\echo *** V. Disjunction Query ***
-- also uses the age_above_fifthy_gender_male_idx
\echo

\echo EXPLAIN ANALYSE SELECT 
\echo personal#>'{personal, name}'->>'firstname' as "firstname",
\echo personal#>'{personal, name}'->>'lastname' as "lastname",
\echo personal->'personal'->>'gender' as "gender",
\echo personal->'personal'->>'age' as "age"
\echo FROM customers_jsonb 
\echo WHERE personal@> '{"personal": {"age": 26}}' 
\echo OR personal@> '{"personal": {"gender": "F"}}'; 

EXPLAIN ANALYSE SELECT 
personal#>'{personal, name}'->>'firstname' as "firstname",
personal#>'{personal, name}'->>'lastname' as "lastname",
personal->'personal'->>'gender' as "gender",
personal->'personal'->>'age' as "age"
FROM customers_jsonb 
WHERE personal@> '{"personal": {"age": 26}}' 
OR personal@> '{"personal": {"gender": "F"}}'; 

\echo
\echo
/* #endregion */






-- WIRD ZEIT KOSTEN WEGEN DEM INDEX
-- 2 EINFÜGE ZENARIOS
-- EINMAL FÜR RELATIONAL MIT B-TREE
-- EINMAL FÜR JSON MIT GIN
-- DER PREIS: BEIM EINFÜGEN INDEX EINFÜGEN - WIRD ZEIT KOSTEN






-- !!! INDEXE SOLLEN NICHT GELÖSCHT WERDEN !!!

-- /* #region  DROP GIN INDEXES */
-- \echo DROP INDEX personal_gin_idx;
-- DROP INDEX personal_gin_idx;
-- \echo

-- \echo DROP INDEX location_gin_idx;
-- DROP INDEX location_gin_idx;
-- \echo
-- /* #endregion */





\echo *** INSERT RECORDS INTO THE RELATIONAL DB WITH B-TREE ***
\echo

/* #region INSERT RECORDS INTO THE RELATIONAL DB WITH B-TREE */
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
	SELECT
		floor(random()* (10000000-1000000 + 1) + 1000000), --customerid int between 1.000.001 and 10.000.000

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
FROM generate_series(1,100);
-- SOLL EINE MINUTE DAUERN ODER ZWEI
/* #endregion */

VACUUM ANALYZE

\echo *** DELETE RECORDS FROM THE RELATIONAL DB ***
\echo

\echo DELETE FROM customers WHERE customerid > 1000000;
DELETE FROM customers WHERE customerid > 1000000;

VACUUM ANALYZE

\echo *** UPDATE RECORDS FROM THE RELATIONAL DB ***
\echo

\echo UPDATE customers SET region = 3, creditcardtype = 6 WHERE country = 'China';
UPDATE customers SET region = 3, creditcardtype = 6
WHERE country = 'China';

VACUUM ANALYZE

-- SELECT firstname, lastname, gender, age, creditcardtype, region FROM customers WHERE country = 'China' AND country = 'Japan';

\echo *** INSERT RECORDS INTO JSONB DB ***
\echo

/* #region INSERT RECORDS INTO JSONB DB */
INSERT INTO customers_jsonb(customerid, personal, location, credit, login)
SELECT
	floor(random()* (10000000-1000000 + 1) + 1000000), --customerid int between 1.000.000 and 2.000.000
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
FROM generate_series(1,100);
/* #endregion */

\echo *** DELETE RECORDS FROM JSONB DB ***
\echo
DELETE FROM customers_jsonb WHERE customerid > 1000000;

\echo *** UPDATE RECORDS FROM THE JSONB DB ***
\echo

\echo UPDATE customers_jsonb SET location = jsonb_set(location, '{location}', location->'location' || '{"region": "3"}'),
\echo credit = jsonb_set(credit, '{creditcardtype}', '6')
\echo WHERE location@>'{"location": {"country": "China"}}';
UPDATE customers_jsonb SET location = jsonb_set(location, '{location}', location->'location' || '{"region": "3"}'),
credit = jsonb_set(credit, '{creditcardtype}', '6')
WHERE location@>'{"location": {"country": "China"}}';



-- SELECT 
-- personal#>'{personal, name}'->>'firstname' as "firstname",
-- personal#>'{personal, name}'->>'lastname' as "lastname",
-- personal->'personal'->>'gender' as "gender",
-- personal->'personal'->>'age' as "age",
-- location->'location'->>'region' as "region",
-- credit->'creditcardtype' as "creditcardtype"
-- FROM customers_jsonb 
-- WHERE location@>'{"location": {"country": "China"}}';



-- other queries
-- SELECT * FROM customers ORDER BY customerid DESC;
-- SELECT * FROM customers_jsonb WHERE login @> '{"login": {"username": "test"}}'
-- SELECT * FROM customers_jsonb WHERE personal@> '{"personal": {"age": ""}}' 
-- DELETE FROM customers_jsonb WHERE personal#>'{personal,age}' IS NULL
-- SELECT * FROM customers_jsonb