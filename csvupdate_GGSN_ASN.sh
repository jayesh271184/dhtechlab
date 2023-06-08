#/home/oracle/.bash_profile
#!/bin/bash

export ORACLE_SID=cgfidea2
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export PATH=$ORACLE_HOME/bin:$PATH
counterfile='/home/oracle/db_csv/ggsncounter.csv'
ctime=`date -d now '+%Y%m%d_%HH_%MM'`
newpath=/home/oracle/db_csv/counterfiles/
ctr=ggsncounter
underscore='_'
csv='.csv'
newname=$ctr$underscore$ctime$csv
if [ -s $counterfile ]
then

echo `date`
filecount=`wc -l $counterfile`
#filetotalcount= `wc -l`
echo "File has $filecount record"
#/u01/app/oracle/product/11.2.0/db_1/bin/sqlldr crestelmediationprd501/crestelmediationprd501 control=IDEACSVTOTBL_COUNTER_3.ctl
/u01/app/oracle/product/11.2.0/db_1/bin/sqlplus crestelmediationprd501/crestelmediationprd501@cgfidea4 <<EOF


 


 

spool SP_GGSNASNCSVREPORTBCKTBL_UPD.txt 


set serveroutput on;
set time on;
exec SP_GGSNASNCSVREPORTBCKTBL_UPD;
commit;
exit


EOF
else
echo `date`
echo "File size is zero"

fi

echo  `date`  >> /home/oracle/db_csv/ggsncounterbackup.csv 
cat  /home/oracle/db_csv/ggsncounter.csv >> /home/oracle/db_csv/ggsncounterbackup.csv
/bin/cp $counterfile $newpath$newname
cat /dev/null > /home/oracle/db_csv/ggsncounter.csv
