for i in `ls -1 *.csv`
do

sed '1,1d' $i > ${i}_new
sed -n '1,1p' $i > ${i}_head
total_line_num=`cat ${i}_new | awk -F ',' 'length($33) > 12 {print $1}'| wc -l`
cat ${i}_new | awk -F ',' 'length($33) > 12 {print $1}' > file.txt
num=`cat file.txt`
num1=`echo $num | sed 's/ /d;/g'`
numnew=`echo $num1 | sed s/$/"d;"/g`
cat ${i}_new | sed "${numnew}"  >> ${i}_head
mv ${i}_head ${i}
done
rm file.txt
rm *_new
