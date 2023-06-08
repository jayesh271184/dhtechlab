SearchReportPath=/u01/intellzarecovery/SearchRequest/Report
LogPath=/u01/intellzarecovery/SearchRequest/Logs/
echo -e "Enter Start Date (Format : dd/mm/yyyy hh:mm:ss):"
read StartDate
echo -e "Enter End Date (Format : dd/mm/yyyy hh:mm:ss):"
read EndDate
echo -e "Enter MSISDN (Include 91):"
read attribute
echo -e "Enter Remark"
read remark

date1=`date +%d%m%y%H%M%S`


dd=`echo $StartDate|cut -d'/' -f1|sed 's/^0//g'`
dd1=`echo $StartDate|cut -d'/' -f1`
mm=`echo $StartDate|cut -d'/' -f2|sed 's/^0//g'`
mm1=`echo $StartDate|cut -d'/' -f2`
yy=`echo $StartDate|cut -d'/' -f3|cut -d' ' -f1`
hh=`echo $StartDate|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f1|sed 's/^0//g'`
hh1=`echo $StartDate|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f1`
MM=`echo $StartDate|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f2`
ss=`echo $StartDate|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f3`

edd=`echo $EndDate|cut -d'/' -f1`
emm=`echo $EndDate|cut -d'/' -f2`
eyy=`echo $EndDate|cut -d'/' -f3|cut -d' ' -f1`
ehh=`echo $EndDate|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f1`
eMM=`echo $EndDate|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f2`
ess=`echo $EndDate|cut -d'/' -f3|cut -d' ' -f2|cut -d':' -f3`
flag=`expr $edd - $dd`

echo -e "Search StartTime = $StartDate \nSearch EndTime = $EndDate \nSearched MSISDN = $attribute" \n Remark = $remark > $LogPath/Searchlog_${attribute}_$remark.log
echo -e "Search Started on :`date`" >> $LogPath/Searchlog_${attribute}_$remark.log

> ddhh_${attribute}_msisdn.txt

while [ $dd -le $edd ]
do
        if [ $hh -gt $ehh ] && [ $flag -gt 0 ]
        then
                while [ $hh -le 23 ]
                do
                        if [ $hh -lt 10 ] && [ $hh -ge 0 ]
                        then
                            if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo A${dd}-B${hh} >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                                else
                                echo "$dd0$hh" >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                                fi
                        else
                             if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo "0$dd$hh" >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                              else
                              echo "$dd$hh" >> ddhh_${attribute}_msisdn.txt
                              hh=$(($hh+1));
                             fi
                        fi
                done
                hh=$(($hh-24));
                dd=$(($dd+1));
                flag=$(($flag-1));
                continue;
        else
                if [ $hh -lt $ehh ] && [ $flag -gt 0 ]
                then
                        while [ $hh -le 23 ]
                        do
                        if [ $hh -lt 10 ] && [ $hh -ge 0 ]
                        then
                            if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo -e "0"$dd"0"$hh >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                                else
                                echo -e $dd"0"$hh >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                                fi
                        else
                            if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo "0$dd$hh" >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                              else
                              echo "$dd$hh" >> ddhh_${attribute}_msisdn.txt
                              hh=$(($hh+1));
                             fi
                        fi
                        done
                        hh=$(($hh-24));
                        dd=$(($dd+1));
                        flag=$(($flag-1));
                        continue;
                else
                        if [ $hh -lt $ehh ] && [ $flag -eq 0 ]
                        then
                        while [ $hh -le $ehh ]
                                do
                                if [ $hh -lt 10 ] && [ $hh -ge 0 ]
                        then
                            if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo -e "0"$dd"0"$hh >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                                else
                                echo -e $dd"0"$hh >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                                fi
                        else
                             if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo -e "0"$dd$hh >> ddhh_${attribute}_msisdn.txt
                                hh=$(($hh+1));
                              else
                              echo "$dd$hh" >> ddhh_${attribute}_msisdn.txt
                              hh=$(($hh+1));
                             fi
                        fi
                                done
                                flag=$(($flag-1));
                                break;

                        fi

                fi
        fi
done



echo -e "Sr. No,IMSI,IMEI,MSISDN,MAC ID,Source IP,Source Port,Destination IP,Destination Port,Translated IP,Translated Port,First Cell ID-Name/Location,Session Start date &time,Session End date & time,Duration in sec,Data Volume Uplink,Data Volume Downlink,PGW IP address,Charging ID,Access Point Name,PDP Address IPv4,PDP Address IPv6,CGI-ld,RAT,PDP-type" > ${SearchReportPath}/DOTReport_${attribute}_${dd1}${mm1}${yy}${hh1}${MM}${ss}_${date1}


for SearchDataPath in `cat Searchpath.txt`
do
        for hour in `cat ddhh_${attribute}_msisdn.txt`
        do
                xdd=`echo $hour|cut -c'1-2'`
                yhh=`echo $hour|cut -c'3-4'`
                for i in `ls -1 ${SearchDataPath}${yy}${mm1}/*${yy}${mm1}${xdd}_${yhh}*.gz 2> /dev/null`
                do
                zcat ${i}|grep "${attribute}"|awk -v a="$StartDate" -v b="$EndDate" -F, '{if($12<=b && $13>=a ) print $0}'|sort -k12 -t','|awk '{ print FNR "," $0 }' >>${SearchReportPath}/DOTReport_${attribute}_${dd1}${mm1}${yy}${hh1}${MM}${ss}_${date1}
                done
        done
done
gzip ${SearchReportPath}/DOTReport_${attribute}_${dd1}${mm1}${yy}${hh1}${MM}${ss}_${date1}


echo -e "Search finished on :`date`" >> $LogPath/Searchlog_${attribute}_$remark.log
