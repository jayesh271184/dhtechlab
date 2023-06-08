. /u01/scripts/color.cr
pro=`lsof | wc -l `

if [ $pro -le 400000 ];then
echo -e "${SK} CH1-S2 ${N}:: ${SK}Number Of FileDescriptor ${N}-->${G} $pro${N}"
else
echo -e "${SK} CH1-S2 ${N}::${R}${BL} Number Of Descriptor ${2} exceeds threshold ${N}: $pro"
fi
