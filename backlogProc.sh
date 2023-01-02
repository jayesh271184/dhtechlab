#! /bin/bash


dd=`date +'%d/%B/%Y %H:%M'`

SRC=/SSB-SAS-SSBPROC/HQB1_BKP
DST=/u02/NETFLOW/INPUT/SSBRAW

file=`ls $SRC/| cut -d'_' -f2|cut -c'1-10'|sort|uniq|grep 202`

for i in $file
do
        DSTC=`find $DST -name "*" -type f |wc -l`
        if [ $DSTC -le 200 ]
        then
                find $SRC -type f -iname "*${i}*.gz" -exec mv {} $DST \;

        else
                echo "Much files in $DST=$DSTC"
                exit
        fi
done

