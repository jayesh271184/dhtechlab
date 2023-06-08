. /u01/scripts/color.cr
pro=`ps h -Lu crestel | wc -l`

if [ $pro -le 12000 ];then
echo -e "${SK} CH1-S2 ${N}:: ${SK}Number Of Processes ${N}-->${G} $pro${N}"
else
echo -e "${SK} CH1-S2 ${N}::${R}${BL} Number Of Processes ${2} exceeds threshold ${N}: $pro"
fi
