#!/bin/sh
. /u01/scripts/color.cr
P1=/u01/usage/
P2=/LVFMDUSAGEDATA/usage_input/
P3=/LVFMDUSAGEDATA/iplogusage/
C1=`find $P1 -type f -name '*.csv' |wc -l`
C2=`find $P2 -type f -name '*.csv' |wc -l`
C3=`find $P3 -type f -name '*.csv' |wc -l`
echo -e "${SK}CIRCLE : CHN1-S2${N} || ${G}$P1${N} --> ${SK}$C1${N} ${G}$P2${N} --> ${SK}$C2${N} ${G}$P3${N} --> ${SK}$C3${N}"
