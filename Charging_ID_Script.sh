DATE=`date -d '-1 day' '+%Y%m%d'`
CURRDATE=`date '+%Y%m%d_%H%M%S'`
DATEHOUR=`date '+%Y%m%d%H'`
DATEMIN=`date '+%Y%m%d%H%M'`
D=`date`
STATICDATE="20180919"
START_TIME=$SECONDS
P1=/u02/HMSC/PGW/SCRIPT_CHARGINGID
lock_path=/tmp/
LOCK_NAME="UNIQUE_CHARGING_ID_SCRIPT"


############# LOCK FILE ########################
if test -f ${lock_path}.UNIQUE_CHARGING_ID_SCRIPT.lock
        then
                echo "$LOCK_NAME is already running ; Exit" >> $P1/${CURRDATE}_$LOCK_NAME.log
				ELAPSED_TIME=$((${SECONDS} - ${START_TIME}))
                D=`date`
                echo "1-SCRIPT is completed : $D : Duration : ${ELAPSED_TIME}s" >> $P1/${CURRDATE}_$LOCK_NAME.log
        else
                echo " creating lock file for execution" >> $P1/${CURRDATE}_$LOCK_NAME.log
                touch ${lock_path}.$LOCK_NAME.lock
				
				
## PGW ##

CDRSUBTYPE="PGW"
CIRCLESUBDIR="AHD MP"
CALLTYPEDIR="POSTPAID PREPAID_F PREPAID_NF"
for CDRTYPE in ${CDRSUBTYPE}
do				
	for CIRCLE in ${CIRCLESUBDIR}
	do
		for CALLTYPE in ${CALLTYPEDIR}
		do
			if [ -d ${P1}/${CDRTYPE}/${CIRCLE}/${CALLTYPE} ]; then
					cd ${P1}/${CDRTYPE}/${CIRCLE}/${CALLTYPE}
						UNIQUE_CHARGING_ID_COUNT=( $(find . -type f -name "*$STATICDATE*" -exec cat {} + 2>&1 | cut -d ,  -f31 | sort | uniq -c | tr -s ' ' ',' | cut -d , -f2,3) )
						for i in ${UNIQUE_CHARGING_ID_COUNT[@]}
						do
							echo $DATEHOUR,$CDRTYPE,$CIRCLE,$CALLTYPE,$i >> $P1/ChargingID_Detailed_$DATEHOUR.csv
						done
						SUM_CHARGING_ID=`awk -F , '{SUM+=$5} END {print SUM}' $P1/ChargingID_Detailed_$DATEHOUR.csv`
						echo $DATEHOUR,$CDRTYPE,$CIRCLE,$CALLTYPE,$SUM_CHARGING_ID >> $P1/ChargingID_Summary_$DATEHOUR.csv
			fi;
		done
	done
done

unset CDRSUBTYPE
unset CALLTYPEDIR
unset CIRCLESUBDIR

## SGW ##

CDRSUBTYPE="SGW"
CIRCLESUBDIR="AHD MP"
CALLTYPEDIR="INTNATROAMER"
for CDRTYPE in ${CDRSUBTYPE}
do				
	for CIRCLE in ${CIRCLESUBDIR}
	do
		for CALLTYPE in ${CALLTYPEDIR}
		do
			if [ -d ${P1}/${CDRTYPE}/${CIRCLE}/${CALLTYPE} ]; then
					cd ${P1}/${CDRTYPE}/${CIRCLE}/${CALLTYPE}
						UNIQUE_CHARGING_ID_COUNT=( $(find . -type f -name "*$STATICDATE*" -exec cat {} + 2>&1 | cut -d ,  -f31 | sort | uniq -c | tr -s ' ' ',' | cut -d , -f2,3) )
						for i in ${UNIQUE_CHARGING_ID_COUNT[@]}
						do
							echo $DATEHOUR,$CDRTYPE,$CIRCLE,$CALLTYPE,$i >> $P1/ChargingID_Detailed_$DATEHOUR.csv
						done
						SUM_CHARGING_ID=`awk -F , '{SUM+=$5} END {print SUM}' $P1/ChargingID_Detailed_$DATEHOUR.csv`
						echo $DATEHOUR,$CDRTYPE,$CIRCLE,$CALLTYPE,$SUM_CHARGING_ID >> $P1/ChargingID_Summary_$DATEHOUR.csv
			fi;
		done
	done
done



fi;

ELAPSED_TIME=$((${SECONDS} - ${START_TIME}))
D=`date`
echo "$LOCK_NAME is completed : $D : Duration : ${ELAPSED_TIME}s" >> $P1/${CURRDATE}_$LOCK_NAME.log

rm ${lock_path}.$LOCK_NAME.lock
echo "LOCK IS REMOVED for $LOCK_NAME" >> ${P1}/${CURRDATE}_$LOCK_NAME.log