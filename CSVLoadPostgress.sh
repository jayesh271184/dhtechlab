export PGPASSWORD=kpi
cnt=`psql kpi kpi -t << EOF 
select count(0) from  ingestionkpistore where workflowname ='$1' and filedate='$2' and fileregex='Default' ;
EOF`

echo "Count is:"$cnt

if [ $cnt -eq 0 ]
then 
        echo "Count is Zero, Inserting data into table"
	echo "Test"
	psql kpi kpi << EOF1
		insert into ingestionkpistore (workflowname,filedate,timestamp,source,destination,successcount,errorcount,circle,fileregex,lastpartitionid,successfilesize,errorfilesize)
		values('$1','$2','$3','$4','$5','$6',0,'$7','Default','$8','$9',0);
EOF1
	
	
else
	echo "Count is not Zero,Updating Data"
	psql kpi kpi << EOF
	update ingestionkpistore
	set timestamp = '$3' ,
            successcount = successcount + $6,
	    successfilesize = successfilesize + $9,	
	    lastpartitionid='$8'
	where workflowname ='$1'
	and destination='$5'
        and filedate='$2'
	and fileregex='Default';
EOF
fi