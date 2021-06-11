:: Script to start the generic database generation directly with the benchmark in the ds2 tool on WINDOWS
:: Copy paste this script into the same directory where the pgsqlds2_create_all.sh script from the ds2 GitHub Repo is
:: Execute the adjusted_pgsqlds2_create_all.bat script instead of the pgsqlds2_create_all.sh script

set connection=-h localhost -p 5432
set dbuser=ds2
set db=ds2
cd build
set PGPASSWORD=postgres

psql %connection% -U postgres -d postgres < pgsqlds2_create_db.sql
set PGPASSWORD=ds2
psql %connection% -U %dbuser% -d %db% < pgsqlds2_delete_all.sql
psql %connection% -U %dbuser% -d %db% < pgsqlds2_create_tbl.sql                                              
psql %connection% -U %dbuser% -d %db% < pgsqlds2_create_sp.sql
cd ../load/cust
psql %connection% -U %dbuser% -d %db% < pgsqlds2_load_cust.sql
cd ../orders
psql %connection% -U %dbuser% -d %db% < pgsqlds2_load_orders.sql 
psql %connection% -U %dbuser% -d %db% < pgsqlds2_load_orderlines.sql 
psql %connection% -U %dbuser% -d %db% < pgsqlds2_load_cust_hist.sql 
cd ../prod
psql %connection% -U %dbuser% -d %db% < pgsqlds2_load_prod.sql                                                             
psql %connection% -U %dbuser% -d %db% < pgsqlds2_load_inv.sql 
cd ../../build
                                                         
:: Commenting out the pgsqlds2_create_ind file, which is responsible for the index creation in the generated benchmark databasebenchmark
:: as the benchmark first tests the generated database without any indexes, and only then creates its own indexes (B-Tree and GIN), with which the database is tested again.
:: psql %connection% -U %dbuser% -d %db% < pgsqlds2_create_ind.sql

psql %connection% -U %dbuser% -d %db% < pgsqlds2_create_trig.sql                                                                           
psql %connection% -U %dbuser% -d %db% < pgsqlds2_reset_seq.sql
psql %connection% -U %dbuser% -d %db% < pgsqlds2_create_user.sql
psql %connection% -U %dbuser% -d %db% -c "VACUUM ANALYZE;"

@echo off
                                                                                                    
:: Get path to the (cloned) benchmark repository "psql-relational-vs-jsonb-benchmark"
set benchmarkRepoPath=C:\psql-relational-vs-jsonb-benchmark
echo Enter path of the benchmark GitHub repository "psql-relational-vs-jsonb-benchmark"
set /p benchmarkRepoPath=or press [ENTER] for default inside C:\ [%benchmarkRepoPath%]:
echo %benchmarkRepoPath%
cd /d %benchmarkRepoPath%

:: Run the benchmark on the generated database
psql %connection% -U %dbuser% -d %db% < run-benchmark.sql

:: Ensures that program does not terminate after completion
pause
@echo off
:pause
goto pause

