# Script to move EDR from collection to parsing input
P1="/u01/UPSTREAM/EDR/edr"
P2="/u02/PARSING_INPUT"
lock_path=/tmp/
if test -f ${lock_path}.NET_MV.lock
        then
                echo "Status : script is already running"
                exit
        else
                echo " creating lock file "
                touch ${lock_path}.NET_MV.lock
fi

#find $P1 -type f -mmin +6 -name "*.gz" -exec mv -vt $P2 {} + 2>> /opt/crestelsetup/scripts/edr_move_files.log
#find $P1 -type f -mmin +6 -name "*.gz" |xargs -i  mv -v {} $P2 >> /opt/crestelsetup/scripts/edr_move_files.log
a=`find $P1 -type f -mmin +1 -name "*INVIKL08COH1D1*.gz" |xargs -n 1 basename `
for i in $a
do
DAT=`ls ${P1}/${i} --full-time | awk '{print$6"_"$7}' `
echo "$DAT, $i" >> /opt/crestelsetup/scripts/edr_move_files_latest.log
done
cd $P1
mv -v $a $P2

cd $P2
ulimit -s 1000000000
chown crestel:crestelsetup *.gz
chmod 755 *.gz
rm -rf /u01/UPSTREAM/EDR/event/*
rm -rf /u01/UPSTREAM/EDR/hexdump/*
######################rsync to sec########################
sshpass -p "edr123" rsync --remove-sent-files -a -e "ssh -p 22" /u01/UPSTREAM/EDR/edr/INVIKL08COH1D2*.gz edr@10.103.116.50:/u01/UPSTREAM/EDR/edr/
rm -rf ${lock_path}.NET_MV.lock
echo "script completed"
