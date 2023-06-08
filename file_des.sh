#!/bin/sh
p=`/usr/sbin/lsof | grep crestel | wc -l`
echo "Number of descriptor = $p" > /u01/scripts/nms/trace.txt
t=`find /opt-log/logs/ -type f -name *Trace* -size +50M | wc -l`
echo "Number of Trace file grater than 50MB = $t" >> /u01/scripts/nms/trace.txt
