date=`date +%Y%m%d%H`;
i=`date +%Y%m%d`;
p=`/usr/sbin/lsof | grep crestel | wc -l`
FREE=`free -g  | sed -n '3,3p' | awk ' { print $4 } '`
USED=`free -g  | sed -n '3,3p' | awk ' { print $3 } '`
q=`lsof | wc -l`
r=`lsof|grep java|wc -l`
uptime=`uptime|cut -d':' -f5`
echo -e "date,Total-Descriptor,Descriptor-crestel,Descriptor-JAVA,freemem,usedmem,Lavg1,Lavg2,Lavg3" >> healthcheck-$i.csv
echo -e "$date,$q,$p,$r,$FREE,$USED,$uptime" >>healthcheck-$i.csv
