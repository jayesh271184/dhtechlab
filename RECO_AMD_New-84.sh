# RECON NEW Format #

#!/bin/bash
TODAY=`date -d 'now -1 days' '+%Y%m%d'`
echo "-------List of CDRs pushed to VF Mediation started--------"
cd /CGFBKUP1/Postpaid/GJ
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/GUJ_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/MH/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/MAH_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/MP/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/MPY_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/MUM/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/MUM_RECO_$TODAY.csv
done


cd /CGFBKUP1/Postpaid/RAJ/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/RAJ_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/PGW/GJ/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/GUJ_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/SGW/GJ/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/GUJ_INT_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/PGW/RAJ/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/RAJ_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/SGW/RAJ/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/RAJ_INT_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/PGW/MH/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/MAH_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/SGW/MH/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_NEW/MH_INT_RECO_$TODAY.csv
done

echo "NOW MOVING TO AND GENERATING ENT RECON"


###########################ENT RECON STARTS HERE##############################


TODAY=`date -d 'now -1 days' '+%Y%m%d'`
echo "-------List of CDRs pushed to VF Mediation started--------"
cd /CGFBKUP1/Postpaid/ENTAPN/GJ/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/GUJ_77RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/MUM/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/MUM_77RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/MP/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/MPY_77RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/RAJ/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/RAJ_77RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/MH/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/MAH_77RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/DEL/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/DEL/DEL_RECO_$TODAY.csv
done

###################### BAN / KN / KAR #######

cd /CGFBKUP1/Postpaid/ENTAPN/KN/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/BAN/AMD_BAN_RECO_$TODAY.csv
done

############################################/KER


cd /CGFBKUP1/Postpaid/ENTAPN/KE/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/KER/AMD_KER_RECO_$TODAY.csv
done


cd /CGFBKUP1/Postpaid/ENTAPN/JK/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/JK/JK_ENT_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/Kolkata/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/Kolkata_ENT_RECO_$TODAY.csv
done

############### CHN RECON ###################################

cd /CGFBKUP1/Postpaid/ENTAPN/CHE/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/CHE/AMD_CHE_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/PJB/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/PJB/PJB_RECO_$TODAY.csv
done


cd /CGFBKUP1/Postpaid/ENTAPN/HAR/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/HAR/HAR_RECO_$TODAY.csv
done


cd /CGFBKUP1/Postpaid/ENTAPN/HPC/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/HPC/HPC_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/AP/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/AP/AMD_HYD_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/TN/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/TNU/AMD_TNU_RECO_$TODAY.csv
done

cd /CGFBKUP1/Postpaid/ENTAPN/UPE/
for file in `ls -1 GP*$TODAY*.DATA.prc | awk '{ print $TODAY}'`
do
count=`cat $file |wc -l`
size=`ls -l $file |awk -F ' ' '{print$5}'`
output=`echo $file","$count","$size`
echo $output >> /opt/crestelsetup/RECO_ENT/UPE/UPE_ENT_RECO_$TODAY.csv
done


#### MERGING GUJ NATIOVE TRAFFIC WITH ENT RECON FROM 77#######
cat /opt/crestelsetup/RECO_ENT/GUJ_77RECO_$TODAY.csv >> /opt/crestelsetup/RECO_NEW/GUJ_RECO_$TODAY.csv
cat /opt/crestelsetup/RECO_ENT/MAH_77RECO_$TODAY.csv >> /opt/crestelsetup/RECO_NEW/MAH_RECO_$TODAY.csv
cat /opt/crestelsetup/RECO_ENT/MPY_77RECO_$TODAY.csv >> /opt/crestelsetup/RECO_NEW/MPY_RECO_$TODAY.csv
cat /opt/crestelsetup/RECO_ENT/MUM_77RECO_$TODAY.csv >> /opt/crestelsetup/RECO_NEW/MUM_RECO_$TODAY.csv
cat /opt/crestelsetup/RECO_ENT/RAJ_77RECO_$TODAY.csv >> /opt/crestelsetup/RECO_NEW/RAJ_RECO_$TODAY.csv

#### Copying of ENT RECON TO FTP FOLDER FOR UPLOADING TO MEDIATION

#cp -rvp /opt/crestelsetup/RECO_ENT/*ENT*.csv /opt/crestelsetup/RECO_NEW/
i#cp -rvp /opt/crestelsetup/RECO_ENT/JK_ENT_RECO_$TODAY.csv /opt/crestelsetup/RECO_NEW/
#cp -rvp /opt/crestelsetup/RECO_ENT/KE_ENT_RECO_$TODAY.csv /opt/crestelsetup/RECO_NEW/
#cp -rvp /opt/crestelsetup/RECO_ENT/KAN_ENT_RECO_$TODAY.csv /opt/crestelsetup/RECO_NEW/
cp -rvp /opt/crestelsetup/RECO_ENT/Kolkata_ENT_RECO_$TODAY.csv /opt/crestelsetup/RECO_NEW/