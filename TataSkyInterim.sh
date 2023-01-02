#!/bin/bash/
P1="/pri_iplms_data1/USGDATA/USG_ARCH1"
P2="/u02/USGDATA/USG_INPUT1/"
P3="/pri_iplms_data1/USGDATA/USG_ARCH/"


cd ${P1}
for i in `ls -1 *.csv`
do
cat $i|awk -F',' -vOFS=',' '{if ( ( $10 >= 500 ) && ( $9 == 3 ) )  $10 = 500; print $0}' >> ${P2}/$i
mv $i ${P3}/
done
