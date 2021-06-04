\echo *** CREATE B-TREE INDEX FOR RELATIONAL DATABASE ***
\echo

\echo DROP INDEX firstname_lastname_idx;
DROP INDEX IF EXISTS firstname_lastname_idx;
\echo

\echo DROP INDEX state_idx;
DROP INDEX IF EXISTS state_idx;
\echo

\echo DROP INDEX age_above_fifthy_idx;
DROP INDEX IF EXISTS age_above_fifthy_idx;
\echo

\echo DROP INDEX age_above_fifthy_gender_male_idx;
DROP INDEX IF EXISTS age_above_fifthy_gender_male_idx;

\echo

\echo CREATE INDEX firstname_lastname_idx ON customers USING btree (firstname, lastname);
CREATE INDEX firstname_lastname_idx ON customers USING btree (firstname, lastname);
\echo

\echo CREATE INDEX state_idx ON customers USING btree (state);
CREATE INDEX state_idx ON customers USING btree(state);
\echo

\echo CREATE INDEX age_above_fifthy_idx ON customers USING btree (age)
\echo WHERE age >= 26;
CREATE INDEX age_above_fifthy_idx ON customers USING btree(age) WHERE age >= 26;
\echo

\echo CREATE INDEX age_above_fifthy_gender_male_idx ON customers USING btree (age, gender)
\echo WHERE age = 26 AND gender = 'F';
CREATE INDEX age_above_fifthy_gender_male_idx ON customers USING btree(age, gender) WHERE age = 26 AND gender='F';

\echo
\echo


