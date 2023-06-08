#!/bin/bash
opt=`/bin/df -Pm |grep -E opt|awk '{print $(NF-1)}'|cut -d'%' -f1`
u01=`/bin/df -Pm |grep -E u01|awk '{print $(NF-1)}'|cut -d'%' -f1`
COLLECTIONROOT=`find /u01/mediation/collect_netflow_binary -name "*" -type f -mmin +60 -exec ls -ltr {} \;|wc -l`
PARSEDROOT=`find /NATFLOW-1/temp-input -name "*" -type f -mmin +60 -exec ls -ltr {} \;|wc -l`

if [ "$opt" -gt 50 ];
then
echo "jayesh-opt";
echo -e "Space of /opt partition exceeded it's threshold="$opt |mail -s "IPLMS Alert:Crestel-IPLMS-S1" -r "IPLMS-ALERT@sterliteL3Support.com" sonu.kumar@infotelconnect.com,jayesh.shah@sterlite.com,prince.dabhi@sterlite.com
else
echo "Prince-opt";
fi
if [ "$u01" -gt 50 ];
then
echo "jayesh-u01";
echo -e "Space of /u01 partition exceeded it's threshold="$u01 |mail -s "IPLMS Alert:Crestel-IPLMS-S1" -r "IPLMS-ALERT@sterliteL3Support.com" sonu.kumar@infotelconnect.com,jayesh.shah@sterlite.com,prince.dabhi@sterlite.com
else
echo "Prince-u01";
fi
if [ "$COLLECTIONROOT" -gt 20 ];
then
echo "jayeshcollection";
echo -e "Total 60 min older file count present at /u01/mediation/collect_netflow_binary ="$COLLECTIONROOT |mail -s "IPLMS Alert :Crestel-IPLMS-S1" -r "IPLMS-ALERT@sterliteL3Support.com"  sonu.kumar@infotelconnect.com,jayesh.shah@sterlite.com,prince.dabhi@sterlite.com
else
echo "Princecollection";
fi
if [ "$PARSEDROOT" -gt 100 ];
then
echo "jayeshparse";
echo -e "Total 60 min older file count present at /NATFLOW-1/temp-input ="$PARSEDROOT |mail -s "IPLMS Alert :Crestel-IPLMS-S1" -r "IPLMS-ALERT@sterliteL3Support.com" sonu.kumar@infotelconnect.com,jayesh.shah@sterlite.com,prince.dabhi@sterlite.com
else
echo "Prince-parse";
fi

