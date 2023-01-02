BASE_DIR="/CGNATDATA/Pending_count_Nokia"
hostname=`hostname`
Report=/CGNATDATA/Pending_count_Nokia/Report/
mkdir -p ${Report}
DAY=`date +%Y%m%d`;
Server=`hostname -i`
dd=`date -d "-1 days" +%H`
YDAY=`date -d "-1 days" +%Y%m%d`;
OLD=`date -d "-2 days" +%Y%m%d`;
PHour=`date -d "-1 days" +"%-H"`

#find ${BASE_DIR}/. -type f -iname "*.csv" -mtime +1 -exec rm -rf {} \;
#rm -rf ${BASE_DIR}/*${OLD}*.csv
#rm -rf ${BASE_DIR}/*${YDAY}*.csv
echo -e "PendingFilecountSince,ServerHostname,ServerIP,PendingFilePath,PendingFileCount" > ${Report}/ReportNokia-PendingFileCount_${DAY}.csv
cat ${BASE_DIR}/*${DAY}*.csv|grep PendingFilecount-${dd}>> ${Report}/ReportNokia-PendingFileCount_${DAY}.csv

#scp ${Report}/Report-PendingFileCount_${DAY}.csv crestel@10.174.83.18:/tmp/ReportNokia.csv

#!bin/sh
log=/u01/COL_HC/Report
DAY=`date +%Y%m%d`;

cd $log
cat Report-PendingFileCount_${DAY}.csv |cut -d',' -f2|cut -c'1-10'|sort|uniq > HostShort.log
echo -e "Hostname,PendingFileCount,size(GB)" >${log}/Brief_${DAY}_PendingCount.csv
for i in `cat $log/HostShort.log`
do
k=`cat Report-PendingFileCount_${DAY}.csv|grep ${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s}'`
m=`cat Report-PendingFileCount_${DAY}.csv|grep ${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s*2/1024}'`
echo "$i,$k,$m" >> ${log}/Brief_${DAY}_PendingCount.csv
done
ktotal=`cat Report-PendingFileCount_${DAY}.csv|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s}'`
mtotal=`cat Report-PendingFileCount_${DAY}.csv|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s*2/1024}'`
echo "Total Backlog ,$ktotal,$mtotal" >> ${log}/Brief_${DAY}_PendingCount.csv