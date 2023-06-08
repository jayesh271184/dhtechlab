#!/bin/sh
. /opt/crestel/script/color.cr
P1=/data/distribution_root/input/
P2=/data/distribution_root/archived/
P3=/data/distribution_root/error/FILE/2019/
P4=/data/DNET_ROOT/ARCH/
P5=/opt/crestel/crestelsetup/crestelpengine/modules/mediation/logs/
C1=`find $P1 -type f |wc -l`
C2=`find $P2 -type f |wc -l`
C3=`find $P3 -type f |wc -l`
C4=`find $P4 -type f -mtime +7|wc -l`
C5=`find $P5 -type f |wc -l`

echo -e "${SK}CIRCLE : $HOSTNAME:`hostname -i`${N} ||\n "C input Path " ${G}$P1${N} --> ${SK}$C1${N}\n "D input Path"  ${G}$P2${N} --> ${SK}$C2${N}\n  "Files in Error" ${G}$P3${N} -->  ${SK}$C3${N}\n  "Files in D Archive" ${G}$P4${N} -->  ${SK}$C4${N}\n  "total Logs files"  ${G}$P5${N} -->  ${SK}$C5${N}"
