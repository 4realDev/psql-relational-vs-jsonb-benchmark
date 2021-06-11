\echo *** CREATE B-TREE INDEX FOR RELATIONAL DATABASE ***
\echo

\echo DROP INDEX firstname_lastname_idx;
DROP INDEX IF EXISTS firstname_lastname_idx;
\echo

\echo DROP INDEX state_idx;
DROP INDEX IF EXISTS state_idx;
\echo

\echo DROP INDEX age_below_twenty_six_idx;
DROP INDEX IF EXISTS age_below_twenty_six_idx;
\echo

\echo DROP INDEX age_below_twenty_six_gender_female_idx;
DROP INDEX IF EXISTS age_below_twenty_six_gender_female_idx;

\echo

\echo CREATE INDEX firstname_lastname_idx ON customers USING btree (firstname, lastname);
CREATE INDEX firstname_lastname_idx ON customers USING btree (firstname, lastname);
\echo

\echo CREATE INDEX state_idx ON customers USING btree (state);
CREATE INDEX state_idx ON customers USING btree(state);
\echo

\echo CREATE INDEX age_below_twenty_six_idx ON customers USING btree (age)
\echo WHERE age >= 26;
CREATE INDEX age_below_twenty_six_idx ON customers USING btree(age) WHERE age >= 26;
\echo

\echo CREATE INDEX age_below_twenty_six_gender_female_idx ON customers USING btree (age, gender)
\echo WHERE age = 26 AND gender = 'F';
CREATE INDEX age_below_twenty_six_gender_female_idx ON customers USING btree(age, gender) WHERE age = 26 AND gender='F';

\echo
\echo *** INDEX SIZE ***
\echo

SELECT pg_size_pretty(pg_table_size('firstname_lastname_idx')) as firstname_lastname_idx;
\echo
SELECT pg_size_pretty(pg_table_size('state_idx')) as state_idx;
\echo
SELECT pg_size_pretty(pg_table_size('age_below_twenty_six_idx')) as age_below_twenty_six_idx;
\echo
SELECT pg_size_pretty(pg_table_size('age_below_twenty_six_gender_female_idx')) as age_below_twenty_six_gender_female_idx;

\echo
\echo


