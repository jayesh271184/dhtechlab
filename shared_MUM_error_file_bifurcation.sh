#!/bin/bash
#Created On - 21/09/2017
#Created by - Harsh Jain
#Purpose - Process error files on MUM Circle
#Steps to Execute the script:
#Step 1 - Keep the script in the directory where error files are placed.
#Step 2 - Enter correct path details for INPUT, OUTPUT, ARCH and ERROR variable.
#Step 3 - Create appropriate paths as mentioned for INPUT, OUTPUT, ARCH and ERROR variable using mkdir command.

INPUT=/root/h_new/INPUT
OUTPUT=/root/h_new/OUTPUT
ERROR=/root/h_new/ERROR
ARCH=/root/h_new/ARCH

for i in `ls -1 *.csv`;
do

count=`sed 's/[^,]//g' $i | awk '{ print length }'`
echo -e "$count" > file1.txt

lnum=`cat file1.txt | grep -n 21| awk -F : '{print $1}'`;plnum=`echo $lnum | sed s/" "/"p;"/g `;eplnum=`echo $plnum |sed s/$/"p;"/g`;dlnum=`echo $lnum | sed s/" "/"d;"/g`;edlnum=`echo $dlnum |sed s/$/"d;"/g`

if [ `echo $lnum | wc -w` == 1 ] ; then 

cat $i | sed -n ${lnum}p > "${ERROR}/${i}_ERROR_line.csv"
cat $i | sed ${lnum}d > "${OUTPUT}/${i}_correct_cdr.csv"

else 

cat $i | sed -n ''${eplnum}'' > "${ERROR}/${i}_ERROR_line.csv"
cat $i | sed ''${edlnum}'' > "${OUTPUT}/${i}_correct_cdr.csv"

fi;

mv $INPUT/$i $ARCH/;
rm -rf file1.txt
done;