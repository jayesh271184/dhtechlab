P1=/u01/natlog/
P2=/LVFMDNATDATA/natlog_input/
P3=/LVFMDNATDATA/C_iplognatflow/
P4=/LVFMDNATDATA/error/
P5=/LVFMDNATDATA/D_iplognatflow/
P6=/LVFMDNATDATA/error/

nat1=`find $P1  -type f -name *.gz -print | wc -l`
echo "Total number of .gz file in $P1 = $nat1 " > /opt/nms/STAT/s1.txt

nat2=`find $P2 -type f -name *.gz -print | wc -l`
echo "Total number of .gz file in $P2 = $nat2 " >> /opt/nms/STAT/s1.txt

nat3=`find $P3 -type f -name *.gz -print | wc -l`
echo "Total number of .gz file in $P3 = $nat3 " >> /opt/nms/STAT/s1.txt

nat4=`find $P4. -type f  -print | wc -l`
echo "Total number of .error file in $P4 = $nat4 " >> /opt/nms/STAT/s1.txt

na4=`find $P6. -type f  -print | wc -l`
echo "Total number of .error file in $P6 = $na4 " >> /opt/nms/STAT/s1.txt

nat8=`find $P1  -type f -name *.gz -size +10M -print | wc -l `
echo "Total number of .gz file grater than 10 MB in $P1 = $nat8 " >> /opt/nms/STAT/s1.txt

nat9=`find $P1  -type f -name *.gz -size +25M -print | wc -l`
echo "Total number of .gz file grater than 25 MB in $P1 = $nat9 " >> /opt/nms/STAT/s1.txt

nat10=`find $P1  -type f -name *.gz -size -5k -print | wc -l`
echo "Total number of .gz file less than 5 KB in $P1 = $nat10 " >> /opt/nms/STAT/s1.txt

nat11=`find $P1  -type f -name *.gz -size -1k -print | wc -l`
echo "Total number of .gz file less than 1 KB in $P1 = $nat11 " >> /opt/nms/STAT/s1.txt

nat12=`find $P1 -type f -cmin +360 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 6 Hours in $P1 = $nat12 " >> /opt/nms/STAT/s1.txt

nat13=`find $P2 -type f -cmin +360 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 6 Hours in $P2 = $nat13 " >> /opt/nms/STAT/s1.txt

nat14=`find $P3 -type f -cmin +360 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 6 Hours in $P3 = $nat14 " >> /opt/nms/STAT/s1.txt

nat15=`find $P1 -type f -ctime +1 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 1 Day in $P1 = $nat15 " >> /opt/nms/STAT/s1.txt

nat16=`find $P2 -type f -ctime +1 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 1 Day in $P2 = $nat16 " >> /opt/nms/STAT/s1.txt

nat17=`find $P3 -type f -ctime +1 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 1 Day in $P3 = $nat17 " >> /opt/nms/STAT/s1.txt

nat18=`find $P5 -type f -cmin +360 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 6 Hours in $P5 = $nat18 " >> /opt/nms/STAT/s1.txt

nat19=`find $P5 -type f -ctime +1 -name *.gz -print | wc -l`
echo "Total number of .gz file older than 1 Day in $P5 = $nat19 " >> /opt/nms/STAT/s1.txt
