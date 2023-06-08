#!/bin/bash
#Script Name - EPS_counter.sh
#Created On - 11/10/2017
#Created by - Harsh Jain
#Purpose - Count Total records and Peak EPS in a day and print to a file
#Crontab entry - 0 2 * * * sh /opt1/IPLMS/crestelsetup/scripts/EPS_counter.sh

Y=`date -d "-1 days" +"%Y"`;
M=`date -d "-1 days" +"%-m"`;
D=`date -d "-1 days" +"%-d"`;
#TD=`date +%d`;

pdate=`date -d "-1 days" +%Y/%m/%d`;

spath=/opt1/IPLMS/COLLECTION_ROOT/STATISTICS/PARSING_SERVICE

rcount=`zcat $spath/$Y/$M/$D/* |cut -d',' -f7|cut -d":" -f2|sort|tail -1`;
eps=`zcat $spath/$Y/$M/$D/* |cut -d',' -f9|cut -d":" -f2|sort|tail -1;`

echo "Date=$pdate,Total_Record_Received=$rcount,Peak_EPS_of_the_day=$eps" >> /opt1/IPLMS/crestelsetup/scripts/output/EPS_count_$M-$Y.txt;