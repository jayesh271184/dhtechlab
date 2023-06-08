#!/bin/sh
LOG=/u01/scripts_log/EPS.log
ssh root@10.164.7.19 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3  >$LOG
ssh root@10.164.7.1 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3	 >>$LOG
ssh root@10.164.7.7  sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3 >>$LOG
ssh root@10.164.7.13  sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3>>$LOG  
ssh root@10.164.7.25 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3 >>$LOG 
ssh root@10.164.7.31 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3 >>$LOG 
ssh root@10.164.7.20 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3  >>$LOG
ssh root@10.164.7.2  sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3  >>$LOG 
ssh root@10.164.7.8  sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3  >>$LOG
ssh root@10.164.7.14 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3  >>$LOG
ssh root@10.164.7.26 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3  >>$LOG
ssh root@10.164.7.32 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3  >>$LOG
ssh root@10.164.7.37 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3 >>$LOG 
ssh root@10.164.7.38 sh /u01/scripts/report_script/EPS_Detail_Daily.sh $1 $2 $3 >>$LOG

echo "$1/$2/$3 :: `cat $LOG | awk -F ':' '{print$2}' | awk '{s+=$1} END {print s}'`"
