#!/bin/sh
. /u01/scripts/color.cr
echo " "
echo -e " ${SK} =====================================================================================================================  ${SK}"
echo -e " ${R}    =========>>>>> Warning  :- Do Not Run this command Frequenty as this would Hamper the system. <<<<<========= ${N} "
echo -e " ${SK} =====================================================================================================================  ${SK}"
echo " "
echo -e "		${B}				============>>>>Nat Data File Path<<<<============				${N}"
ssh root@10.164.7.3  sh /u01/scripts/file_count.sh
ssh root@10.164.7.9  sh /u01/scripts/file_count.sh
ssh root@10.164.7.15 sh /u01/scripts/file_count.sh
ssh root@10.164.7.21 sh /u01/scripts/file_count.sh
ssh root@10.164.7.27 sh /u01/scripts/file_count.sh
ssh root@10.164.7.33 sh /u01/scripts/file_count.sh
ssh root@10.164.7.39 sh /u01/scripts/file_count.sh
echo -e "   	        ${B}				============>>>>Usage Data File Path<<<<============				${N}"
ssh root@10.164.7.3  sh /u01/scripts/file_count_usage.sh
ssh root@10.164.7.9   sh /u01/scripts/file_count_usage.sh
ssh root@10.164.7.15 sh /u01/scripts/file_count_usage.sh
ssh root@10.164.7.21 sh /u01/scripts/file_count_usage.sh
ssh root@10.164.7.27 sh /u01/scripts/file_count_usage.sh
ssh root@10.164.7.33 sh /u01/scripts/file_count_usage.sh
ssh root@10.164.7.39 sh /u01/scripts/file_count.sh
echo -e "		${B}				============>>>>Legal Data File Path<<<<============				${N}"
ssh root@10.164.7.3  sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.9  sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.15 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.21 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.27 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.33 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.39 sh /u01/scripts/file_count_legal.sh
#sh /u01/master/master_error_count.sh

