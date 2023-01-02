P1=/u01/MEDIATION_ROOT/PROCESSING_ROOT/PGW/
DATE=`date +%Y%m%d`
P2=/u01/MEDIATION_ROOT/PROCESSING_ROOT/PGW/archived/
log=/applog/SCRIPT_LOGS/RECON/
prefix=`cat /applog/SCRIPT_LOGS/RECON/TOTAL_IDEA_CGF_PROCESSED_RECON_${DATE}.csv|cut -d',' -f2|cut -d'.' -f1`
echo fileprefix,Total,AP,ASM,BHR,IdeaDel,GJ,HAR,IdeaJK,KER,KOL,MH,NE,ORI,TN,UPE,UPW,WB,VODABIH,VODADEL,ZeroDuration > /tmp/finalrecon.csv
for prefixvar in `echo ${prefix}`
do

Total=`cat /applog/SCRIPT_LOGS/RECON/TOTAL_IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|cut -d',' -f4`
AP=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_AP.csv.gz|cut -d',' -f4`
ASM=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_ASM.csv.gz|cut -d',' -f4`
BHR=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_BHR.csv.gz|cut -d',' -f4`
IDEA_DEL=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_DEL.csv.gz|cut -d',' -f4`
GJ=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_GJ.csv.gz|cut -d',' -f4`
HAR=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_HAR.csv.gz|cut -d',' -f4`
IDEA_JK=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_JK.csv.gz|cut -d',' -f4`
KER=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_KER.csv.gz|cut -d',' -f4`
KOL=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_KOL.csv.gz|cut -d',' -f4`
MH=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_MH.csv.gz|cut -d',' -f4`
NE=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_NE.csv.gz|cut -d',' -f4`
ORI=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_ORI.csv.gz|cut -d',' -f4`
TN=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_TN.csv.gz|cut -d',' -f4`
UPE=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_UPE.csv.gz|cut -d',' -f4`
UPW=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_UPW.csv.gz|cut -d',' -f4`
WB=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.IDEA_WB.csv.gz|cut -d',' -f4`
VODABIH=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.VODA_BIH.csv.gz|cut -d',' -f4`
VODADEL=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.VODA_DEL.csv.gz|cut -d',' -f4`
ZeroDuration=`cat /applog/SCRIPT_LOGS/RECON/IDEA_CGF_PROCESSED_RECON_${DATE}.csv|grep ${prefixvar}|grep .dat.ZERO_DURATION_CDR.csv.gz|cut -d',' -f4`
echo $prefixvar,$Total,$AP,$ASM,$BHR,$IdeaDel,$GJ,$HAR,$IdeaJK,$KER,$KOL,$MH,$NE,$ORI,$TN,$UPE,$UPW,$WB,$VODABIH,$VODADEL,$ZeroDuration >> /tmp/finalrecon.csv

done