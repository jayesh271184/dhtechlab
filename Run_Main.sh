. ./db.properties

echo 'Batch created Successfully.'

		if [ -e "Sync.log" ];
        then
        rm Sync.log 
        fi
		touch Sync.log

CDR_DATE='2018-05-01'
		
for (( j=0; j<$1; j++))

do


	while [ `cat Sync.log | grep Running | wc -l` -gt 0 ]
		do
		sleep 1
		echo 'Sleeping for 1 Sec.'
		done 	

From_Date=$(date +%Y%m%d -d "$CDR_DATE + $i day")
echo 'Table Creation for '$From_Date
#sh Worker.sh $From_Date $j 'Y'
		
for (( i=0; i<10; i++))
do
  
  
   if [ -e "migration$i.log" ];
        then
        rm migration$i.log 
        fi
        touch migration$i.log
        echo 'Running Child '$i' Process' >> Sync.log
        nohup sh Worker.sh $From_Date $i 'N'> migration$i.log 2>&1 &
        
        echo "Started Loading for bacth $i in nohup"
done

done
