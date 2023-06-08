#!/bin/bash

LOG=/u01/avg_mem.log
D=`date -d -1days +%d/%m/%Y | cut -d / -f1`

echo -e " NODE NAME     Avg. Mem Utilization \n"  

echo -e " AHD-S1       `ssh root@10.164.7.1 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " AHD-S2       `ssh root@10.164.7.2 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " AHD-S3       `ssh root@10.164.7.3 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " CH1-S1       `ssh root@10.164.7.19 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " CH1-S2       `ssh root@10.164.7.20 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " CH1-S3       `ssh root@10.164.7.21 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " CH2-S1       `ssh root@10.164.7.25 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " CH2-S2       `ssh root@10.164.7.26 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " CH2-S3       `ssh root@10.164.7.27 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " DEL-S1       `ssh root@10.164.7.31 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " DEL-S2       `ssh root@10.164.7.32 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " DEL-S3       `ssh root@10.164.7.33 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " KOL-S1       `ssh root@10.164.7.13 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " KOL-S2       `ssh root@10.164.7.14 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " KOL-S3       `ssh root@10.164.7.15 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " LKO-S1       `ssh root@10.164.7.7 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " LKO-S2       `ssh root@10.164.7.8 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " LKO-S3       `ssh root@10.164.7.9 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " MUM1-S1      `ssh root@10.164.7.37 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " MUM1-S2      `ssh root@10.164.7.38 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " MUM1-S3      `ssh root@10.164.7.39 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " MUM2-S1      `ssh root@10.164.7.43 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " MUM2-S2      `ssh root@10.164.7.44 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " MUM2-S3      `ssh root@10.164.7.45 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " APP-S1       `ssh root@10.65.153.89 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

echo -e " APP-S2       `ssh root@10.65.153.90 sar -r -f /var/log/sa/sa${D} | tail -1 | awk '{print $4}'` \n"

