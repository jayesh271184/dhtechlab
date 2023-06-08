#!/bin/sh

. /u01/scripts/color.cr
P1=/LVFMDUSAGEDATA/error/input/
P2=/u01/DISTRIBUTION_ROOT/Prepaid/error/input/
P3=/u01/DISTRIBUTION_ROOT/Postpaid/error/input/
P4=/u01/scripts/duplicate/

Error_Count_IPUSA=`find $P1 -maxdepth 8 -type f -iname "*" |wc -l`
Error_Count_DIS_PR=`find $P2 -maxdepth 5 -type f -iname "*" |wc -l`
Error_Count_DIS_PO=`find $P3 -maxdepth 5 -type f -iname "*" |wc -l`
Duplicate_Count_USA=`find $P4 -maxdepth 5 -type f -iname "*" |wc -l`

echo -e "${SK}CIRCLE : CHN1-S2${N} || ${G}$P2${N} --> ${SK}$Error_Count_DIS_PR${N} ${G}$P3${N} --> ${SK}$Error_Count_DIS_PO${N} ${G}$P1${N} --> ${SK}$Error_Count_IPUSA${N} ${G}$P4${N} --> ${SK}$Duplicate_Count_USA${N}"
