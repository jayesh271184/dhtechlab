export ORACLE_SID=zainwifi
export ORACLE_HOME=/u01/app11g/oracle/product/11.2.0/db_1
export PATH=$ORACLE_HOME/bin:$PATH
export DATE=`date '+%d%m%y_%H%M%S'`

echo "========================================="
date;
echo "========================================="
echo " "
echo " "

expdp system/system directory=DATA_PUMP_DIR dumpfile=eliteaaa_${DATE}.dmp logfile=eliteaaa_${DATE}.log schemas=eliteaaa
expdp system/system directory=DATA_PUMP_DIR dumpfile=webin_${DATE}.dmp logfile=webin_${DATE}.log schemas=webin

#=======Remove backup files older than 2 days=========
find /u01/app11g/oracle/admin/zainwifi/dpdump/ -maxdepth 1 -type f -name '*.log.gz' -mtime +2 -exec rm -rf {} \;
find /u01/app11g/oracle/admin/zainwifi/dpdump/ -maxdepth 1 -type f -name '*.dmp.gz' -mtime +2 -exec rm -rf {} \;

#=======gzip dmp & log files==========================
find /u01/app11g/oracle/admin/zainwifi/dpdump/ -maxdepth 1 -type f -name '*.log' -mtime -2 -exec gzip {} \;
find /u01/app11g/oracle/admin/zainwifi/dpdump/ -maxdepth 1 -type f -name '*.dmp' -mtime -2 -exec gzip {} \;

#======Move backup files to secondary DB ==============
cd /u01/app11g/oracle/admin/zainwifi/dpdump/ ;
echo "================list All .gz files ======================";
ls -ltr|grep .gz ;
sshpass -p 'oracle' scp *.gz oracle@10.22.222.37:/u01/app11g/oracle/admin/zainwifisec/dpdump/.

#=====================================================

echo "=================================================="

exit;
