#! /bin/bash
echo "Script Started for manage Engine send notification"
if [ -n "$1" ] && [ -n "$2"  ] 
then
msg=$1
IFS=',' read -ra ADDR <<< "$2"
for i in "${ADDR[@]}"; do
	url="http://10.197.20.4:13013/cgi-bin/sendsms?username=elite&password=elite&to="$i"&from=E-CG-IDEA&text="$msg""
	tmp=`echo $url |tr " " "+"`	
	res=`curl -s $tmp`
	echo $res
done
else
	echo "Mobile number or message is missing"	
fi
