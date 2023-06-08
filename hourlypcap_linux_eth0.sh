#!/bin/bash

OLD_PID=`ps -ef | grep 'tcpdump -i bond0' | grep -v grep | awk '{print $2}'`
PCAP_DIR=/opt/scripts/PCAP

mkdir ${PCAP_DIR} > /dev/null 2>&1

nohup /usr/sbin/tcpdump -i eth0 -w ${PCAP_DIR}/`hostname`_bond0-`date +%Y%m%d-%H%M%S`.pcap -s 0 &

kill ${OLD_PID}

# "mmin" takes minute as argument. Compress pcap older then 1-day = 1*24*60
find ${PCAP_DIR}/*.pcap -mmin +180 -print | while read line
do
        gzip $line
done

# "mmin" takes minute as argument. Remove files older then 7-days = 7*24*60
find ${PCAP_DIR}/*.pcap.gz -mmin +10080 -print | while read line
do
        rm $line
done
