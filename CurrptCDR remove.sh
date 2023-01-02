for i in `ls -1 *.gz`; ##Loop 1 Start
do

zcat $i > $i.csv
mv $i /u04/ftp_distributed/
for j in `ls -1 *.csv`
do


while read line   ##Loop 2 Start
        do
    C=`echo $line|awk -F',' '{print NF}'`
T=26

if [ $C == $T ]
then
echo $line >> $j.new
else
echo $C
fi


        done < $j ##Loop 2 Stop
done
done ##Loop 1 Stop

mv *.csv /u04/ftp_distributed/
gzip *.csv.new
mv *.csv.new.gz /u01/EDR/PRO-IDEA/input/