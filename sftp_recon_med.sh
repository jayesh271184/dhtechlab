LOCAL_FOLDER=/u01/med_recon/
REMOTE_FOLDER_PO=/input_file_backup4/STREAMS/CGNAT/REPORTS/
REMOTE_FOLDER_PR=/input_file_backup8/STREAMS/CGNAT/REPORTS/
SEND_DATE=`date -d 'now -1 days' '+%Y%m%d'`
echo $LOCAL_FOLDER
echo $REMOTE_FOLDER_PO
echo $SEND_DATE
cd $LOCAL_FOLDER

for file in `ls -1 *PO_${SEND_DATE}*.csv`
do
echo "$file"
sshpass -p Csd@2014 sftp cgnat@10.87.129.193 > $LOCAL_FOLDER/ftp2RECON.log << eofa
cd $REMOTE_FOLDER_PO
mput $file
bye
eofa
done

echo $REMOTE_FOLDER_PR
for file1 in `ls -1 *PR_${SEND_DATE}*.csv`
do
echo "$file1"
sshpass -p Csd@2014 sftp cgnat@10.87.148.154 > $LOCAL_FOLDER/ftp2RECON.log << eofa
cd $REMOTE_FOLDER_PR
mput $file1
bye
eofa
done
