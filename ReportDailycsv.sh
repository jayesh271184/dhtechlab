HCLog=/opt1/IPLMS/HC;
DisLog=/opt1/IPLMS/DIS_EPS;
ParLog=/opt1/IPLMS/EPS;
ReportPath=/tmp
DAY=`date -d "-1 days" +%Y%m%d`;
echo -e "*********************************************************************">${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "************* TataSky STL Daily Status Report ***********************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "              Created By  : Chintan Makwana/Avaneesh T               ">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "	      Report Date : ${DAY}                                   ">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "              Project M   : Uday Patil                               ">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "**************************Daily EPS**********************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log

echo -e "Circle,Date,Total RecordCount,Peak EPS">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
for i in {MUM,CHE,KOL,PUNE,DEL,JAI}
do
k=`find $ParLog/${i}/ -type f -iname "**${DAY}*.log" -exec cat {} \;|grep ${DAY}`
echo -e "${i},${k}">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
done
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*******************RECON STATS FOR NAT RECORD************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "Circle,Date,File Count,Total Record Count,Size(GB),EPS">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
for i in {MUM,CHE,KOL,PUNE,DEL,JAI}
do
k=`find $DisLog/${i}/ -type f -iname "**${DAY}*" -exec cat {} \;|tail -1|cut -d',' -f 2,3,4,5,6,7`
echo -e "${i},${k}">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
done

echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************** Disk Stats **********************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "date,hostname,Server IP,/,/App-log,/u01,/boot,/opt,/dev/shm,/var,/home">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
for i in {MUM,CHE,KOL,PUNE,DEL,JAI}
do
k=`find $HCLog/${i}/ -type f -iname "**${DAY}*" -exec cat {} \;|grep systemdisk|grep ${DAY}|tail -1|cut -d',' -f2,3,4,5,6,7,8,9,10,11`
echo -e "${k}">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
done


echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************** Memory Stats ********************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "date,hostname,serverIP,total Memory,Total Free memory, total used memory">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
for i in {MUM,CHE,KOL,PUNE,DEL,JAI}
do
k=`find $HCLog/${i}/ -type f -iname "**${DAY}*" -exec cat {} \;|grep systemmemory|grep ${DAY}|tail -6|head -1|cut -d',' -f2,3,5,6,7,8`
echo -e "${k}">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
done


echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************** CPU Stats ***********************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "*********************************************************************">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
echo -e "Date,HostName,ServerIP,Load Avg1 ,Load Avg2,Load Avg3">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
for i in {MUM,CHE,KOL,PUNE,DEL,JAI}
do
k=`find $HCLog/${i}/ -type f -iname "**${DAY}*" -exec cat {} \;|grep systemload|grep ${DAY}|tail -6|head -1|cut -d',' -f2,3,4,5,6,7`
echo -e "${k}">>${ReportPath}/Report_${DAY}_TataSkyBB.Log
done
