. /u01/scripts/color.cr
FREE=`free -g  | sed -n '3,3p' | awk ' { print $4 } '`
USED=`free -g  | sed -n '3,3p' | awk ' { print $3 } '`

if [ $FREE -le 50 ];then
echo -e "${SK} CH1-S2  ${N}::${R}${BL} Total Memory ${2} exceeds threshold ${N}: $FREE"
else
echo -e "${SK} CH1-S2  ${N}:: ${SK}Free Memory ${N}-->${G} $FREE${N} :: ${SK}Used Memory ${N}-->${G} $USED${N}"
fi

