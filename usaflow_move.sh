#!/bin/sh

##########################################

THRESHOLD=50

#########################################
NODE=CH1
DATE=`date '+%Y%m%d'`
CUDATE=`date '+%b %d %H:%M:%S %Y'`
DD=`date '+%c'`
DATE1=`date '+%Y%m%d%H'`
MON=`date '+%b'`
M=`echo "$DATE1"|cut -c 5,6`
D=`echo "$DATE1"|cut -c 7,8`
H=`echo "$DATE1"|cut -c 9,10`
YY=`date '+%Y'`
A=`expr $M + 1 - 1`
B=`expr $D + 1 - 1`

FDIR=/LVFMDUSAGEDATA/usage_input/
TDIR=/LVFMDUSAGEDATA/iplogusage/
LOG=/u01/scripts/usaflow_collector_logs/
if [ -d $TDIR ];then
if [ -d $FDIR ];then
if [ -d $LOG ];then
echo "######################################" 
echo "Date : $DD"  
for i in  00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23
do
C=`ls ${TDIR}| head -51 | wc -l`
echo "$C"
NATCOUNT=`find $FDIR -iname "*.csv"|wc -l`
if [ $NATCOUNT -ge 1 ];then
if [ $C -le $THRESHOLD ];then
echo "Less than 50 files in Usaflow input" 
B=`find /LVFMDUSAGEDATA/usage_input/  -name "*.csv" -type f -print |awk -F '.csv' '{print$1}'|cut -c35-42|sort|uniq|head -1`
for j in $B
do
CC=`find ${FDIR} -iname "*$j$i*".csv|wc -l`
if [ $CC -eq 0 ];then
echo "No File For DATE : $j and Hour $i"  
else
echo "Moving 200 Files for Date : $j and Hour : $i"  
VAR=`ls -l ${FDIR}*${j}${i}*.csv|head -2000|awk -F '/' '{print$4}'`  #>> ${LOG}${NODE}_netflow_${DATE}.log
for p in $VAR
do
if [ -f ${FDIR}${p} ];then
FDATE=`ls -l ${FDIR}${p}|awk -F ' ' '{print$6,$7,$8}'`
echo "$CUDATE,$FDATE,$p" >> ${LOG}${NODE}_usaflow_input_${B}.log

mv ${FDIR}${p}  ${TDIR}${p}
fi
done

fi
done
else
echo "Already $C files in Natflow input : Threshold = $THRESHOLD"
exit
fi
else
echo "No csv file in natflow directory" 
exit;
fi
done

else echo "Log directory not available" 
fi
else echo "$FDIR : Directory not available" 
fi
else echo "This server is standby"
fi
