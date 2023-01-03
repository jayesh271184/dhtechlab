Src=/tmp/jayesh1
Dest=/tmp/jayesh1
arch=/tmp/jayesh3
file=`find $Src -type f -iname "mat*.gz" -mmin +60 |cut -d'/' -f4`
for i in  $file
do
cd $Src
zcat $i|grep -v ",53,"|gzip > $Dest/NoDNS_$i
mv $i $arch/
done
#gzip $Dest/*.csv
#Created By jayesh Shah
