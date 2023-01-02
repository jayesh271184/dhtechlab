#!/bin/bash/
P1="/tmp/input/"
P2="/tmp/ParInput"
P3="/tmp/Arch/"

cd ${P1}
for i in `ls -1 *.gz`
do
zcat $i|sed 's/.*]: //g;s/ | /\n/g;/^$/d' >> ${P2}/$i.csv
gzip ${P2}/$i.csv
mv $i ${P3}/
done
