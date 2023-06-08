#!/bin/sh
CURDATE=`date '+%b %d %H:%M:%S %Y'`
DATE=`date '+%Y%m%d'`
DD=`date '+%c'`
NODE=AHD
FDIR=/u01/natlog/
TDIR=/LVFMDNATDATA/natlog_input/
LOG=/u01/scripts/netflow_collector_logs/
if [ -d $TDIR ];then
if [ -d $FDIR ];then
if [ -d $LOG ];then
File=`find $FDIR -type f -iname "*.gz"|awk -F '/' '{print$4}'`
for i in $File
do
FDAY=`ls ${FDIR}${i}|head -1|awk -F 'GP_' '{print$2}'|cut -c1,2,3,4,5,6,7,8`
ZZ=`zcat ${FDIR}${i}|wc -l`
FDATE=`ls -l ${FDIR}${i}|awk -F ' ' '{print$6,$7,$8}'`
SS=`du -b ${FDIR}${i}|awk '{print$1}'`

DUP=`cat ${LOG}${NODE}_netlog_input_${FDAY}.log|grep ${i}|wc -l`
if [ $DUP -ge 1 ];then
echo "Duplicate file Found , ${i}" >> ${LOG}${NODE}_DUPLICATE_${FDAY}.log
mv ${FDIR}${i} /u01/scripts/duplicate/;
else
echo "$CURDATE,$FDATE,$i,$ZZ,$SS"  >> ${LOG}${NODE}_netlog_input_${FDAY}.log

mv ${FDIR}${i} $TDIR.
fi

done
else echo "Log directory not available"
fi
else echo "$FDIR : Directory not available"
fi
else echo "This server is standby"
fi
