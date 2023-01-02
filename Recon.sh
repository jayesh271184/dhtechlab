#!/bin/sh
DATE1=`date -d "now -1 day" "+%d %m %Y"`
DAY=`date -d 'now -1 DAY' '+%Y%m%d'`
YYYY=`date '+%Y'`
MM=`date '+%m'`
DD=`date '+%d'`
SRC1=/IPDR/correlatedOutput/
SRC2=/IPDR/correlatedOutputFinal/
C1=`find $SRC1 -type f -iname "*_$YYYY$MM$DD*" | wc -l`
C2=`find $SRC2 -type f -iname "*_$YYYY$MM$DD*" | wc -l`

if [ $C1 -ge 11 ] && [ $C2 -ge 11 ]; then
        echo "backlog is present"
        else
        cp -v /app-log/ROUTE_LOGS/*$DAY*.csv /IPDR/Recon/
        /bin/sh /opt/crestelsetup/scripts/Hourly_Report.sh $DATE1 >> /IPDR/Recon/${DAY}_IPDR_RECON_MAVENIR_PALAKKAD_Summary.csv
fi
