#!/bin/bash

### Cleaning docker backup images

for i in `docker images --format "{{.Repository}} {{.ID}} {{.CreatedSince}}" | grep backup |grep -E 'year|month|4 weeks|5 weeks|6 weeks|7 weeks' | awk -F ' ' '{print$2}'`
 do 
   docker rmi $i
 done

### Cleaning DB logs trace and alert
hostname=`hostname`

#echo "$hostname"
if [ -d "/u01/app/oracle/diag/tnslsnr/${hostname}/listener/alert/" ]
 then
    find /u01/app/oracle/diag/tnslsnr/${hostname}/listener/alert/. -type f -mtime +7 -iname "log_*" -exec rm -f {} \;
  else
    echo "Path not exists"
fi

if [ -d "/u01/app/oracle/diag/tnslsnr/${hostname}/listener/trace/" ]
 then
    cat /dev/null > /u01/app/oracle/diag/tnslsnr/${hostname}/listener/trace/listener.log
  else
    echo "Path not exists"
fi

### Cleaning Audit Logs

if [ -d "/var/log/audit/" ]
 then
    find /var/log/audit/ -type f -iname "audit*" -mtime +10 -exec rm -f {} \;    
  else
    echo "Path not exists"
fi

### Truncating Catalina.out file

CATAfile=`find / -name "*catalina.out" -type f 2>/dev/null`
if [ -f $CATAfile ]
 then 
    cat /dev/null > $CATAfile    
  else 
    echo "File not exists"
 fi 




