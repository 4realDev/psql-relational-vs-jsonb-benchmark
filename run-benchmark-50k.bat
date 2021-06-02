@echo off

set PGPASSWORD=postgres
psql -U postgres -d postgres -f run-benchmark-50k.sql

pause
@echo off
:pause
goto pause