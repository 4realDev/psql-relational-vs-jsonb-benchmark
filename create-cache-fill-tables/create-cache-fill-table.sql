\echo *** CREATE CACHE FILL TABLE FOR DATABASES WITH 50K RECORDS ***
\echo

DROP TABLE IF EXISTS cache_fill_towns;

DECLARE benchmark_table_count int;
SET benchmark_table_count = SELECT COUNT(*) FROM CUSTOMERS;

CREATE TABLE cache_fill_towns (
  id SERIAL UNIQUE NOT NULL,
  code VARCHAR(10) NOT NULL,
  article TEXT,
  name TEXT NOT NULL,
  department VARCHAR(4) NOT NULL
);

insert into cache_fill_towns (
	code, article, name, department
)
select
	left(md5(i::text), 10),
	md5(random()::text),
	md5(random()::text),
	left(md5(random()::text), 4)
from generate_series(1, benchmark_table_count) s(i);

\echo
\echo

