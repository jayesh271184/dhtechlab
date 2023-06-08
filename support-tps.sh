Y=`date -d "-1 days" +"%Y"`;
M=`date -d "-1 days" +"%-m"`;
D=`date -d "-1 days" +"%-d"`;
TD=`date +%d%m%Y`;

pdate=`date -d "-1 days" +%Y/%m/%d`;
STATPATH=/opt/iplms/stats/;
spath=/opt/iplms/stats/NATFLOWBINARY_COLLECTION_SERVICE/
rcount=`zcat $spath/$Y/$M/$D/* |cut -d',' -f3|cut -d":" -f2|sort -n|tail -1`;
eps=`zcat $spath/$Y/$M/$D/* |cut -d',' -f5|cut -d":" -f2|sort -n|tail -1`;
echo "Date=$pdate" >>$STATPATH/log-$TD.log
echo "Total_Record_Received=$rcount">>$STATPATH/log-$TD.log
echo "Peak_EPS_of_the_day=$eps">>$STATPATH/log-$TD.log
echo >>$STATPATH/log-$TD.log
