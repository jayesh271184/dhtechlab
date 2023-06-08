#!/bin/sh
CURDATE=`date '+%b %d %H:%M:%S %Y'`
DATE=`date '+%Y%m%d'`
DD=`date '+%c'`
NODE=CHN1
FDIR=/LVFMDUSAGEDATA/CHN1_MED_DATA/archieved/postpaid/
TDIR=/LVBACKLOGDATA/CHN1_MED_DATA/archieved/postpaid/
LOG=/u01/scripts/legalflow_collector_logs/
if [ -d $TDIR ];then
if [ -d $FDIR ];then
if [ -d $LOG ];then
File=`find $FDIR -type f -iname "*.DATA"|awk -F '/' '{print$NF}'`
for i in $File
do
FDAY=`ls ${FDIR}${i}|head -1| awk -F '/' '{print$NF}'|awk -F '.DATA' ' { print $1 } ' | cut -c12-19`
ZZ=`cat ${FDIR}${i}|wc -l`
FDATE=`ls -l ${FDIR}${i}|awk -F ' ' '{print$6,$7,$8}'`
SS=`du -b ${FDIR}${i}|awk '{print$1}'`

DUP=`cat ${LOG}${NODE}_PO_DUPLICATE_${FDAY}.log |grep ${i}|wc -l`
if [ $DUP -ge 1 ];then
echo "Duplicate file Found , ${i}" >> ${LOG}${NODE}_PO_DUPLICATE_${FDAY}.log
mv ${FDIR}${i} /u01/scripts/duplicate/;
else
echo "$CURDATE,$FDATE,$i,$ZZ,$SS"  >> ${LOG}${NODE}_legallog_po_input_${FDAY}.log

mv ${FDIR}${i} $TDIR
fi

done
else echo "Log directory not available"
fi
else echo "$FDIR : Directory not available"
fi
else echo "This server is standby"
fi
