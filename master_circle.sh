echo "======================AHD-CGF=================================="
ssh root@10.164.7.2 sh /u01/scripts/report_script/circle_usa_recon.sh $1 $2 $3 $4
echo "======================LKO-CGF=================================="
ssh root@10.164.7.8 sh /u01/scripts/report_script/circle_usa_recon.sh $1 $2 $3 $4
echo "======================KOL-CGF=================================="
ssh root@10.164.7.14 sh /u01/scripts/report_script/circle_usa_recon.sh $1 $2 $3 $4
echo "======================CHN1-CGF=================================="
ssh root@10.164.7.20 sh /u01/scripts/report_script/circle_usa_recon.sh $1 $2 $3 $4
echo "======================CHN2-CGF=================================="
ssh root@10.164.7.26 sh /u01/scripts/report_script/circle_usa_recon.sh $1 $2 $3 $4
echo "======================DEL-CGF=================================="
ssh root@10.164.7.32 sh /u01/scripts/report_script/circle_usa_recon.sh $1 $2 $3 $4
echo "======================MUM1-CGF=================================="
ssh root@10.164.7.38 sh /u01/scripts/report_script/circle_usa_recon.sh $1 $2 $3 $4
