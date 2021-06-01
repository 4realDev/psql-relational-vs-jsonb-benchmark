\echo "Creating table for cache filling with 50M random records..."
\echo "This could take several minutes. Please remain patient. Thank you"

DROP TABLE towns_50m;

CREATE TABLE towns_50m (
  id SERIAL UNIQUE NOT NULL,
  code VARCHAR(10) NOT NULL,
  article TEXT,
  name TEXT NOT NULL,
  department VARCHAR(4) NOT NULL
);

insert into towns_50m (
	code, article, name, department
)
select
	left(md5(i::text), 10),
	md5(random()::text),
	md5(random()::text),
	left(md5(random()::text), 4)
from generate_series(1, 50000000) s(i);

