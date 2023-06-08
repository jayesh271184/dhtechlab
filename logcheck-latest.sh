#!/bin/bash
DATE=`date +%F`
str=`cat /opt1/IPLMS/crestelsetup/tools/apache-tomcat-7.0.54/apache-tomcat-7.0.54/logs/catalina.out | tail -100f | grep --line-buffered 'java.sql.SQLException: Closed Connection'`
if [  -z "$str" ];then
port=`netstat -tlpn | grep :10080|grep -i listen|cut -d" " -f60`
if [ "$port" = 'LISTEN' ]; then
echo "`date`: port is up" >> /opt1/IPLMS/crestelsetup/tools/apache-tomcat-7.0.54/apache-tomcat-7.0.54/scripts/log-$DATE.txt
else
kill -9 `netstat -tlpn | grep 10080 |awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f1| netstat -tlpn | grep 10080|awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f66`;
sleep 2m
cd /opt1/IPLMS/crestelsetup/tools/apache-tomcat-7.0.54/apache-tomcat-7.0.54/bin;sh startup.sh;
echo "`date`: string not found" >> /opt1/IPLMS/crestelsetup/tools/apache-tomcat-7.0.54/apache-tomcat-7.0.54/scripts/log-$DATE.txt
fi
else
kill -9 `netstat -tlpn | grep 10080 |awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f1| netstat -tlpn | grep 10080|awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f66`;
sleep 2m
echo "tomcat startup script execution--->";
cd /opt1/IPLMS/crestelsetup/tools/apache-tomcat-7.0.54/apache-tomcat-7.0.54/bin;sh startup.sh;
echo "`date`: Tomcat Restarted" >> /opt1/IPLMS/crestelsetup/tools/apache-tomcat-7.0.54/apache-tomcat-7.0.54/scripts/log-$DATE.txt

fi

