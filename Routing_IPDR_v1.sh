#!/bin/sh
res1=$(date +%s.%N)
#########################################################
SRC=/IPDR/correlatedOutput/
DEST1=/IPDR/correlatedOutputFinal/
THRESHOLD_DEST1=200
LOG_FILE=/app-log/ROUTE_LOGS/
DATE=`date '+%c'`
lock_path=/tmp/
ID=/tmp/file
############################checking lock file #####################

if test -f ${lock_path}.SPLIT.lock_IPDR_Dist
        then
                echo "script is already running"
                exit
        else
                echo " creating lock file "
                touch ${lock_path}.SPLIT.lock_IPDR_Dist
fi;
####################### Cheking free memory #####################
MEM=`free -g|grep Mem|awk -F ' ' '{print$3}'`
MEM1=`free -g|grep Mem|awk -F ' ' '{print$2}'`
T=`expr $MEM \* 100`
C=`expr $T / $MEM1`
#######################################################################
echo "Start running on $DATE"

move_files () {
DAY=`ls  ${SRC}|awk -F '-' '{print$4}' |cut -c1,2,3,4,5,6,7,8 |sort|uniq|head -1`
FILE=`find $SRC -type f -iname "*${DAY}*.gz"|head -500`

for i in $FILE
do
DATE1=`echo ${i}|awk -F '/' '{print$4}'|awk -F '-' '{print$4}'|cut -c1,2,3,4,5,6,7,8`
FNAME=`echo ${i}|awk -F '/' '{print$4}'`
CC=`zcat ${i}|wc -l`
SIZE=`du -b ${i}|awk '{print$1}'`
DD=`ls -l ${i}|awk -F ' ' '{print$6,$7,$8}'`

echo "$DD,$FNAME,$SIZE,$CC" >> ${LOG_FILE}IPDR_RECON_DETAIL_MAVENIR_PALAKKAD_${DATE1}.csv
mv -v ${i} ${1}
done
}

if [ -d $SRC ] && [ -d $DEST1 ];then

        COUNT=`find $DEST1 -type f -iname "*.gz"|wc -l`
        if [ $COUNT -ge $THRESHOLD_DEST1 ];then
                echo "Moving 100 files in DEST1"
                else
                echo "Moving 100 files in DEST1"
                move_files ${DEST1}
                fi
fi
echo "Completed"

echo "#################################################################"
res2=$(date +%s.%N)
dt=$(echo "$res2 - $res1" | bc)
dd=$(echo "$dt/86400" | bc)
dt2=$(echo "$dt-86400*$dd" | bc)
dh=$(echo "$dt2/3600" | bc)
dt3=$(echo "$dt2-3600*$dh" | bc)
dm=$(echo "$dt3/60" | bc)
ds=$(echo "$dt3-60*$dm" | bc)

printf "Total runtime: %d:%02d:%02d:%02.4f\n" $dd $dh $dm $ds

echo "#################################################################"

rm ${lock_path}.SPLIT.lock_IPDR_Dist
