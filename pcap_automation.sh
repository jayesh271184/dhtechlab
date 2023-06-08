#!/bin/bash
OLD_PID=`ps -ef | grep tcpdump | grep -v grep | awk '{print $2}'`
PCAP_DIR=/opt/automation/pcap

# this is modified to capture packet on RM-Session Manager service
nohup /usr/sbin/tcpdump -vv -i any -w ${PCAP_DIR}/BSS_SQA-`date +%d%b_%H_%M`.pcap -s 0 &


kill ${OLD_PID}

# "mmin" takes minute as argument. Compress pcap older then 1-day = 1*24*60
find ${PCAP_DIR}/*.pcap -mmin +720 -print | while read line
  do
        gzip $line
  done

# "mmin" takes minute as argument. Remove files older then 7-days = 7*24*60
find ${PCAP_DIR} -mmin +7200 -print | while read line
  do
    rm $line
  done
