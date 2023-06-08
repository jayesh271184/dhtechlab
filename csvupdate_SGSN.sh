
export ORACLE_SID=cgfidea2
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export PATH=$ORACLE_HOME/bin:$PATH

/bin/chmod 777 /home/oracle/db_csv/SGSNCOUNTER.csv
/u01/app/oracle/product/11.2.0/db_1/bin/sqlplus crestelmediationprd501/crestelmediationprd501@cgfidea4 <<EOF

spool SP_ALLCSVREPORTBCKTBL_SGSN_UPD.txt

set serveroutput on;
set time on;
exec SP_ALLCSVREPORTBCKTBL_SGSN_UPD;
exec SP_IDEACSVTOTBL_COUNTER_SGSN;
commit;

exit


EOF
echo  `date`  >> /home/oracle/db_csv/counterbackup_SGSN.csv 
cat  /home/oracle/db_csv/SGSNCOUNTER.csv >> /home/oracle/db_csv/counterbackup_SGSN.csv
cat /dev/null > /home/oracle/db_csv/SGSNCOUNTER.csv
