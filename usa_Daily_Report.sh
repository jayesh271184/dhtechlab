#!/bin/sh
. /u01/scripts/color.cr

LOG_DIR=/u01/scripts/usaflow_collector_logs/
NODE=CH1
#echo -e "============================>>>${G} Memiation File Summary ${N}<<<==========================="
#echo -e "${SK}System Date ${N}: $DATE"
#echo "====================================================================================="
if [ -f ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log ];then
RCOUNT=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log|awk -F ',' '{print$3}'|grep "${3}${2}${1}"|sort|uniq|wc -l`
RRECORD=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log|awk -F ',' '{print$4}'|awk '{s+=$1} END {print s}'`
RSIZE=`cat ${LOG_DIR}${NODE}_usalog_input_${3}${2}${1}.log|awk -F ',' '{print$5}'|awk '{s +=$1} END {print s/1024/1024/1024}'`

echo -e "${SK}CIRCLE${N} : ${G}${NODE}|| ${SK}DATE ${N}: ${G}${1}/${2}/${3}${N} ||${SK} File Count ${N}: ${G}$RCOUNT${N} || ${SK}Recon Count${N} : ${G}$RRECORD${N} || ${SK}Total Size(GB)${N} :${G} $RSIZE${N}"

else
echo -e "${SK}CIRCLE ${N}: ${G}${NODE}${N} ||${SK} DATE ${N}:${G} ${1}/${2}/${3}${N} -->${R}${BL} Data Not Available${N}"

fi

