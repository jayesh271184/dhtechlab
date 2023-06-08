echo -e ""
. /u01/scripts/color.cr
THRESHOLD=70
CC=`df -P|grep "/"|awk  '{print$6,"-->>",$5}'|head -8 | sed 's/%//g'|wc -l`
echo -e "\t \t \t \t==============>>${SK} CHN1-S2 ${N}<<==================="
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

TL=`cat /opt/crestelsetup/crestelpengine/modules/mediation/config/4436/services/iplogparsingservice/001/iplog-parsing-service.xml | grep destination | awk -F ">" '{print $2}' | awk -F "<" '{print $1}' | awk -F "/" '{print $2}'`
CD=`df -P | grep "$TL" | awk  '{print$6,"-->>",$5}' | sed 's/%//g'`
AG=`echo "$CD" | awk -F '-->>' '{print$2}'`
if [ "$AG" -le $THRESHOLD ];then
echo -ne "${G} ${CD}% ${N}|| "
else
echo -ne "${R}${BL} ${CD}%  ${N}|| "
fi


#echo -e "\n"
