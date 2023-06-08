inputpath=/opt/iplms/PARIN/IN
destpath=/opt/iplms/PARIN/out
archpath=/opt/iplms/PARIN/archive
date=`date -d 'now -0 days' '+%Y%m%d%H%M%S'`;
b=000001
c=1_Netflow_`hostname`_TaxiWIFI_$date-$b.csv;
echo -e "version,expTime,TmpID,365,366,95,147,61,1,2,98,195,367,LAT,LON" > $destpath/$c
for i in `ls -tr $inputpath/*.csv |head -3`;
do
cat $i|grep -v "version,expTime,TmpID,365,366,95,147,61,1,2,98,195,367,LAT,LON" >> $destpath/$c
mv $i $archpath/
done;
