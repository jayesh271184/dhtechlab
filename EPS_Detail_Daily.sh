#!bin/sh

LOG_DIR=/u01/scripts/usaflow_collector_logs/
#Date=${1} ${2} ${3}
#echo ${1} ${2} ${3}
NODE=CH1
if [ -f ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log ];then
TRC1=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log |grep ${3}${2}${1}|awk -F ',' '{print$4}'|awk '{s+=$1} END {print s}'`
AEPS=$((TRC1 / 86400 ))
echo "${NODE}_USAGE : $AEPS"
else
echo "Record Not Received For Said Date"
fi
