#!/bin/sh
. /u01/scripts/color.cr

port () {
PORT=`ssh root@$1 nc -z ${1} ${3} | awk '{print $7}' | cut -d '!' -f1,1`
PORT21=`ssh root@$1 nc -z ${1} ${4} | awk '{print $7}' | cut -d '!' -f1,1`
echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT ];then
echo -ne "${SK}${3}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${3}${N} = ${R}${BL}Down${N} "
fi

if [ $PORT21 ];then
echo -e "${SK}${4}${N} = ${G}UP ${N} "
else
echo -e "${SK}${4}${N} = ${R}${BL}Down${N} "
fi

}
port1 () {
PORT1=`ssh root@$1 nc -z ${1} ${3} | awk '{print $7}' | cut -d '!' -f1,1`
PORT2=`ssh root@$1 nc -z ${1} ${4} | awk '{print $7}' | cut -d '!' -f1,1`
PORT3=`ssh root@$1 nc -z ${1} ${5} | awk '{print $7}' | cut -d '!' -f1,1`
PORT4=`ssh root@$1 nc -z ${1} ${6} | awk '{print $7}' | cut -d '!' -f1,1`

echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT1 ];then
echo -ne "${SK}${3}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${3}${N} = ${R}${BL}Down${N} "
fi

#echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT2 ];then
echo -ne "${SK}${4}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${4}${N} = ${R}${BL}Down${N} "
fi

#echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT3 ];then
echo -ne "${SK}${5}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${5}${N} = ${R}${BL}Down${N} "
fi

#echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT4 ];then
echo -e "${SK}${6}${N} = ${G}UP ${N} "
else
echo -e "${SK}${6}${N} = ${R}${BL}Down${N} "
fi
#echo -e "\n"
}
port2 () {
PORT5=`ssh root@$1 nc -z ${1} ${3} | awk '{print $7}' | cut -d '!' -f1,1`
PORT6=`ssh root@$1 nc -z ${1} ${4} | awk '{print $7}' | cut -d '!' -f1,1`
PORT7=`ssh root@$1 nc -z ${1} ${5} | awk '{print $7}' | cut -d '!' -f1,1`
PORT8=`ssh root@$1 nc -z ${1} ${6} | awk '{print $7}' | cut -d '!' -f1,1`
PORT9=`ssh root@$1 nc -z ${1} ${7} | awk '{print $7}' | cut -d '!' -f1,1`
PORT10=`ssh root@$1 nc -z ${1} ${8} | awk '{print $7}' | cut -d '!' -f1,1`

echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT5 ];then
echo -ne "${SK}${3}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${3}${N} = ${R}${BL}Down${N} "
fi

#echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT6 ];then
echo -ne "${SK}${4}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${4}${N} = ${R}${BL}Down${N} "
fi

#echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT7 ];then
echo -ne "${SK}${5}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${5}${N} = ${R}${BL}Down${N} "
fi

#echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT8 ];then
echo -ne "${SK}${6}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${6}${N} = ${R}${BL}Down${N} "
fi

#echo -ne "${SK}HOSTNAME ${N}= ${G}${2} ${N}==>> "
if [ $PORT9 ];then
echo -ne "${SK}${7}${N} = ${G}UP ${N} "
else
echo -ne "${SK}${7}${N} = ${R}${BL}Down${N} "
fi
#echo -e "\n"

if [ $PORT10 ];then
echo -e "${SK}${8}${N} = ${G}UP ${N} "
else
echo -e "${SK}${8}${N} = ${R}${BL}Down${N} "
fi

}

echo "-------------------------------S1----------------------------------------"
port 10.164.7.1 AHD-S1 4435 5535
port 10.164.7.7 LKO-S1 4435 5535
port 10.164.7.13 KOL-S1 4435 5535
port 10.164.7.19 CH1-S1 4435 5535
port 10.164.7.25 CH2-S1 4435 5535
port 10.164.7.31 DEL-S1 4435 5535
port 10.164.7.37 MUM1-S1 4435 5535
#port 10.164.7.37 MUM2-S1 4435 5535
echo "-------------------------------S2----------------------------------------"
port1 10.164.7.2 AHD-S2 4436 4437 4438 4439
port1 10.164.7.8 LKO-S2 4436 4437 4438 4439 
port1 10.164.7.14 KOL-S2 4436 4437 4438 4439 
port1 10.164.7.20 CH1-S2 4436 4437 4438 4439
port1 10.164.7.26 CH2-S2 4436 4437 4438 4439 
port1 10.164.7.32 DEL-S2 4436 4437 4438 4439 
port1 10.164.7.38 MUM1-S2 4436 4437 4438 4439
#port1 10.164.7.44 MUM2-S2 4436 4437 4438 4439
echo "--------------------------------S3--------------------------------------"
port2 10.164.7.3 AHD-S3 4435 5535 4436 4437 4438 4439
port2 10.164.7.9 LKO-S3 4435 5535 4436 4437 4438 4439 
port2 10.164.7.15 KOL-S3 4435 5535 4436 4437 4438 4439 
port2 10.164.7.21 CH1-S3 4435 5535 4436 4437 4438 4439
port2 10.164.7.27 CH2-S3 4435 5535 4436 4437 4438 4439 
port2 10.164.7.33 DEL-S3 4435 5535 4436 4437 4438 4439 
port2 10.164.7.39 MUM1-S3 4435 5535 4436 4437 4438 4439
#port2 10.164.7.45 MUM2-S3 4435 5535 4436 4437 4438 4439
