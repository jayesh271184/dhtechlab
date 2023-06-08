ctime=`date -d now '+%Y%m%d_%HH_%MM'`
newpath=/home/oracle/db_csv/counterfiles/
ctr=counter
underscore='_'
csv='.csv'
counterfile=/home/oracle/db_csv/counter.csv
newname=$ctr$underscore$ctime$csv
echo "new name is $newname"
echo "new name with full path is $newpath$newname"
