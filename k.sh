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
cat ${BASE_DIR}/*${DAY}*.csv|grep "PendingFilecount-"|grep -v ideaout|grep -v nbr_http|grep -v ftp_backup|grep -v Raw_files|grep -v Binary_backup|grep -v VF_Distributed|grep -v APP_BACKUP|grep -v INT_BACKUP|grep -v ftp_IDEA|grep -v crestelsetup|grep -v Raw_Edr_Archived|grep -v binary_backup|grep -v mozilla|grep -v config|grep -v redhat|grep -v RECON|grep -v APPLICATION|grep -v Serverlog|grep -v VF_distributed|grep -v deliverables|grep -v stlmediationsetup|grep -v hexdump|grep -v Recon|grep -v Packages|grep -v app-log|grep -v non_natted|grep -v IntellzaMoved|grep -v IDEA_|
grep -v ARCH|grep -v CGF_CDR_DATA_bkp|grep -v ftp_d >> ${Report}/Report-PendingFileCount_${DAY}.csv

sh ${Report}/brief_new.sh

scp ${Report}/Report-PendingFileCount_${DAY}.csv crestel@10.174.83.18:/tmp/Report-PendingFileCount_${DAY}.csv
scp ${Report}/Brief_${DAY}_PendingCount_New.csv crestel@10.174.83.18:/tmp/Brief_${DAY}_PendingCount.csv
sed -i 's/^/PendingFilecount,/g' /u01/COL_HC/CGFLogs/CISCO-CGF_FILE.csv
#scp /u01/COL_HC/CGFLogs/CISCO-CGF_FILE.csv crestel@10.174.83.18:/tmp/Report_CGF_${DAY}_PendingCount.csv
scp /u01/COL_HC/CGFLogs/CISCO-CGF_FILE.csv crestel@10.174.83.18:/u01/COL_HC/Cisco_All_${DAY}_PendingCount.csv
