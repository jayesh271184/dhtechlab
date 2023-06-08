#!/bin/bash
YR=`date -d 'now' '+%Y/%-m/%-d' | awk -F"/" '{print $1}'`
MM=`date -d 'now' '+%Y/%-m/%-d' | awk -F"/" '{print $2}'`
DD=`date -d 'now' '+%Y/%-m/%-d' | awk -F"/" '{print $3}'`

archpath=/u01/NATDATA/D_SYSLOG/COLLECTION/archived
inputpath=/u01/NATDATA/D_SYSLOG/COLLECTION/test/.
outputpath=/u01/NATDATA/D_SYSLOG/JUNIPER/input/.
mkdir -p ${archpath}/${YR}/${MM}/${DD}

#find /u01/NATDATA/D_SYSLOG/COLLECTION/test/ -iname "*.gz" -exec gunzip {} +

cd /u01/NATDATA/D_SYSLOG/COLLECTION/test/
filename1=`find . -iname "*.gz" -exec ls {} + | head -1`
filename2=$(basename $filename1)

#cd /u01/NATDATA/D_SYSLOG/COLLECTION/test/
#filename=`find . -iname "*.log" -exec ls -1 {} +`

#filename=`find ${inputpath} -iname "*.log" -exec ls -1 {} \;`
#gunzip -f $filename
#gunzip -f ${filename1}
#for i in ${filename2}
for i in `ls -1 *.gz`
do
#	filename3=$(gunzip  ${i})
 zcat ${i} |grep " 100."|sed -r 's/[<>]/,/g;s/[{}]/,/g;s/[]/[]/,/g;s/:/,/g;s/ /,/g' >> ${outputpath}/`basename ${i} .gz`
gzip  ${outputpath}/`basename ${i} .gz`
#mv $i ${archpath}/${YR}/${MM}/${DD}
done

