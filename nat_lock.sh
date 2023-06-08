lock_path=/opt/crestelsetup/
if [ -f ${lock_path}.natSPLIT.lock ]
        then
                echo "script is already running"
                exit
        else
                echo " creating lock file "
                touch ${lock_path}.natSPLIT.lock
		nice -10 taskset -c 0,1 sh /u01/scripts/netlog_move.sh
                rm ${lock_path}.natSPLIT.lock
fi;
