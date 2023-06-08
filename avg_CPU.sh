#!/bin/bash
LOG=/u01/avg_cpu.log

D=`date -d -1days +%d/%m/%Y | cut -d / -f1`

echo -e "\t\t ============ AHD Circle CPU Utilization ===========  " > $LOG

printf " ============ `ssh root@10.164.7.1 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.1 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.2 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.2 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.3 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.3 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

echo -e "\t\t ============= LKO Circle CPU Utilization ========== " >>$LOG

printf " ============ `ssh root@10.164.7.7 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.7 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.8 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.8 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.9 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.9 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

echo -e "\t\t ============= KOL Circle CPU Utilization ========== " >>$LOG

printf " ============ `ssh root@10.164.7.13 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.13 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.14 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.14 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.15 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.15 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

echo -e "\t\t ============= CH-1 Circle CPU Utilization ========== " >>$LOG

printf " ============ `ssh root@10.164.7.19 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.19 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.20 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.20 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.21 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.21 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

echo -e "\t\t ============= CH-2 Circle CPU Utilization ========== " >>$LOG

printf " ============ `ssh root@10.164.7.25 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.25 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.26 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.26 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.27 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.27 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

echo -e "\t\t ============= DEL Circle CPU Utilization ========== " >>$LOG

printf " ============ `ssh root@10.164.7.31 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.31 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.32 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.32 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.33 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.33 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

echo -e " \t\t ============= MUM-1 Circle CPU Utilization ========== " >>$LOG

printf " ============ `ssh root@10.164.7.37 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.37 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.38 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.38 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.39 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.39 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

echo -e "\t\t ============= MUM-2 Circle CPU Utilization ========== " >>$LOG

printf " ============ `ssh root@10.164.7.43 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.43 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.44 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.44 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

printf " ============ `ssh root@10.164.7.45 hostname | cut -c7-13` =============== \n `ssh root@10.164.7.45 sar -f /var/log/sa/sa${D} | sed -n '1p;3p;$p'` \n\n" >>$LOG

