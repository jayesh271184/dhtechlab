tail -f /opt/iplms/tomcat7.1.54/apache-tomcat-7.0.54/apache-tomcat-7.0.54/logs/catalina.out | grep --line-buffered 'java.sql.SQLException: Closed Connection' | while read ; 
do
kill -9 `netstat -tlpn | grep 18081 |awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f1| netstat -tlpn | grep 18081|awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f66`;
sleep 5m;
port=`netstat -tlpn | grep :18081|grep -i listen|cut -d" " -f60`

if [ "$port" = 'LISTEN' ]; then
             echo "`date`: port is up" >>log-`date`.txt
			 kill -9 `netstat -tlpn | grep 18081 |awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f1| netstat -tlpn | grep 18081|awk 'BEGIN {FS = "/"}{print  $1}'|cut -d' ' -f66`;
			 continue;
else
             cd /opt/iplms/tomcat7.1.54/apache-tomcat-7.0.54/apache-tomcat-7.0.54/bin;sh startup.sh;
			 echo "`date`: Tomcat Restarted" >>log-`date`.txt
			 continue;
fi
 
done
