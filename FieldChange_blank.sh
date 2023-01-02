#!/bin/bash/
P1="/home/stlmed/TESTINP/"
P2="/home/stlmed/TEST/"
P3="/home/stlmed/ARCH/"


cd ${P1}
for i in `ls -1 *.gz | head -5`
do
zcat $i|awk -F',' -vOFS=',' '{if (  ( $2 != "" ) && ( $2 != "cmrecordtag" ) ) $414 = "International"; print $0}'|gzip >> ${P2}/$i
mv $i ${P3}/
done