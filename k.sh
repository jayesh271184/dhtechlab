#!/bin/bash/
P1="/tmp/jayesh/abc1/custom/"
P2="/tmp/jayesh/abc2/custom/"
P4="/tmp/jayesh/abc1/"
P5="/tmp/jayesh/abc2/"
P3="/tmp/jayesh/arch1/"
P6="/tmp/jayesh/arch2/"

cd ${P1}

for file in `ls -1 *.csv`
do
 sed  's/\\\,/@/g' ${file} >> ${P4}/${file}
 mv ${file} /tmp/jayesh/arch1/
done

cd ${P2}

for file in `ls -1 *.csv`
do      
 sed  's/\\\,/@/g' ${file} >> ${P5}/${file}
 mv ${file} /tmp/jayesh/arch2/
done


