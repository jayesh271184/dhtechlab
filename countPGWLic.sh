#!/bin/bash

Y=`date -d "-1 days" +"%Y"`
M=`date -d "-1 days" +"%-m"`
D=`date -d "-1 days" +"%-d"`
j=`date --date="1 days ago" +"%Y-%m-%d"`
counter=0
counter1=0
counter2=0
one=1
a=0

SEARCHFILE=/CGFBACKUP4/LTE_PGW_asn/archived/$Y/$M/$D/

SEARCHFILE1=/CGFBACKUP3/LTE_SGW_PGW_parsed/filtered/Discard_PGW_LTE_RG0/input/

##Reseting lastcounter
cat /dev/null > /opt/ideacgf02/scripts/PGW_License_counter.txt

echo "File Count Script is started:: `date` "


find ${SEARCHFILE} -type f -print > line.txt

                                                    while read line
                                                    do
                                                       a=`zcat $line | wc -l`
                                                       a=`expr $a - $one`
                                                       counter1=`expr $counter1 + $a`
                                                       done < line.txt
						
find ${SEARCHFILE1} -type f -name "*$j*" -print  > line1.txt

                                                    while read line
                                                    do
                                                       b=`zcat $line | wc -l`
                                                       b=`expr $b - $one`
                                                       counter2=`expr $counter2 + $b`
                                                       done < line1.txt
							counter=`expr $counter1 + $counter2`
                                                echo $counter > /opt/ideacgf02/scripts/PGW_License_counter.txt

echo $date "PGW Counts  are : " $counter
						PGWFinalCounter=`cat /opt/ideacgf02/scripts/PGW_License_counter.txt`

echo "File Counter script  completed:: `date` "
