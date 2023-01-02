BASE_DIR="/u0*/"
hostname=`hostname`
log=/tmp
DAY=`date +%Y%m%d`;
Server=`hostname -i`
REMOTE_DIR=/u01/COL_HC
TOTAL_FILES=0
YDAY=`date -d "-1 days" +%Y%m%d`;
PHour=`date -d "-1 days" +"%-H"`
TODAY=`date +%Y%m%d`;
MAX_ALLOWED_FILES=100
echo PendingFilecount,ServerHostname,ServerIP,PendingFilePath,PendingFileCount >>${log}/${hostname}_${Server}_${DAY}_HC.csv
for file in `find $BASE_DIR -type d|grep -v STAT|grep -v ARCH|grep -v arch|grep -v Recon| grep -v "/u01/app" | grep -v "/u02/IDEA_dest" | grep -v oracle|grep -v ORA`
do
          TOTAL_FILES=`find $file -maxdepth 1 -type f -mmin +60 | wc -l`
            if test $TOTAL_FILES -ge $MAX_ALLOWED_FILES
                      then
                                echo PendingFilecount-${PHour},`hostname`,`hostname -i`,$file,$TOTAL_FILES >>$log/${hostname}_${Server}_${DAY}_HC.csv
                                  fi
                          done
for i in `ls -1rt ${log}/*.csv`
do
sshpass -p "admin@123" rsync --remove-source-files -av -e "ssh" ${log}/$i root@10.164.7.50:${REMOTE_DIR}/
done
#This is the Script for VIL Server health Check for Pending files on any of the path
