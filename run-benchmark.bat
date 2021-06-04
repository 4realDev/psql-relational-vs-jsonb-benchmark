set myPath=X:\psql-relational-vs-jsonb-benchmark
set /p myPath=Enter path or press [ENTER] for default [%myPath%]:
echo %myPath%

set user=postgres
set /p user=Enter user or press [ENTER] for default [%user%]:
echo %user%

set password=postgres
set /p password=Enter path or press [ENTER] for default [%password%]:
echo %password%

set database=ds2_50k
set /p database=Enter database [ds2_50k / ds2_100k / ds2_500k / ds2_1m / ds2_2m] or press [ENTER] for default [%database%]:
echo %database%

cd %myPath%
set PGPASSWORD=%password%
psql -U %user% -d %database% -f run-benchmark.sql

pause
@echo off
:pause
goto pause