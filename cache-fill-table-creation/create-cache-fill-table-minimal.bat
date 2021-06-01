echo "Creating table for cache filling with 20K random records..."
echo "This could take several minutes. Please remain patient. Thank you"

set PGPASSWORD=postgres
psql -U postgres -d ds2_minimal -f create-cache-fill-table-minimal.sql
pause
