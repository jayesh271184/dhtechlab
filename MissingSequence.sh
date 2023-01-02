DAY=`date -d "-1 days" +%Y%m%d`;
log=/tmp
path=/tmp
> file2
> file

#for i in `cat $path/1_SFTP_COLLECTION_DIGI_SPICE_20220722.csv|grep SMSC04` ; do seq=`echo $i|cut -d',' -f2|cut -d'.' -f3`; time=`echo $i|cut -d',' -f2|cut -d'.' -f5|cut -c'1-10'`; echo $seq|grep -v "-" >> file2; done

for Node in {SMSC04,SMSC05,SMSC06}
do 

for i in `cat $path/1_SFTP_COLLECTION_DIGI_SPICE_20220722.csv|grep $Node` ; do seq=`echo $i|cut -d',' -f2|cut -d'.' -f3`; echo $seq|grep -v "-" >> $log/file2; done
cat $log/file2|sort >> $log/file

seq $(head -n1 $log/file) $(tail -n1 $log/file) | grep -vwFf file >> $log/$Node-$DAY-MISSINGSEQUENCE.csv

done

