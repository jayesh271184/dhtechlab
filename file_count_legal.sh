#!/bin/sh
. /u01/scripts/color.cr
P1=/u01/DISTRIBUTION_ROOT/Prepaid/input/
P2=/u01/DISTRIBUTION_ROOT/Postpaid/input/
P3=/LVFMDUSAGEDATA/CHN1_MED_DATA/Prepaid/
P4=/LVFMDUSAGEDATA/CHN1_MED_DATA/Postpaid/
P5=/LVFMDUSAGEDATA/CHN1_MED_DATA/archieved/postpaid/
P6=/LVFMDUSAGEDATA/CHN1_MED_DATA/archieved/prepaid/
C1=`find $P1 -type f -name '*.csv' |wc -l`
C2=`find $P2 -type f -name '*.csv' |wc -l`
C3=`find $P3 -type f -name '*.DATA' |wc -l`
C4=`find $P4 -type f -name '*.DATA' |wc -l`
C5=`find $P5 -type f -name '*.DATA' |wc -l`
C6=`find $P6 -type f -name '*.DATA' |wc -l`
echo -e "----------------------------------------------------------------------------------------"
echo -e " ${SK}CIRCLE : CHN1-S2${N} || ${G}$P1${N} --> ${SK}$C1${N} ${G}$P3${N} --> ${SK}$C3${N} "
echo -e " ${SK}CIRCLE : CHN1-S2${N} || ${G}$P2${N} --> ${SK}$C2${N} ${G}$P4${N} --> ${SK}$C4${N} "
echo -e " ${SK}CIRCLE : CHN1-S2${N} || ${G}$P5${N} --> ${SK}$C5${N}"
echo -e " ${SK}CIRCLE : CHN1-S2${N} || ${G}$P6${N} --> ${SK}$C6${N}"
