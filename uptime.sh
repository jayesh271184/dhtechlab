#!/bin/bash

LOG=/u01/avg_mem.log
#D=`date -d -1days +%d/%m/%Y | cut -d / -f1`

echo -e " NODE NAME     Uptime/Availability \n"

echo -e " AHD-S1       `ssh root@10.164.7.1 uptime | cut -d , -f1` \n"

echo -e " AHD-S2       `ssh root@10.164.7.2 uptime | cut -d , -f1` \n"

echo -e " AHD-S3       `ssh root@10.164.7.3 uptime | cut -d , -f1` \n"

echo -e " CH1-S1       `ssh root@10.164.7.19 uptime | cut -d , -f1` \n"

echo -e " CH1-S2       `ssh root@10.164.7.20 uptime | cut -d , -f1` \n"

echo -e " CH1-S3       `ssh root@10.164.7.21 uptime | cut -d , -f1` \n"

echo -e " CH2-S1       `ssh root@10.164.7.25 uptime | cut -d , -f1` \n"

echo -e " CH2-S2       `ssh root@10.164.7.26 uptime | cut -d , -f1` \n"

echo -e " CH2-S3       `ssh root@10.164.7.27 uptime | cut -d , -f1` \n"

echo -e " DEL-S1       `ssh root@10.164.7.31 uptime | cut -d , -f1` \n"

echo -e " DEL-S2       `ssh root@10.164.7.32 uptime | cut -d , -f1` \n"

echo -e " DEL-S3       `ssh root@10.164.7.33 uptime | cut -d , -f1` \n"

echo -e " KOL-S1       `ssh root@10.164.7.13 uptime | cut -d , -f1` \n"

echo -e " KOL-S2       `ssh root@10.164.7.14 uptime | cut -d , -f1` \n"

echo -e " KOL-S3       `ssh root@10.164.7.15 uptime | cut -d , -f1` \n"

echo -e " LKO-S1       `ssh root@10.164.7.7 uptime | cut -d , -f1` \n"

echo -e " LKO-S2       `ssh root@10.164.7.8 uptime | cut -d , -f1` \n"

echo -e " LKO-S3       `ssh root@10.164.7.9 uptime | cut -d , -f1` \n"

echo -e " MUM1-S1      `ssh root@10.164.7.37 uptime | cut -d , -f1` \n"

echo -e " MUM1-S2      `ssh root@10.164.7.38 uptime | cut -d , -f1` \n"

echo -e " MUM1-S3      `ssh root@10.164.7.39 uptime | cut -d , -f1` \n"

echo -e " MUM2-S1      `ssh root@10.164.7.43 uptime | cut -d , -f1` \n"

echo -e " MUM2-S2      `ssh root@10.164.7.44 uptime | cut -d , -f1` \n"

echo -e " MUM2-S3      `ssh root@10.164.7.45 uptime | cut -d , -f1` \n"

echo -e " APP-S1       `ssh root@10.65.153.89 uptime | cut -d , -f1` \n"

echo -e " APP-S2       `ssh root@10.65.153.90 uptime | cut -d , -f1` \n"



