#!/bin/bash


JOBNAME=$1 ##Mention the Circle/Refinary Name i.e. sh BatchCreate.sh NEWDELHI CGF
JOBTYPE=$2 ##Mention the CGNAT/CGF Name i.e. sh BatchCreate.sh NEWDELHI CGF

D="/tmp/jayesh/$JOBNAME/$JOBTYPE/BatchFiles"

## Create the Path for Batch and Batch backup

mkdir -p ${D}

#ulimit -s 100000000000;

## Create batch with FileName,TimeStamp(yyyyMMddHHmmSSsss)

for i in `find /CGNATDATA/NONCORRELATED/$JOBNAME/$JOBTYPE/InputFinal/. -type f |cut -d'/' -f 8`;  do j=`echo $i`;  k=`echo $i|awk -F'202' '{print $1}'`; m=`echo $i| sed "s/^${k}//"|sed 's/-//g'|cut -c'1-10'`; echo $j,$m >> $D/Batch_Main.csv ;done


## Below will remove the already batch files

for i in `ls -1 Instance*.csv`; do grep -v -f $i $D/Batch_Main.csv > $D/Batch_Main2.csv;mv $D/Batch_Main2.csv $D/Batch_Main.csv -f; done
cat $D/Batch_Main.csv |wc -l

## Below will sort the file with second attribute for timestamp basis

sort -k2 -n -t, $D/Batch_Main.csv  > $D/Batch_Main_sorted.csv

## Below will Split the file batch of 500 files and keep the batch with Prefix as BATCHSPLIT_

split -l 500 $D/Batch_Main_sorted.csv $D/BATCHSPLIT_ 


C=`find ./ -type f -iname "BATCHSPLIT_*"|wc -l`

## Below will create batch with Prefix Instance-00 to Instance-09 and each batch will be 500 records 

while [ $C -ge 0 ]
do
echo $C

B=9 ### It will set the batch count Variable B
while [ $B -ge 0 ]
do
echo $B
k=`find $D/. -type f -iname "BATCHSPLIT_*"|tail -1`;
C=`find $D/. -type f -iname "BATCHSPLIT_*"|wc -l`
T=0
if [ $C == $T ]
then
exit
else
mv $k Instance-$B-`date +%Y%m%d%H%M%S%s`_${RANDOM}.csv;
fi

B=`expr $B - 1`
done

C=`find $D/. -type f -iname "BATCHSPLIT_*"|wc -l`
done


rm -f $D/Batch_Main.csv
rm -f $D/Batch_Main_sorted.csv