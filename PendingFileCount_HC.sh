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
MAX_ALLOWED_FILES=1
echo PendingFilecount,ServerHostname,ServerIP,PendingFilePath,PendingFileCount >${log}/${hostname}_${Server}_${DAY}_HC.csv
for file in `find $BASE_DIR -type d|grep -v STAT|grep -v Script|grep -v ftp_distributed|grep -v oracle|grep -v arch|grep -v jdk|grep -v SFTPUploader|grep -v modules|grep -v webapps|grep -v logs|grep -v lib|grep -v Recon `
do
          TOTAL_FILES=`find $file -maxdepth 1 -type f -mmin +60 | wc -l`
            if test $TOTAL_FILES -ge $MAX_ALLOWED_FILES
                      then
                                echo PendingFilecount-${PHour},`hostname`,`hostname -i`,$file,$TOTAL_FILES >>$log/${hostname}_${Server}_${DAY}_HC.csv
                                  fi
                          done
rsync  -av -e "ssh" $log/${hostname}_*_${DAY}_HC.csv root@10.164.7.50:${REMOTE_DIR}/