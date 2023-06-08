SearchReportPath=/u01/intellzarecovery/SearchRequest/Report

#SearchDataPath=
StartDate=$1
EndDate=$2
attribute=$3
date1=`date +%d%m%y%H%M%S`

dd=`echo $1|cut -d'/' -f1`
mm=`echo $1|cut -d'/' -f2`
yy=`echo $1|cut -d'/' -f3|cut -d' ' -f1`
hh=`echo $1|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f1`
MM=`echo $1|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f2`
ss=`echo $1|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f3`

edd=`echo $2|cut -d'/' -f1`
emm=`echo $2|cut -d'/' -f2`
eyy=`echo $2|cut -d'/' -f3|cut -d' ' -f1`
ehh=`echo $2|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f1`
eMM=`echo $2|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f2`
ess=`echo $2|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f3`

> hour_DOTReport_${3}_${dd}${mm}${yy}.txt

while [ $hh -le $ehh ]
do
        if [ $hh -lt 10 ] && [ $hh -gt 00 ]
        then
        echo "0$hh" >> hour_DOTReport_${3}_${dd}${mm}${yy}.txt
        hh=$(($hh+1));
        else
        echo "$hh" >> hour_DOTReport_${3}_${dd}${mm}${yy}.txt
        hh=$(($hh+1));
        fi
done

echo -e "Sr. No,IMSI,IMEI,MSISDN,MAC ID,Source IP,Source Port,Destination IP,Destination Port,Translated IP,Translated Port,First Cell ID-Name/Location,Session Start date &time,Session End date & time,Duration in sec,Data Volume Uplink,Data Volume Downlink,PGW IP address,Charging ID,Access Point Name,PDP Address IPv4,PDP Address IPv6,CGI-ld,RAT,PDP-type" > ${SearchReportPath}/DOTReport_${3}_${dd}${mm}${yy}${hh}${MM}${ss}_${date1}

for SearchDataPath in `cat Searchpath.txt`
do
        for hour in `cat hour_DOTReport_${3}_${dd}${mm}${yy}.txt`
        do
echo $hour
                for i in `ls -1 ${SearchDataPath}${yy}${mm}/*${yy}${mm}${dd}_${hour}*.gz 2> /dev/null`
                do
                zcat ${i}|grep "${3}"|awk -v a="$StartDate" -v b="$EndDate" -F, '{if($12<=b && $13>=a ) print $0}'|sort -k12 -t','|awk '{ print FNR "," $0 }' >>${SearchReportPath}/DOTReport_${3}_${dd}${mm}${yy}${hh}${MM}${ss}_${date1}
                done
        done
done
gzip ${SearchReportPath}/DOTReport_${3}_${dd}${mm}${yy}${hh}${MM}${ss}_${date1}

