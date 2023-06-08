#!/bin/sh
. /u01/scripts/color.cr
echo " "
echo -e " ${SK} =====================================================================================================================  ${SK}"
echo -e " ${R}    =========>>>>> Warning  :- Do Not Run this command Frequenty as this would Hamper the system. <<<<<========= ${N} "
echo -e " ${SK} =====================================================================================================================  ${SK}"
echo " "
echo -e "		${B}				============>>>>Nat Data File Path<<<<============				${N}"
ssh root@10.164.7.1  sh /u01/scripts/file_count.sh
ssh root@10.164.7.7  sh /u01/scripts/file_count.sh
ssh root@10.164.7.13 sh /u01/scripts/file_count.sh
ssh root@10.164.7.19 sh /u01/scripts/file_count.sh
ssh root@10.164.7.25 sh /u01/scripts/file_count.sh
ssh root@10.164.7.31 sh /u01/scripts/file_count.sh
ssh root@10.164.7.37 sh /u01/scripts/file_count.sh
echo -e "		${B}				============>>>>Usage Data File Path<<<<============				${N}"
ssh root@10.164.7.2  sh /u01/scripts/file_count.sh
ssh root@10.164.7.8  sh /u01/scripts/file_count.sh
ssh root@10.164.7.14 sh /u01/scripts/file_count.sh
ssh root@10.164.7.20 sh /u01/scripts/file_count.sh
ssh root@10.164.7.26 sh /u01/scripts/file_count.sh
ssh root@10.164.7.32 sh /u01/scripts/file_count.sh
ssh root@10.164.7.38 sh /u01/scripts/file_count.sh
echo -e "		${B}				============>>>>Legal Data File Path<<<<============				${N}"
ssh root@10.164.7.2  sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.8  sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.14 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.20 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.26 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.32 sh /u01/scripts/file_count_legal.sh
ssh root@10.164.7.38 sh /u01/scripts/file_count_legal.sh
sh /u01/master/master_error_count.sh

