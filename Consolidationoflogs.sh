BASE_DIR="/u01/COL_HC"
hostname=`hostname`
Report=/u01/COL_HC/Report
DAY=`date +%Y%m%d`;
Server=`hostname -i`
YDAY=`date -d "-1 days" +%Y%m%d`;
OLD=`date -d "-2 days" +%Y%m%d`;
PHour=`date -d "-1 days" +"%-H"`

#find ${BASE_DIR}/. -type f -iname "*.csv" -mtime +1 -exec rm -rf {} \;
rm -rf ${BASE_DIR}/*${OLD}*.csv
rm -rf ${BASE_DIR}/*${YDAY}*.csv
echo -e "PendingFilecountSince,ServerHostname,ServerIP,PendingFilePath,PendingFileCount" > ${Report}/Report-PendingFileCount_${DAY}.csv
cat ${BASE_DIR}/*${DAY}*.csv|grep "PendingFilecount-"|grep -v IDEA_|grep -v Recon|grep -v Packages|grep -v app-log|grep -v non_natted|grep -v ARCH|grep -v ftp_d >> ${Report}/Report-PendingFileCount_${DAY}.csv

scp ${Report}/Report-PendingFileCount_${DAY}.csv crestel@10.174.83.18:/tmp/Report.csv