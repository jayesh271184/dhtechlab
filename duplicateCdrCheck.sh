#!/bin/bash 
TOH=`date -d 'now -0 Hour' '+%Y%m%d%H'`
alarm1=0
alarm2=0
alarm3=0
alarm4=0
alarm5=0
alarm6=0
alarm7=0
path=/u01/sftplog/DUPLICATE-CDR;
alarm1=`sort /u01/d1/u01/composer/Postpaid/input_file_backup3/EMM_AMD_TEMP/RAJ/GPGUJP*$TOH*prc* | uniq -c -d | wc -l`
echo "No.Of Duplicate CDRs Generated in Postpaid/RAJ: "$alram1 > $path/duplicate-composer.txt
alarm2=`sort /u01/d1/u01/composer/Postpaid/input_file_backup3/EMM_AMD_TEMP/MP/GPGUJP*$TOH*prc* | uniq -c -d | wc -l`
echo "No.Of Duplicate CDRs Generated in Postpaid/MP: "$alram2 >>$path/duplicate-composer.txt
alarm3=`sort /u01/d1/u01/composer/Postpaid/input_file_backup3/EMM_AMD_TEMP/PGW/GJ/GPGUJP*$TOH*prc* | uniq -c -d | wc -l`
echo "No.Of Duplicate CDRs Generated in Postpaid/PGW/GJ: "$alram3 >>$path/duplicate-composer.txt
alarm4=`sort /u01/d1/u01/composer/Postpaid/input_file_backup3/EMM_AMD_TEMP/PGW/MH/GPGUJP*$TOH*prc*| uniq -c -d | wc -l` 
echo "No.Of Duplicate CDRs Generated in Postpaid/PGW/MH: "$alram4 >>$path/duplicate-composer.txt
alarm5=`sort /u01/d1/u01/composer/Postpaid/input_file_backup3/EMM_AMD_TEMP/MUM/GPGUJP*$TOH*prc* | uniq -c -d | wc -l`
echo "No.Of Duplicate CDRs Generated in Postpaid/MUM: "$alram5 >>$path/duplicate-composer.txt
alarm6=`sort /u01/d1/u01/composer/Postpaid/input_file_backup3/EMM_AMD_TEMP/MH/GPGUJP*$TOH*prc* | uniq -c -d | wc -l`
echo "No.Of Duplicate CDRs Generated in Postpaid/MH: "$alram6 >>$path/duplicate-composer.txt
alarm7=`sort /u01/d1/u01/composer/Postpaid/input_file_backup3/EMM_AMD_TEMP/PGW/RAJ/GPGUJP*$TOH*prc* | uniq -c -d | wc -l`
echo "No.Of Duplicate CDRs Generated in Postpaid/PGW/RAJ: "$alram7 >>$path/duplicate-composer.txt