#!/bin/bash

echo -e "Updated the code today 10:22 PM"

for i in `df -kh  | awk '{ print $6 }' | grep "u01\|LVFMDUSAGEDATA" `
do
TOTAL_FILES=0
for file in `find $i -type d`
do
        TOTAL_FILES=`find $file -maxdepth 1 -type f | wc -l`
        echo $file: $TOTAL_FILES
done
done
