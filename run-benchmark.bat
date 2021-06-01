:: set user=postgres
:: set /p user=Enter user or press [ENTER] for default [%user%]:
:: echo %user%
:: 
:: set password=postgres
:: set /p password=Enter path or press [ENTER] for default [%password%]:
:: echo %password%
:: 
:: set path=X:\psql-relational-vs-jsonb-benchmark
:: set /p path=Enter path or press [ENTER] for default [%path%]:
:: echo %path%
:: 
:: set database=ds2_500mb
:: set /p database=Enter database [ds2_minimal | ds2_500mb | ds2_large] or press [ENTER] for default [%database%]:
:: echo %database%
:: 
:: cd %path%
:: set PGPASSWORD=%postgres%
:: psql -U %user% -d %database% -f run-benchmark.sql


cd X:\psql-relational-vs-jsonb-benchmark

set PGPASSWORD=postgres
psql -U postgres -d ds2_500mb -f run-benchmark.sql

pause
@echo off
:pause
goto pause
