#!/bin/bash/
P1="/tmp/input/"
P2="/tmp/input1/"
P3="/tmp/USG_ARCH/"

cd ${P1}

for file in `ls -1 *.csv`
do
echo "first For loop"
var=`cat ${file} | grep "Acct-Session-Time" | awk -F'=' '{print $2}'`
echo "Variable defined"
for i in ${var}
do
echo "Second for loop"
if [[ ${i} -gt 500 ]]
then
echo "if loop"
sed 's/Acct-Session-Time = '${i}'/Acct-Session-Time = 500/g' ${file} >> ${P2}/${file}
mv ${file} ${P3}
fi
done
done

