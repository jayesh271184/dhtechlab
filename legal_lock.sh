lock_path=/opt/crestelsetup/
if [ -f ${lock_path}.legalSPLIT.lock ]
        then
                echo "script is already running"
                exit
        else
                echo " creating lock file "
                touch ${lock_path}.legalSPLIT.lock
		nice -10 taskset -c 0,1 sh /u01/scripts/legallog_po_move.sh
                nice -10 taskset -c 0,1 sh /u01/scripts/legallog_pr_move.sh
                rm ${lock_path}.legalSPLIT.lock
fi;
