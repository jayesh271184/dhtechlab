for i in `cat input.txt`
do
nmap -sL -n $i |cut -d' ' -f5 >>IPAddress.txt;
done;

for i in `cat IPRange.txt` ;
do 
cat IPAddress.txt|grep $i > temp.txt
if [ -s temp.txt ] 
then
	echo "IP Address Configured in Application" :$i >> Diff.txt;
else
	echo "Not Configured :"$i >> Diff.txt; 
fi
done;

