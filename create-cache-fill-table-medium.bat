echo "Creating table for cache filling with 1M random records..."
echo "This could take several minutes. Please remain patient. Thank you"

set PGPASSWORD=postgres
psql -U postgres -d ds2_500mb -f create-cache-fill-table-medium.sql
pause
