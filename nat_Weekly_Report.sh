#!/bin/sh

DATE=`date +%c`
NODE=AHD
echo -e "============================>>>${G} $NODE NAT File Summary ${N}<<<==========================="
echo -e "${SK}System Date ${N}: $DATE"
echo "====================================================================================="

a=`date +%F -d 'now -168 hour'`
m1=`echo $a | awk -F '-' '{print$2}'`
#echo $m1
d1=`echo $a | awk -F '-' '{print$3}'`
#echo $d1
Y1=`echo $a | awk -F '-' '{print$1}'`
#echo $Y1

b=`date +%F -d 'now -144 hour'`
m2=`echo $b | awk -F '-' '{print$2}'`
#echo $m2
d2=`echo $b | awk -F '-' '{print$3}'`
#echo $d2
Y2=`echo $b | awk -F '-' '{print$1}'`
#echo $Y2

c=`date +%F -d 'now -120 hour'`
m3=`echo $c | awk -F '-' '{print$2}'`
#echo $m3
d3=`echo $c | awk -F '-' '{print$3}'`
#echo $d3
Y3=`echo $c | awk -F '-' '{print$1}'`
#echo $Y3

d=`date +%F -d 'now -96 hour'`
m4=`echo $d | awk -F '-' '{print$2}'`
#echo $m4
d4=`echo $d | awk -F '-' '{print$3}'`
#echo $d4
Y4=`echo $d | awk -F '-' '{print$1}'`
#echo $Y4

e=`date +%F -d 'now -72 hour'`
m5=`echo $e | awk -F '-' '{print$2}'`
#echo $m5
d5=`echo $e | awk -F '-' '{print$3}'`
#echo $d5
Y5=`echo $e | awk -F '-' '{print$1}'`
#echo $Y5

f=`date +%F -d 'now -48 hour'`
m6=`echo $f | awk -F '-' '{print$2}'`
#echo $m6
d6=`echo $f | awk -F '-' '{print$3}'`
#echo $d6
Y6=`echo $f | awk -F '-' '{print$1}'`
#echo $Y6

g=`date +%F -d 'now -24 hour'`
m7=`echo $g | awk -F '-' '{print$2}'`
#echo $m7
d7=`echo $g | awk -F '-' '{print$3}'`
#echo $d7
Y7=`echo $g | awk -F '-' '{print$1}'`
#echo $Y7


sh /u01/scripts/report_script/nat_Daily_Report.sh ${d1} ${m1} ${Y1}
sh /u01/scripts/report_script/nat_Daily_Report.sh ${d2} ${m2} ${Y2}
sh /u01/scripts/report_script/nat_Daily_Report.sh ${d3} ${m3} ${Y3}
sh /u01/scripts/report_script/nat_Daily_Report.sh ${d4} ${m4} ${Y4}
sh /u01/scripts/report_script/nat_Daily_Report.sh ${d5} ${m5} ${Y5}
sh /u01/scripts/report_script/nat_Daily_Report.sh ${d6} ${m6} ${Y6}
sh /u01/scripts/report_script/nat_Daily_Report.sh ${d7} ${m7} ${Y7}

