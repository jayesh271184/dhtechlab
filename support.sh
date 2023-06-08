Y=`date -d "-1 days" +"%Y"`;
M=`date -d "-1 days" +"%-m"`;
D=`date -d "-1 days" +"%-d"`;
TD=`date +%d%m%Y`;

pdate=`date -d "-1 days" +%Y/%m/%d`;
STATPATH=/opt/iplms/stats/;
spath=/opt/iplms/stats/NATFLOWBINARY_COLLECTION_SERVICE/
rcount=`zcat $spath/$Y/$M/$D/* |cut -d',' -f3|cut -d":" -f2|sort -n|tail -1`;
eps=`zcat $spath/$Y/$M/$D/* |cut -d',' -f5|cut -d":" -f2|sort -n|tail -1`;
Diskopt=`/bin/df -Pm |grep -E opt|awk '{print $(NF-1)}'|cut -d'%' -f1`;
backlogfilecount=`ls -lRth /opt/iplms/File/natlog_col/192.168.252.*/|grep "Netflow"|wc -l`;
#for i in `ls -lRth /opt/iplms/File/natlog_col/192.168.252.*/|grep "Netflow"|cut -d'_' -f3|cut -c1-10|sort|uniq`;do echo -n $i,;done;
echo "Date=$pdate" >>$STATPATH/log-$TD.log
echo "Total_Record_Received=$rcount">>$STATPATH/log-$TD.log
echo "Peak_EPS_of_the_day=$eps">>$STATPATH/log-$TD.log
echo "UsedDiskOPT=$Diskopt">>$STATPATH/log-$TD.log
echo "File count in collection path = $backlogfilecount">>$STATPATH/log-$TD.log
echo -n "File Times stamp in backlogs =" >>$STATPATH/log-$TD.log
for i in `ls  /opt/iplms/File/natlog_col/192.168.252.*/|grep "Netflow"|cut -d'_' -f3|cut -c1-10|sort|uniq`;do echo -n $i,  ;done >>$STATPATH/log-$TD.log
echo >>$STATPATH/log-$TD.log
