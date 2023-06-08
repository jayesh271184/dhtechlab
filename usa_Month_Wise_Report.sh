#!/bin/bash

m=`date +%m`
y=`date +%Y`
mo=`date | awk '{ print $2}'`
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31

do 
sh /u01/scripts/report_script/usa_Daily_Report.sh $i $m $y 2015 ##>>/u01/MUM_"$mo"_File_Detail_Usage.txt
done
