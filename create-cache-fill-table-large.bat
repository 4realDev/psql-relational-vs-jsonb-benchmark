echo "Creating table for cache filling with 50M random records..."
echo "This could take several minutes. Please remain patient. Thank you"

set PGPASSWORD=postgres
psql -U postgres -d ds2_large -f create-cache-fill-table-large.sql
pause
