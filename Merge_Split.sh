#!/bin/bash


########################################################################################################
#FUNCTION TO CHECK LOCK FILE
checkLockFile()
{

        if [ ! -f $lockFile ]
        then
                echo "Lock File Removed. Exiting for Circle:" $circleId " Ingestion Type:" $ingType "Instance Number:" $instNumber
                exit
        fi

}


########################################################################################################
#FUNCTION TO Split Samehour Files
HourWiseFile()
{

#!/bin/bash/
P1=$1
P2=$2
P3=$3

mkdir -p $2
mkdir -p $3
MMSS=`date '+%M%S'`

cd ${P1}
for i in `ls -1 M_*.csv`
do
j=`cat $i|grep -v EndDate|cut -d',' -f3|cut -c'1-10'|sort | uniq`

header=`cat $i|head -1`
for k in `echo $j`
do
cat ${i}|awk -F',' '$3 ~ /'${k}'/ { print $0 }'>> ${P2}/S_${k}${MMSS}.${i}
done
sed -i '1s/^/'$header'\n/g' ${P2}/S_${k}${MMSS}.${i}
mv $i ${P3}/
done

}

########################################################################################################


#Initialise Master parameters
circleId=$1
ingType=$2
batchName=$3   
instNumber=$4

partitionDataPath="/tmp/LastProcessTimeStamp/"
partitiondataFile="LastProcessTimeStamp.csv"
batchFilePath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/BatchFiles/"
doneBatchFilePath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/BatchFiles/done/"
logPath="/u01/var/log/dataingestion/NONCORRELATED/$ingType/$circleId/"
logFileName="Move_$circleId_$ingType_$batchName"
logMergeFileName="Merge_$circleId_$ingType_$batchName"
inputPath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/Input/"
archivePath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/Archive/"
duplicatePath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/DuplicateData/"
errorPath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/Error/"
mergePath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/Merge/"
hdfsBacklogPath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/BACKLOG/"
hdfsOnlinePath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/"
lockFile="/tmp/BatchCreation_"$1"_"$2".lock"
targetPath="/CGNATDATA/NONCORRELATED/$circleId/$ingType/InputFinal/"
checkLockFile

#Create directories
mkdir -p $archivePath
mkdir -p $duplicatePath
mkdir -p $errorPath
mkdir -p $logPath
mkdir -p $doneBatchFilePath
mkdir -p $mergePath



#Read the Batch File and identfy  directory
totalSize=0
prevHour=0
maxFileSize=51200
fileCount=0
successCount=0

HourWiseFile $inputPath $targetPath $archivePath
for file in `cat $batchFilePath$batchName`
do
#HourWiseFile $inputPath $targetPath $archivePath
        fileName=`echo $file|cut -d ',' -f 1`
        dateHour=`echo $file|cut -d ',' -f 2`
        chmod 777 $inputPath$fileName
        
        #PROCEED ONLY IF THE FILE EXISTS 
        if [  -f $inputPath$fileName ]
        then
        
                header=`head -1 $inputPath$fileName`
                fileSize=`du -k $inputPath$fileName | cut -f1`
                #echo "File Name:" $fileName " DateHour:" $dateHour  "Total Size :" $totalSize  "Perform Ingestion:" $performIngesion  "PreviousHour:" $prevHour              
         
                #Merge Files
                if [ $totalSize -eq 0 ]
                then
                        mergeFileName=M_$fileName
                        mergeHeader=`head -1 $inputPath$fileName`
                        cat $inputPath$fileName  >> $inputPath$mergeFileName
                        mv $inputPath$fileName $archivePath
                        totalSize=$fileSize
                        prevHour=$dateHour
                        successCount=1

                elif [ $prevHour -eq $dateHour ] && [ $totalSize -lt $maxFileSize ] && [ $header == $mergeHeader ] 
                then
                        cat $inputPath$fileName | grep -v general >> $inputPath$mergeFileName
                        totalSize=`expr $totalSize + $fileSize`
                        successCount=`expr $successCount + 1`
                        mv $inputPath$fileName $archivePath
                        echo $fileName " to " $mergeFileName >> $logPath$logMergeFileName

                else
                        #Perform Ingestion of Previous Hour
                        #mv $inputPath$mergeFileName $targetPath
			HourWiseFile $inputPath $targetPath $archivePath
                        chmod 777  $targetPath$mergeFileName


                        echo $circleId$ingType,$prevHour,`date +'%Y-%m-%d %H:%M:%S.000'`,$inputPath,$targetpath,$successCount,$circleId,$lastProcessedTimeslot,$totalSize >> $logPath$logFileName
 
                        checkLockFile

                        mergeFileName=M_$fileName
                        mergeHeader=`head -1 $inputPath$fileName`
                        cat $inputPath$fileName  >> $inputPath$mergeFileName
                        mv $inputPath$fileName $archivePath               
                        totalSize=$fileSize
                        prevHour=$dateHour
                        successCount=1
                fi

        else
                echo "File Does not Exists: " $fileName 
        fi

done
                       


#Ingest the last file
if [ $totalSize -gt 0 ] 
then  
        #mv $inputPath$mergeFileName $targetPath
	HourWiseFile $inputPath $targetPath $archivePath
        chmod 777  $targetPath$mergeFileName
        echo $circleId$ingType,$prevHour,`date +'%Y-%m-%d %H:%M:%S.000'`,$inputPath,$targetpath,$successCount,$circleId,$lastProcessedTimeslot,$totalSize >> $logPath$logFileName
fi

#Move the Batch File

mv $batchFilePath$batchName  $doneBatchFilePath

echo "Batch File :" $batchName "Processing Completed"

