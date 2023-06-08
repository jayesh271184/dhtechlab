#!/bin/sh 
echo "----------------------------------------------------------------------"

echo "*********************AHD Circle Recon*********************************"
ssh root@10.164.7.2 sh /u01/scripts/cgf_recon.sh $1 $2 $3
ssh root@10.164.7.2 cat /u01/cgf_recon/CGF_CGNAT_Recon/Result.log 
echo "-----------------------------------------------------------------------"

echo "*********************LKO Circle Recon*********************************"
ssh root@10.164.7.8 sh /u01/scripts/cgf_recon.sh $1 $2 $3 
ssh root@10.164.7.8 cat /u01/cgf_recon/CGF_CGNAT_Recon/Result.log 
echo "-----------------------------------------------------------------------"

echo "*********************KOL Circle Recon*********************************"
ssh root@10.164.7.14 sh /u01/scripts/cgf_recon.sh $1 $2 $3 
ssh root@10.164.7.14 cat /u01/cgf_recon/CGF_CGNAT_Recon/Result.log 
echo "-----------------------------------------------------------------------"

echo "*********************CHN1 Circle Recon*********************************"
ssh root@10.164.7.20 sh /u01/scripts/cgf_recon.sh $1 $2 $3
ssh root@10.164.7.20 cat /u01/cgf_recon/CGF_CGNAT_Recon/Result.log 
echo "-----------------------------------------------------------------------"

echo "*********************CHN2 Circle Recon*********************************"
ssh root@10.164.7.26 sh /u01/scripts/cgf_recon.sh $1 $2 $3
ssh root@10.164.7.26 cat /u01/cgf_recon/CGF_CGNAT_Recon/Result.log
echo "-----------------------------------------------------------------------"

echo "*********************DEL circle Recon*********************************"
ssh root@10.164.7.32 sh /u01/scripts/cgf_recon.sh $1 $2 $3
ssh root@10.164.7.32 cat /u01/cgf_recon/CGF_CGNAT_Recon/Result.log
echo "-----------------------------------------------------------------------"


echo "*********************MUM-1 Circle Recon*********************************"
ssh root@10.164.7.38 sh /u01/scripts/cgf_recon.sh $1 $2 $3
ssh root@10.164.7.38 cat /u01/cgf_recon/CGF_CGNAT_Recon/Result.log
echo "-----------------------------------------------------------------------"

