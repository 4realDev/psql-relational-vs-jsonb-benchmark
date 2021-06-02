\echo *** CREATE BENCHMARK DATABASES WITH 1M RECORDS ***
\echo

DROP DATABASE IF EXISTS r_vs_jsonb_1m;

CREATE DATABASE r_vs_jsonb_1m
    WITH
    OWNER = postgres

\c "r_vs_jsonb_1m"

CREATE TABLE CUSTOMERS (
    CUSTOMERID serial PRIMARY KEY,
    FIRSTNAME varchar(50) NOT NULL,
    LASTNAME varchar(50) NOT NULL,
    ADDRESS1 varchar(50) NOT NULL,
    ADDRESS2 varchar(50),
    CITY varchar(50) NOT NULL,
    STATE varchar(50),
    ZIP varchar(9),
    COUNTRY varchar(50) NOT NULL,
    REGION smallint NOT NULL,
    EMAIL varchar(50),
    PHONE varchar(50),
    CREDITCARDTYPE int NOT NULL,
    CREDITCARD varchar(50) NOT NULL,
    CREDITCARDEXPIRATION varchar(50) NOT NULL,
    USERNAME varchar(50) NOT NULL,
    PASSWORD VARCHAR(50) NOT NULL,
    AGE smallint,
    INCOME int,
    GENDER varchar(1)
);

INSERT INTO CUSTOMERS (
    CUSTOMERID,
    FIRSTNAME,
    LASTNAME,
    ADDRESS1,
    ADDRESS2,
    CITY,
    STATE,
    ZIP,
    COUNTRY,
    REGION,
    EMAIL,
    PHONE,
    CREDITCARDTYPE,
    CREDITCARD,
    CREDITCARDEXPIRATION,
    USERNAME,
    PASSWORD,
    AGE,
    INCOME,
    GENDER)
	WITH tmp AS (
    SELECT
        MAX(CUSTOMERID) AS max
    FROM
        CUSTOMERS
)
SELECT
    COALESCE(tmp.max, g) AS CUSTOMERID, --customerid int between 1.000.001 and 10.000.000
    substr(md5(random()::text), 1, 50), -- firstname varchar(50)
    substr(md5(random()::text), 1, 50), -- lastname varchar(50)
    substr(md5(random()::text), 1, 50), --address1 varchar(50)
    NULL, --address2 varchar(50)
    substr(md5(random()::text), 1, 50), --city varchar(50)
    (ARRAY[
        'AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL','IN','IA',
        'KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM',
        'NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'])[floor(random()*51+1)::int], --state varchar(50) with 52 DISTINCT VALUES
    floor(random() * 99999)::int, --zip int max = 99999
    substr(md5(random()::text), 1, 50), -- country varchar(50)11 DISTINCT VALUES
    floor(random() * 2)::int, -- region smallint max = 2 ? 2 DISTINCT VALUES (1,2) - smallint
    substr(md5(random()::text), 1, 50), -- email varchar(50)
    substr(md5(random()::text), 1, 50), -- phone varchar(50)
    floor(random() * 5)::int, -- creditcardtype int max = 5
    substr(md5(random()::text), 1, 50), -- creditcard varchar(50)
    substr(md5(random()::text), 1, 50), -- creditcardexpiration varchar(50)
    substr(md5(random()::text), 1, 50), -- username varchar(50) is a DISTINCT value
    'password', -- password varchar(50) always password
    floor(random() * 100)::int, -- age smallint max = 100
    floor(random() * 100000)::int, -- income int max = 100000
    (ARRAY['F','M'])[floor(random()*2+1)::int] -- gender varchar(1) with 2 DISTINCT values (M,F)
FROM
    tmp,
    generate_series(1, 1000000) AS g;

\echo
\echo