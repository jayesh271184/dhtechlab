#!/bin/sh
#check Mediation Services Running or not.
. /u01/scripts/color.cr
DD1=`date '+%Y%m%d'`
ipnat=`ps -ef | grep 4436 | grep "usa" | wc -l`

if [ "$ipnat" = 0 ] ;then 
echo -e "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}IPLOG_PARSING_USAGE_Service ${N} =${BL}${R} Not Running ${N}"
else
echo -ne "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}IPLOG_PARSING_USAGE_Service ${N} =${G}  Running${BL}... ${N}\n"
fi

dis=`ps -ef | grep 4437 | grep "dis" | wc -l`

if [ "$dis" = 0 ] ;then
echo -e "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}DISTRIBUTION_Service ${N} =${BL}${R} Not Running ${N}"
else
echo -ne "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}DISTRIBUTION_Service ${N} =${G}  Running${BL}... ${N}\n"
fi

sft=`ps -ef | grep 4438 | grep "sftp" | wc -l`

if [ "$sft" = 0 ] ;then
echo -e "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}SFTP_Service ${N} =${BL}${R} Not Running ${N}"
else
echo -ne "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}SFTP_Service ${N} =${G}  Running${BL}... ${N}\n"
fi

ser=`ps -ef | grep 4439 | grep "module" | wc -l`

if [ "$ser" = 0 ] ;then
echo -ne "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}SEARCH_Service ${N} =${BL}${R} Not Running ${N}\n"
else
echo -e "${SK}HOSTNAME --> CH1-S2 ${N}::${SK}SEARCH_Service ${N} =${G}Running${BL}... ${N}"
fi
