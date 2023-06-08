
cd /home/oracle/db_csv/
cp /home/oracle/db_csv/SGSNCOUNTER.csv /home/oracle/db_csv/SGSNCOUNTER_2.csv
chown oracle:oinstall /home/oracle/db_csv/SGSNCOUNTER_2.csv
chmod 777 /home/oracle/db_csv/SGSNCOUNTER_2.csv

export ORACLE_SID=cgfidea2
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export PATH=$ORACLE_HOME/bin:$PATH

#ctl_loc = /home/oracle/db_csv/IDEACSVTOTBL_COUNTER_3.ctl

cd  /home/oracle/db_csv/

/u01/app/oracle/product/11.2.0/db_1/bin/sqlldr crestelmediationprd501/crestelmediationprd501@cgfidea4 control=IDEACSVTOTBL_COUNTER_SGSN.ctl
