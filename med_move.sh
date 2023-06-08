lock_path=/var/
if [ -f ${lock_path}.SPLIT.lock ]
        then
                echo "script is already running"
                exit
        else
                echo " creating lock file "
                touch ${lock_path}.SPLIT.lock
mv /LVFMDUSAGEDATA/CHN1_MED_DATA/archieved/postpaid/*.DATA /LVBACKLOGDATA/CHN1_MED_DATA/archieved/postpaid/
mv /LVFMDUSAGEDATA/CHN1_MED_DATA/archieved/prepaid/*.DATA /LVBACKLOGDATA/CHN1_MED_DATA/archieved/prepaid/
rm ${lock_path}.SPLIT.lock                 				
fi;
