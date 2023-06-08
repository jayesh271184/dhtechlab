#!/bin/sh

. /u01/scripts/color.cr

echo -e "		${B}				============>>>>Error File Detail<<<<============				${N}"
ssh root@10.164.7.2  /u01/scripts/error_file.sh
ssh root@10.164.7.1  /u01/scripts/error_file.sh
ssh root@10.164.7.8  /u01/scripts/error_file.sh
ssh root@10.164.7.7  /u01/scripts/error_file.sh
ssh root@10.164.7.14  /u01/scripts/error_file.sh
ssh root@10.164.7.13  /u01/scripts/error_file.sh
ssh root@10.164.7.20  /u01/scripts/error_file.sh
ssh root@10.164.7.19  /u01/scripts/error_file.sh
ssh root@10.164.7.26  /u01/scripts/error_file.sh
ssh root@10.164.7.25  /u01/scripts/error_file.sh
ssh root@10.164.7.32  /u01/scripts/error_file.sh
ssh root@10.164.7.31  /u01/scripts/error_file.sh
ssh root@10.164.7.38  /u01/scripts/error_file.sh
ssh root@10.164.7.37  /u01/scripts/error_file.sh


