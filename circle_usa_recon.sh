#!bin/sh

LOG_DIR=/u01/scripts/usaflow_collector_logs/
#Date=${1} ${2} ${3}
#echo ${1} ${2} ${3}
NODE=CH1
i=$4
if [ -f ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log ];then
echo "Circle,Hour,File Count"
#for i in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23
#do
echo "================HOUR: $i========================="
#echo "For $i Hours"
for j in `cat /u01/scripts/report_script/circle` 
do
File=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log|grep $j|awk -F ',' '{print$3}'|grep ${3}${2}${1}${i}|sort|uniq|wc -l`
TRC=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log |grep $j|grep ${3}${2}${1}${i}|awk -F ',' '{print$4}'|awk '{s+=$1} END {print s}'`
TS=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log |grep $j|grep ${3}${2}${1}${i}|awk -F ',' '{print$5}'|awk '{s+=$1} END {print s/1024/1024/1024}'`
echo " "$j" , ${i} , $File "
done
#done
else
echo "Data Not Present for the desired date"
fi

