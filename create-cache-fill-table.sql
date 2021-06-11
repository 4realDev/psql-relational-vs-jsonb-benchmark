\echo *** CREATE CACHE FILL TABLE INSIDE BENCHMARK DATABASE ***
\echo

DROP TABLE IF EXISTS cache_fill_towns;

CREATE TABLE cache_fill_towns (
  id SERIAL UNIQUE NOT NULL,
  code VARCHAR(10) NOT NULL,
  article TEXT,
  name TEXT NOT NULL,
  department VARCHAR(4) NOT NULL
);

WITH tmp AS (SELECT COUNT(*) as customer_count FROM CUSTOMERS)
insert into cache_fill_towns (
	code, article, name, department
)
select
	left(md5(i::text), 10),
	md5(random()::text),
	md5(random()::text),
	left(md5(random()::text), 4)
from tmp, generate_series(1, customer_count) s(i);

\echo
\echo

