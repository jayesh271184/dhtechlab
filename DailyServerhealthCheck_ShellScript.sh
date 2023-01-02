R='\033[31m'
G='\033[32m'
Y='\033[33m'
B='\033[34m'
BA='\033[35m'
SK='\033[36m'
GR='\033[37m'
N='\033[0m'
BL='\033[5m'
echo -e "==========>>${SK} Server HealthCheck Output for  : `hostname` ${N}<<==================="

FREE=`free -g  | sed -n '3,3p' | awk ' { print $4 } '`
USED=`free -g  | sed -n '3,3p' | awk ' { print $3 } '`

echo "           "
echo "           "
echo "           "
echo -e "${BL} Server MEMORY STATUS  : `hostname` ${N}"

if [ $FREE -le 50 ];then
echo -e "${SK} `hostname`  ${N}::${R}${BL} Total Memory ${2} exceeds threshold ${N}: $FREE"
else
echo -e "${SK} `hostname`  ${N}:: ${SK}Total Memory ${N}-->${G} $FREE${N} :: ${SK}Used Memory ${N}-->${G} $USED${N}"
fi
echo "           "
echo "           "
echo "           "
echo -e "${BL} Server LOAD AVG Output for  : `hostname` ${N}"
THRESOLD=70
LOAD=`uptime`
TEST=`uptime |awk -F ',' '{print$5}'|awk -F '.' '{print$1}'`

if [ "$TEST" -gt "$THRESOLD" ] ;then
echo -e "${SK} `hostname` ${N}::${R}${BL}Load Avg. of ${2} exceeds threshold ${N}: $TEST "
else
echo -e "${SK} `hostname` ${N}:: ${GR}${2}${N} -->${G} $LOAD${N} "
fi
echo "           "
echo "           "
echo "           "
echo -e "${BL} Server PROCESS STATUS  for  : `hostname` ${N}"
pro=`ps h -Lu root | wc -l`

if [ $pro -le 12000 ];then
echo -e "${SK} `hostname` ${N}:: ${SK}Number Of Processes ${N}-->${G} $pro${N}"
else
echo -e "${SK} `hostname` ${N}::${R}${BL} Number Of Processes ${2} exceeds threshold ${N}: $pro"
fi

echo "           "
echo "           "
echo "           "
echo -e "${BL} Server DiskStatus Output for  : `hostname` ${N}"
THRESHOLD=70
CC=`df -P|grep "/"|awk  '{print$6,"->",$5}'|sed 's/%//g'|wc -l`
for i in `seq 1 $CC`
do
TT=`df -P|grep "/"|awk  '{print$6,"->",$5}'|sed 's/%//g'|sed -n "${i}p"`

AL=`echo $TT|awk -F '->' '{print$2}'`
if [ "$AL" -le $THRESHOLD ];then
echo -ne "${G} ${TT}% ${N}|| "
else
echo -ne "${R}${BL} ${TT}%  ${N}|| "
fi

done
echo "           "