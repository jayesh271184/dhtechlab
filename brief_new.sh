#!bin/sh
log=/u01/COL_HC/Report
DAY=`date +%Y%m%d`;
sh ${log}/hostupdate_New.sh
rm -rf ${log}/Brief_${DAY}_PendingCount_New.csv
cat ${log}/Report-PendingFileCount_${DAY}_New.csv |cut -d',' -f2|sort|uniq > ${log}/HostShort_New.log
echo -e "Hostname,PendingFileCount,size(GB)" >${log}/Brief_${DAY}_PendingCount_New.csv
for i in `cat $log/HostShort_New.log`
do
k=`cat ${log}/Report-PendingFileCount_${DAY}_New.csv|grep ${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s}'`
m=`cat ${log}/Report-PendingFileCount_${DAY}_New.csv|grep ${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s*2/1024}'`
echo "$i,$k,$m" >> ${log}/Brief_${DAY}_PendingCount_New.csv
done
ktotal=`cat ${log}/Report-PendingFileCount_${DAY}_New.csv|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s}'`
mtotal=`cat ${log}/Report-PendingFileCount_${DAY}_New.csv|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s*2/1024}'`
echo "Total Backlog ,$ktotal,$mtotal" >> ${log}/Brief_${DAY}_PendingCount_New.csv

echo -e " brief successfully Executed"

sh ${log}/hostupdate_New.sh
