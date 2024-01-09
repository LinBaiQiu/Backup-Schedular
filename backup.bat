@echo off
echo Starting Backup of Database  %1

@ECHO off
:: GET DATE and TIME
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"

if %MM%==01 set Month=JAN
if %MM%==02 set Month=FEB
if %MM%==03 set Month=MAR
if %MM%==04 set Month=APR
if %MM%==05 set Month=MAY
if %MM%==06 set Month=JUN
if %MM%==07 set Month=JUL
if %MM%==08 set Month=AUG
if %MM%==09 set Month=SEP
if %MM%==10 set Month=OCT
if %MM%==11 set Month=NOV
if %MM%==12 set Month=DEC

:: GIVE Backup file name (database_name_)
set bkupfilename=%1 database_name_%DD% %Month% %YYYY%%HH%%Min%%Sec%.sql  
echo Backing up to file: %bkupfilename%

:: GIVE Backup file name (database_name)  and path name (D:\backup\)
mysqldump -u root --password=mysql4535 database_name > D:\backup\"%bkupfilename%"

echo Database Backup Complete!
exit