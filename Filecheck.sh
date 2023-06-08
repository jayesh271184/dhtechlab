INPUT=/opt/tatasky/INPUT
OUTPUT=/opt/tatasky/OUTPUT
ARCH=/opt/tatasky/ARCH
for i in `ls -1 $INPUT/`;
do
echo -e "general1,startdate,enddate,duration,general2,general3,general4,general5,general6,general7,general8,general9,general10,general11,general12,general13,general14,general15,general16,general17,general18" > $OUTPUT/$i-new.csv
cat $INPUT/$i |grep "11,"|grep "IPv4" >> $OUTPUT/$i-new.csv;
mv $INPUT/$i $ARCH/;
done


