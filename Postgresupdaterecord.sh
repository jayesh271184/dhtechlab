#!/bin/bash
logpath=/tmp
LogBackuppath=/tmp/LogBackuppath/
Scriptpath=/tmp



for i in `ls -1 $logpath/Ingestion_Instance-*.csv`; ##Loop 1 Start
do 

while read line   ##Loop 2 Start
	do
    Param1=`echo $line|cut -d',' -f1`; 
    Param2=`echo $line|cut -d',' -f2`; 
    Param3=`echo $line|cut -d',' -f3`; 
    Param4=`echo $line|cut -d',' -f4`; 
    Param5=`echo $line|cut -d',' -f5`; 
    Param6=`echo $line|cut -d',' -f6`; 
    Param7=`echo $line|cut -d',' -f7`; 
    Param8=`echo $line|cut -d',' -f8`; 
    Param9=`echo $line|cut -d',' -f9`; 
 
echo $Param1 $Param2 $Param3 $Param4 $Param5 $Param6 $Param7 $Param8 $Param9
#    sh $Scriptpath/IngestionDataUpdate.sh $Param1 $Param2 $Param3 $Param4 $Param5 $Param6 $Param7 $Param8 $Param9 
	done < $i ##Loop 2 Stop
mv $i $i.done
mv $logpath/*.done $LogBackuppath/
	
done ##Loop 1 Stop