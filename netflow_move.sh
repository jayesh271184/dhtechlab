#!/bin/sh

##########################################

THRESHOLD=50

#########################################
NODE=AHD
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

FDIR=/LVFMDNATDATA/natlog_input/
TDIR=/LVFMDNATDATA/C_iplognatflow/
LOG=/u01/scripts/netflow_collector_logs/
if [ -d $TDIR ];then
if [ -d $FDIR ];then
if [ -d $LOG ];then
echo "######################################" 
echo "Date : $DD"  
for i in  00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23
do
C=`ls ${TDIR}|head -51|wc -l`
NATCOUNT=`find $FDIR -iname "*.gz"|wc -l`
if [ $NATCOUNT -ge 1 ];then
if [ $C -le $THRESHOLD ];then
echo "Less than 50 files in Natflow input" 
B=`find ${FDIR} -name "*.gz" -type f -print |awk -F 'GP_' '{print$2}'|cut -c1,2,3,4,5,6,7,8|sort|uniq|head -1`
for j in $B
do
CC=`find ${FDIR} -iname "*$j$i*".gz|wc -l`
if [ $CC -eq 0 ];then
echo "No File For DATE : $j and Hour $i"  
else
echo "Moving 200 Files for Date : $j and Hour : $i"  
VAR=`ls -l ${FDIR}*${j}${i}*.gz|head -200|awk -F '/' '{print$4}'`  >> ${LOG}${NODE}_netflow_${DATE}.log
for p in $VAR
do
if [ -f ${FDIR}${p} ];then
FDATE=`ls -l ${FDIR}${p}|awk -F ' ' '{print$6,$7,$8}'`
echo "$CUDATE,$FDATE,$p" >> ${LOG}${NODE}_natflow_input_${B}.log

mv ${FDIR}${p}  ${TDIR}${p}
#cd ${TDIR};rename .gz.inp .gz *.inp
fi
done

#exit 1
fi
done
else
echo "Already $C files in Natflow input : Threshold = $THRESHOLD"
exit
fi
else
echo "No gz file in natflow directory" 
exit;
fi
done

else echo "Log directory not available" 
fi
else echo "$FDIR : Directory not available" 
fi
else echo "This server is standby"
fi
