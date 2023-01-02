#!/bin/bash

INPUT_1=/opt/iplms/File/natlog_col/192.168.249.130
INPUT_2=/opt/iplms/File/natlog_col/192.168.248.2
INPUT_3=/opt/iplms/File/natlog_col/192.168.247.2
INPUT_4=/opt/iplms/File/natlog_col/192.168.249.2
INPUT_5=/opt/iplms/File/natlog_col/192.168.248.66
INPUT_6=/opt/iplms/File/natlog_col/192.168.252.130
INPUT_7=/opt/iplms/File/natlog_col/192.168.248.130
INPUT_8=/opt/iplms/File/natlog_col/192.168.252.134
INPUT_9=/opt/iplms/File/natlog_col/192.168.248.194

STAT=/opt/iplms/FILE_COUNT_MONITOR

rm -rf $STAT/STATUS.csv

##FOR INPUT_1
file_count=$(find $INPUT_1 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_1 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_1=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_1=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_2
file_count=$(find $INPUT_2 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_2 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_2=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_2=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_3
file_count=$(find $INPUT_3 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_3 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_3=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_3=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_4
file_count=$(find $INPUT_4 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_4 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_4=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_4=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_5
file_count=$(find $INPUT_5 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_5 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_5=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_5=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_6
file_count=$(find $INPUT_6 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_6 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_6=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_6=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_7
file_count=$(find $INPUT_7 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_7 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_7=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_7=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_8
file_count=$(find $INPUT_8 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_8 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_8=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_8=1\n" >> $STAT/STATUS.csv
fi

##FOR INPUT_9
file_count=$(find $INPUT_9 -type f |wc -l)
sleep 1m
file_count1=$(find $INPUT_9 -type f |wc -l)

if [ $file_count -lt $file_count1 ]
then
    printf "INPUT_9=0\n" >> $STAT/STATUS.csv
else
    printf "INPUT_9=1\n" >> $STAT/STATUS.csv
fi
