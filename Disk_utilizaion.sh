echo -e ""
. /u01/scripts/color.cr
THRESHOLD=70
CC=`df -P|grep "/"|awk  '{print$6,"-->>",$5}'|sed 's/%//g'|wc -l`
#echo -e "\n"
echo -e "\t \t \t \t==============>>${SK} CH1-S2 ${N}<<==================="
for i in `seq 1 $CC`
do
TT=`df -P|grep "/"|awk  '{print$6,"-->>",$5}'|sed 's/%//g'|sed -n "${i}p"`

AL=`echo $TT|awk -F '-->>' '{print$2}'`
if [ "$AL" -le $THRESHOLD ];then
echo -ne "${G} ${TT}% ${N}|| "
else
echo -ne "${R}${BL} ${TT}%  ${N}|| "
fi

done
#echo -e "\n"
