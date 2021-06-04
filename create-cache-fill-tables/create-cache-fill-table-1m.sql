\echo *** CREATE CACHE FILL TABLE FOR DATABASES WITH 1M RECORDS ***
\echo

DROP TABLE IF EXISTS cache_fill_towns;

CREATE TABLE cache_fill_towns (
  id SERIAL UNIQUE NOT NULL,
  code VARCHAR(10) NOT NULL,
  article TEXT,
  name TEXT NOT NULL,
  department VARCHAR(4) NOT NULL
);

INSERT INTO cache_fill_towns (
	code, article, name, department
)
SELECT
	left(md5(i::text), 10),
	md5(random()::text),
	md5(random()::text),
	left(md5(random()::text), 4)
FROM generate_series(1, 1000000) s(i);

\echo
\echo

