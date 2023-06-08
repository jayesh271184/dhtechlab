#!/bin/sh

. /u01/scripts/color.cr

THRESHOLD=15
YR=`date +%Y`
MT=`date +%m`
DAY=`date +%d`
ODAY=`date -d 'now -1 day' +%d`

if [ -f /u01/scripts/legalflow_collector_logs/CHN1_legallog_po_input_${YR}${MT}${DAY}.log ];then

TT=`cat /u01/scripts/legalflow_collector_logs/CHN1_legallog_po_input_${YR}${MT}${DAY}.log | tail -1 | awk -F ',' '{print$1}'`
TT1=`date '+%d %b %Y %H:%M'`
gnud2=`date -d "$TT" +%s`
gnud1=`date -d "$TT1" +%s`

sla=`expr ${gnud1} - ${gnud2}`
MIN=`expr ${sla} / 60`


if [ $MIN -ge $THRESHOLD ];then

echo -e "-->>${SK}CIRCLE${N} : ${G}CHN1-S2${N} --> ${SK}${HOSTNAME}_Legal_PO_LIVE_FILE${N} --> ${BL}${R}Not Receving${N} --> ${BA}Last File Received at $TT ${N}--> ${R}$MIN Minute Before${N}"

else

echo -e "-->>${SK}CIRCLE${N} : ${G}CHN1-S2${N} --> ${SK}${HOSTNAME}_Legal_PO_LIVE_FILE${N} --> ${G}Receving${N} --> ${BA}Last File Received at ${GR} $TT ${N}--> ${SK}$MIN Minute Before${N}"

fi

else

TT3=`cat /u01/scripts/legalflow_collector_logs/CHN1_legallog_po_input_${YR}${MT}${ODAY}.log | tail -1 | awk -F ',' '{print$1}'`
TT4=`date '+%d %b %Y %H:%M:%S'`
gnud3=`date -d "$TT3" +%s`
gnud4=`date -d "$TT4" +%s`

sla1=`expr ${gnud4} - ${gnud3}`
MIN1=`expr ${sla1} / 60`
if [ $MIN1 -ge 15 ];then

echo -e "-->>${SK}CIRCLE${N} : ${G}CHN1-S2${N} --> ${SK}${HOSTNAME}_Legal_PO_LIVE_FILE${N} --> ${BL}${R}Not Receving${N} --> ${BA}Last File Received at $TT3 ${N}--> ${R}$MIN1 Minute Before${N}"

else

echo -e "-->>${SK}CIRCLE${N} : ${G}CHN1-S2${N} --> ${SK}${HOSTNAME}_Legal_PO_LIVE_FILE${N} --> ${G}Receving${N} --> ${BA}Last File Received at ${GR} $TT3 ${N}--> ${SK}$MIN1 Minute Before${N}"

fi

fi
