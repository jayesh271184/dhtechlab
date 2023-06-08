export ORACLE_SID=zainwifi
export ORACLE_HOME=/u01/app11g/oracle/product/11.2.0/db_1
export PATH=$ORACLE_HOME/bin:$PATH
export DATE=`date '+%m%d%y_%H%M%S'`
date;
rman target /  << EOF

delete noprompt  archivelog all completed before 'sysdate-7';

run {
ALLOCATE CHANNEL CH1 DEVICE TYPE DISK;
ALLOCATE CHANNEL CH2 DEVICE TYPE DISK;
ALLOCATE CHANNEL CH3 DEVICE TYPE DISK ;
backup AS COMPRESSED BACKUPSET full database tag ORCL_FULL${DATE};
 }

delete noprompt backup device type disk completed before 'sysdate-15';

#echo "Full backup completed successfully"
#echo "======================================"
