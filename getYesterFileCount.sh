#!/bin/bash


DBUSER='CRESTELMEDIATIONPRD501'
DBUSERPASSWORD='CRESTELMEDIATIONPRD501'
DB='cgfidea2'
underscore='_'
ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export ORACLE_HOME
ydate=`date -d '18 hour ago' '+%Y%m%d'`

#yesterdaycounter=23652
yesterdaycounter=$(/u01/app/oracle/product/11.2.0/db_1/bin/sqlplus -S $DBUSER/$DBUSERPASSWORD@$DB <<EOF

set pagesize 0 feedback off verify off heading off echo off;
select count(1) from ideacsvtotbl_counter_bck where name like 'processed_11$underscore$ydate%';
exit


EOF
)
mediationcount=`cat /home/oracle/db_csv/lsfilecount.txt`
mediationcount_sec=`cat /home/oracle/db_csv/lsfilecount_sec.txt`
dbfilecount=`echo $yesterdaycounter | sed -e 's/^[ \t]*//'`
Realcount=`expr $mediationcount + $mediationcount_sec`
countdiff=`expr $Realcount - $dbfilecount`
echo "Mediation Count is $mediationcount" "Sec Mediation Count is $mediationcount_sec" "DB File Count is $dbfilecount" "Count diff is $countdiff"
/bin/sh //home/oracle/dbscripts/sendsms.sh "count1=$mediationcount count2=$mediationcount_sec Total_Count=$Realcount DB_File_Count=$dbfilecount diff=$countdiff" '9712972907,9712906159'
echo `date` >> /home/oracle/db_csv/lsfilecountbackup.txt
#/bin/sh //home/oracle/dbscripts/sendsms.sh "count1=$mediationcount count2=$mediationcount_sec realcount=$Realcount DB_File_Count=$dbfilecount diff=$countdiff" '9510502800'
/bin/cat /home/oracle/db_csv/lsfilecount.txt >> /home/oracle/db_csv/lsfilecountbackup.txt
/bin/cat /home/oracle/db_csv/lsfilecount_sec.txt >> /home/oracle/db_csv/lsfilecountbackup.txt
/bin/cat /dev/null > /home/oracle/db_csv/lsfilecount.txt
/bin/cat /dev/null > /home/oracle/db_csv/lsfilecount_sec.txt
