TOTAL_LINES=`wc -l PrivateIP.csv | cut -d " " -f1 `
for (( i=1 ; i <= $TOTAL_LINES; i++ )); 
do 
LINE=`head -n$i PrivateIP.csv | tail -n1`; 
GGSNIP=`echo $LINE|cut -d',' -f24`
PublicIP=`echo $LINE|cut -d',' -f34`
#echo -e "$GGSNIP ----  $PublicIP";
if grep -q $PublicIP /opt/vfiplms/TESTPRO/GGSNIP/*$GGSNIP*;
then
echo $LINE >> testresult.csv;
else
echo $LINE >> notmatch.csv;
fi;
done
