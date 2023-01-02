#!/bin/bash/
P1="/u01/VIL_CGF/"
P2="/u01/VIL_CGF/Final/"
P3="/u01/VIL_CGF/ARCH/"
MMSS=`date '+%M%S'`

cd ${P1}
for i in `ls -1 *.csv`
do
j=`cat $i|grep -v EndDate|cut -d',' -f3|cut -c'1-10'|sort | uniq`

header=`cat $i|head -1`
for k in `echo $j`
do
cat ${i}|awk -F',' '$3 ~ /'${k}'/ { print $0 }'>> ${P2}/GP_${k}${MMSS}.${i}
#cat ${i}|grep ${k} >> ${P2}/GP_${k}_${MMSS}.${i}
done
sed -i '1s/^/'$header'\n/g' ${P2}/*${i}
#rm -rf  ${P2}/*EndDate*
mv $i ${P3}/
done
