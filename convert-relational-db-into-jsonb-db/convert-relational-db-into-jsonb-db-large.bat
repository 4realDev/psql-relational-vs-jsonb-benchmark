echo "Converting relational customers data table into jsonb customers_jsonb data table..."

set PGPASSWORD=postgres
psql -U postgres -d ds2_large -f convert-relational-db-into-jsonb-db.sql
pause