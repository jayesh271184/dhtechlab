#!/bin/sh
. /u01/scripts/color.cr
THRESOLD=70
LOAD=`uptime`
TEST=`uptime |awk -F ',' '{print$5}'|awk -F '.' '{print$1}'`

if [ "$TEST" -gt "$THRESOLD" ] ;then
echo -e "${SK} CH1-S2 ${N}::${R}${BL}Load Avg. of ${2} exceeds threshold ${N}: $TEST "
else
echo -e "${SK} CH1-S2 ${N}:: ${GR}${2}${N} -->${G} $LOAD${N} "
fi
