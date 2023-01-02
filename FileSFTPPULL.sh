#!/bin/sh
LOCAL_FOLDER=/App-log/PARSING/test
REMOTE_FOLDER=/App-log/PARSING/test
DESTUSER='stlmediation'
SERVER='172.22.10.11'
PASSWD='stlmediation'
echo $LOCAL_FOLDER
echo $REMOTE_FOLDER
cd $LOCAL_FOLDER

sshpass -p "$PASSWD" sftp ${DESTUSER}@${SERVER}:/${REMOTE_FOLDER} <<<"ls -1t *.DAT" |  egrep -v "sftp|Changing" > filename.txt

for i in `cat filename.txt`
do
	sshpass -p "$PASSWD" sftp $DESTUSER@$SERVER:/$REMOTE_FOLDER <<<"get $i $LOCAL_FOLDER"
	sshpass -p "$PASSWD" sftp $DESTUSER@$SERVER:/$REMOTE_FOLDER <<<"rename $i $i.DONE"
	#sshpass -p "stlmediation" sftp stlmediation@172.22.10.11:/$REMOTE_FOLDER <<<"rm $i.DONE"
done


