>/u01/scripts/po_sftp_del.log
>/u01/scripts/pr_sftp_del.log

find /LVBACKLOGDATA/CHN1_MED_DATA/archieved/postpaid/ -type f -mtime +7 -exec rm -v {} \; >> /u01/scripts/po_sftp_del.log
find /LVBACKLOGDATA/CHN1_MED_DATA/archieved/prepaid/ -type f -mtime +7 -exec rm -v {} \; >> /u01/scripts/pr_sftp_del.log
