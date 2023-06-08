echo -e "Enter Start Date (Format : dd/mm/yyyy hh:mm:ss):"
read StartDate
echo -e "Enter End Date (Format : dd/mm/yyyy hh:mm:ss):"
read EndDate

> ddhh.txt

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
                                echo A${dd}-B${hh} >> ddhh.txt
                                hh=$(($hh+1));
                                else
                                echo "$dd0$hh" >> ddhh.txt
                                hh=$(($hh+1));
                                fi
                        else
                             if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo "0$dd$hh" >> ddhh.txt
                                hh=$(($hh+1));
                              else
                              echo "$dd$hh" >> ddhh.txt
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
                                echo -e "0"$dd"0"$hh >> ddhh.txt
                                hh=$(($hh+1));
                                else
                                echo -e $dd"0"$hh >> ddhh.txt
                                hh=$(($hh+1));
                                fi
                        else
                            if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo "0$dd$hh" >> ddhh.txt
                                hh=$(($hh+1));
                              else
                              echo "$dd$hh" >> ddhh.txt
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
                                echo -e "0"$dd"0"$hh >> ddhh.txt
                                hh=$(($hh+1));
                                else
                                echo -e $dd"0"$hh >> ddhh.txt
                                hh=$(($hh+1));
                                fi
                        else
                             if [ $dd -lt 10 ] && [ $dd -ge 0 ]
                                then
                                echo -e "0"$dd$hh >> ddhh.txt
                                hh=$(($hh+1));
                              else
                              echo "$dd$hh" >> ddhh.txt
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
