#!bin/sh
log=/u01/COL_HC/Report
DAY=`date +%Y%m%d`;
rm -rf ${log}/Brief_${DAY}_PendingCount.csv
cat ${log}/Report-PendingFileCount_${DAY}.csv |cut -d',' -f2|cut -c'1-10'|sort|uniq > ${log}/HostShort.log
echo -e "Hostname,PendingFileCount,size(GB)" >${log}/Brief_${DAY}_PendingCount.csv
for i in `cat $log/HostShort.log`
do
k=`cat ${log}/Report-PendingFileCount_${DAY}.csv|grep ${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s}'`
m=`cat ${log}/Report-PendingFileCount_${DAY}.csv|grep ${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s*2/1024}'`
echo "$i,$k,$m" >> ${log}/Brief_${DAY}_PendingCount.csv
done
ktotal=`cat ${log}/Report-PendingFileCount_${DAY}.csv|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s}'`
mtotal=`cat ${log}/Report-PendingFileCount_${DAY}.csv|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s*2/1024}'`
echo "Total Backlog ,$ktotal,$mtotal" >> ${log}/Brief_${DAY}_PendingCount.csv

echo -e " brief successfully Executed"

sh ${log}/hostupdate.sh
