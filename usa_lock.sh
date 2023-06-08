lock_path=/opt/crestelsetup/
if [ -f ${lock_path}.usaSPLIT.lock ]
        then
                echo "script is already running"
                exit
        else
                echo " creating lock file "
                touch ${lock_path}.usaSPLIT.lock
		nice -10 taskset -c 0,1 sh /u01/scripts/usalog_move.sh
                rm ${lock_path}.usaSPLIT.lock
fi;
