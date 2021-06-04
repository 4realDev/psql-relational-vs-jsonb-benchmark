\echo
\echo ______________________________________________________________________
\echo

\echo *** SETUP ***
\echo

\i create-cache-fill-tables/create-cache-fill-table.sql
\i convert-relational-db-into-jsonb-db.sql
\timing on
\echo

\echo
\echo ______________________________________________________________________
\echo

\echo *** BENCHMARK BETWEEN RELATIONAL AND JSONB DATABASE ***
\echo

\echo *** RELATIONAL DATABASE WITHOUT INDEX ***
\echo
\echo

\i cache-fill.sql
\o relational-db/results/relational-db__I-point-query-without-index.txt
\i relational-db/relational-db__I-point-query.sql 
\o

\i cache-fill.sql
\o relational-db/results/relational-db__II-multipoint-query-without-index.txt
\i relational-db/relational-db__II-multipoint-query.sql
\o

\i cache-fill.sql
\o relational-db/results/relational-db__III-range-query-query-without-index.txt
\i relational-db/relational-db__III-range-query.sql
\o

\i cache-fill.sql
\o relational-db/results/relational-db__IV-conjunction-query-without-index.txt
\i relational-db/relational-db__IV-conjunction-query.sql
\o

\i cache-fill.sql
\o relational-db/results/relational-db__V-disjunction-query-without-index.txt
\i relational-db/relational-db__V-disjunction-query.sql
\o



\echo *** JSONB DATABASE WITHOUT INDEX ***

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__I-point-query-without-index.txt
\i jsonb-db/jsonb-db__I-point-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__II-multipoint-query-without-index.txt
\i jsonb-db/jsonb-db__II-multipoint-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__III-range-query-without-index.txt
\i jsonb-db/jsonb-db__III-range-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__IV-conjunction-query-without-index.txt
\i jsonb-db/jsonb-db__IV-conjunction-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__V-disjunction-query-without-index.txt
\i jsonb-db/jsonb-db__V-disjunction-query.sql
\o



\echo *** RELATIONAL DATABASE WITH B-TREE INDEX ***

\i relational-db/relational-db__btree-index-creation.sql

\i cache-fill.sql
\o relational-db/results/relational-db__I-point-query-with-btree-index.txt
\i relational-db/relational-db__I-point-query.sql
\o

\i cache-fill.sql
\o relational-db/results/relational-db__II-multipoint-query-with-btree-index.txt
\i relational-db/relational-db__II-multipoint-query.sql
\o

\i cache-fill.sql
\o relational-db/results/relational-db__III-range-query-query-with-btree-index.txt
\i relational-db/relational-db__III-range-query.sql
\o

\i cache-fill.sql
\o relational-db/results/relational-db__IV-conjunction-query-with-btree-index.txt
\i relational-db/relational-db__IV-conjunction-query.sql
\o

\i cache-fill.sql
\o relational-db/results/relational-db__V-disjunction-query-with-btree-index.txt
\i relational-db/relational-db__V-disjunction-query.sql
\o



\echo *** JSONB DATABASE WITH GIN INDEX ***

\i jsonb-db/jsonb-db__gin-index-creation.sql

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__I-point-query-with-gin-index.txt
\i jsonb-db/jsonb-db__I-point-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__II-multipoint-query-with-gin-index.txt
\i jsonb-db/jsonb-db__II-multipoint-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__III-range-query-with-gin-index.txt
\i jsonb-db/jsonb-db__III-range-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__IV-conjunction-query-with-gin-index.txt
\i jsonb-db/jsonb-db__IV-conjunction-query.sql
\o

\i cache-fill.sql
\o jsonb-db/results/jsonb-db__V-disjunction-query-with-gin-index.txt
\i jsonb-db/jsonb-db__V-disjunction-query.sql
\o

-- *** INSERT, DELETE AND UPDATE RECORDS IN RELATIONAL DB WITH B-TREE INDEX ***
-- \i relational-db/relational-db__insert.sql
-- \i relational-db/relational-db__delete.sql
-- \i relational-db/relational-db__update.sql

-- *** INSERT, DELETE AND UPDATE RECORDS IN JSONB DB WITH GIN INDEX ***
-- \i jsonb-db/jsonb-db__insert.sql
-- \i jsonb-db/jsonb-db__delete.sql
-- \i jsonb-db/jsonb-db__update.sql

\echo
\echo ______________________________________________________________________
