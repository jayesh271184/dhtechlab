#!bin/sh

LOG_DIR=/u01/scripts/usaflow_collector_logs/
#Date=${1} ${2} ${3}
#echo ${1} ${2} ${3}
NODE=CH1
if [ -f ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log ];then
echo "Circle,Hour,File Count,Record Count,Size(GB),EPS"
for i in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23
do
#echo "For $i Hours"
File=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log|awk -F ',' '{print$3}'|grep ${3}${2}${1}${i}|sort|uniq|wc -l`
TRC=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log |grep ${3}${2}${1}${i}|awk -F ',' '{print$4}'|awk '{s+=$1} END {print s}'`
TS=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log |grep ${3}${2}${1}${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s/1024/1024/1024}'`
EPS=$((TRC / 3600 ))
echo ""$NODE",${i},$File,$TRC,$TS,$EPS"
done
else
echo "Data Not Present for the desired date"
fi

File1=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log|awk -F ',' '{print$3}'|sort|uniq|wc -l`
TRC1=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log |grep ${3}${2}${1}|awk -F ',' '{print$4}'|awk '{s+=$1} END {print s}'`
TS1=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log |grep ${3}${2}${1}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s/1024/1024/1024}'`
AEPS=$((TRC1 / 86400 ))
#echo "========================================================================================================================================================"
echo "Date,${1}/${2}/${3},$File1,$TRC1,$TS1,$AEPS"
