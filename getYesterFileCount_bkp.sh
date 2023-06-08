#!/bin/bash


DBUSER='CRESTELMEDIATIONPRD501'
DBUSERPASSWORD='CRESTELMEDIATIONPRD501'
DB='cgfidea2'
underscore='_'
ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export ORACLE_HOME
ydate=`date -d '8 hour ago' '+%Y%m%d'`

yesterdaycounter=$(/u01/app/oracle/product/11.2.0/db_1/bin/sqlplus -S $DBUSER/$DBUSERPASSWORD@$DB <<EOF

set pagesize 0 feedback off verify off heading off echo off;
select count(1) from ideacsvtotbl_counter_bck where name like 'processed_11$underscore$ydate%';
exit


EOF
)
mediationcount=`cat /home/oracle/db_csv/lsfilecount.txt`
dbfilecount=`echo $yesterdaycounter | sed -e 's/^[ \t]*//'`
countdiff=`expr $mediationcount - $dbfilecount`
echo "Mediation Count is $mediationcount" "DB File Count is $dbfilecount" "Count diff is $countdiff"
/bin/sh //home/oracle/dbscripts/sendsms.sh "Mediation_Count=$mediationcount DB_File_Count=$dbfilecount diff=$countdiff" '9510502800,9891005321'
echo `date` >> /home/oracle/db_csv/lsfilecountbackup.txt
/bin/cat /home/oracle/db_csv/lsfilecount.txt >> /home/oracle/db_csv/lsfilecountbackup.txt
/bin/cat /dev/null > /home/oracle/db_csv/lsfilecount.txt
