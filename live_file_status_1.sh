#!/bin/sh

. /u01/scripts/color.cr

THRESHOLD=15

INPUT_1=/opt/iplms/File/natlog_col/192.168.249.130/

TT=`ls -lrt $INPUT_1|tail -1|awk '{print$6,$7,$8}'`

TT1=`date '+%d %b %Y %H:%M'`
gnud2=`date -d "$TT" +%s`
gnud1=`date -d "$TT1" +%s`

sla=`expr $gnud1 - $gnud2`
MIN=`expr $sla / 60`

if [ $MIN -ge $THRESHOLD ];then

echo -e "-->>${SK}CIRCLE${N} : ${G}AHD-S1${N} --> ${SK}${HOSTNAME}_NATFLOW LIVE_FILE${N} --> ${BL}${R}Not Receiving${N} --> ${BA}Last File Received at $TT ${N}--> ${R}$MIN Minute Before${N}"

else

echo -e "-->>${SK}CIRCLE${N} : ${G}AHD-S1${N} --> ${SK}${HOSTNAME}_NATFLOW LIVE_FILE${N} --> ${G}Receiving${N} --> ${BA}Last File Received at ${GR} $TT ${N}--> ${SK}$MIN Minute Before${N}"

fi
