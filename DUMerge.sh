#!/bin/bash
Source2=/opt/iplms/Source2; #New Path From Where Parsing Service will pick the Files
SourcePath=/opt/iplms/SourcePath; #Collection Path where Collection Service is Writing the files
TempPath=/opt/iplms/TempPath; #Any Temp Path where Merge Operation will be done
TempArch=/opt/iplms/TempArch;	#All Files will be store for futute reference as a backup which has been merge


find $SourcePath/. -name "*.gz" -type f -size -5k -exec mv {} $TempPath/. \; #it will move all files less then 5 KB to Temp Path for merge operation
find $SourcePath/. -name "*.gz" -type f -size +5k -exec mv {} $Source2/. \; # it will move all files greater then 5KB to input folder for furrther parsing 
cd $TempPath;
for i in  `ls -1 *.gz`; do echo $i ;zcat $i >> temp;mv $i $TempArch/;j=`du temp|awk -F' ' '{print $1}'`;  if [ $j -ge 500 ]; then gzip temp;mv temp.gz $Source2/$i  ;   fi; done #it will list all files having size less than %K , took backup of the same and merge it in to the last file name of the list and move to the folder for next level parsing , Change the perameter 500 to the required limit 3072;
