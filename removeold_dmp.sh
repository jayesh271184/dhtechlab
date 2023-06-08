echo "============================================"
date;
echo "============================================"

echo " "

cd /u01/app11g/oracle/admin/zainwifisec/dpdump ;
echo "================list All .gz files======================";

ls -ltr|grep .gz ;
echo " "
echo " "
echo "========Display Eligible files to be removed ==> files older than 1 day=============" ;

#======= Display Eligible files to be removed, files older than 1 day =========

find /u01/app11g/oracle/admin/zainwifisec/dpdump/ -maxdepth 1 -type f -name '*.gz' -mtime +1 -exec ls -ltr {} \;

#======= Remove backup files older than 1 day =========

find /u01/app11g/oracle/admin/zainwifisec/dpdump/ -maxdepth 1 -type f -name '*.log.gz' -mtime +1 -exec rm -rf {} \;
find /u01/app11g/oracle/admin/zainwifisec/dpdump/ -maxdepth 1 -type f -name '*.dmp.gz' -mtime +1 -exec rm -rf {} \;

#======================================================
echo " "
echo " "

cd /u01/app11g/oracle/admin/zainwifisec/dpdump ;
echo "================list All .gz files After Removal======================";

ls -ltr|grep .gz ;

echo "============================================"


