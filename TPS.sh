path=/HQB-SAS-COL/NAT-STATS/NATFLOWBINARY_COLLECTION_SERVICE/;
for j in {01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
do
j1=`expr $j % 100`;
cd $path/2017/7/;
k=`for i in {00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23};do zcat ./$j1/*.gz|grep "$j/07/2017 $i:00:0"|cut -d',' -f1|cut -d':' -f2;done|sort|tail -1`
echo "Date $j/07/2017 :"$k >>July-17.txt
done
