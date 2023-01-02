HCLog=/opt1/IPLMS/HC;
DisLog=/opt1/IPLMS/DIS_EPS;
ParLog=/opt1/IPLMS/EPS;
ReportPath=/opt1/IPLMS/Final_EPS_Report
DAY=`date -d "-1 days" +%Y%m%d`;
DAY1=`date -d "-1 days" +%d/%m/%Y`
#DAY=20210524
MUM1=32000
MUM2=32000
CHE1=8000
CHE2=8000
KOL1=12000
KOL2=12000
PUN1=36000
PUN2=36000
DEL1=26000
DEL2=26000
JAI1=28000
JAI2=28000
bodybg=LightPink
headfont=red
tablebg=lightgreen
h4color=Brown

echo -e "<html><head><center>">${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<h2><p style="color:${headfont}">***** TataSky IPLMS Daily Status Report ********</p></h2>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "</head> <body style="background-color:${bodybg}">" >>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<h3>            Owner  : Sterlite Tech  Ltd.               </h3>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<h4>            Report Date : ${DAY}                                    </h4>">>${ReportPath}/Report_${DAY}_TataSkyBB.html

#################################Upstream EPS Calculation#############################################################
echo -e "<h4> <p style="color:${h4color}"> **************************Daily EPS : Total Collected Packets from Upstream ********************************** </p> </h4>">>${ReportPath}/Report_${DAY}_TataSkyBB.html

echo -e "<table><style>table,th,td {border: 1px solid black;}</style><tr style="background-color:${tablebg}"><td>Circle</td><td>Date</td><td>Total RecordCount</td><td>Peak EPS</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
for i in {MUM1,MUM2,CHE1,CHE2,KOL1,KOL2,PUN1,PUN2,DEL1,DEL2,JAI1,JAI2}
do
k=`find ${ParLog}/${i}/ -type f -iname "*${DAY}*" -exec cat {} \;|grep ${DAY}|awk -F',' '{print $1,"</td><td>",$2,"</td><td>",$3}'`
echo -e "<tr style="background-color:${tablebg}"><td>${i}</td><td>${k}</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
done
echo -e "</table>">>${ReportPath}/Report_${DAY}_TataSkyBB.html


############################################EPS Hourly Count#####################################################

echo -e "<h4><p style="color:${h4color}">********************** Hourly EPS of All the location*********************************</p></h4>">>${ReportPath}/Report_${DAY}_TataSkyBB.html

########################Common Table##############################

echo "<table><style>table,th,td {border: 1px solid black;}</style>">>${ReportPath}/Report_${DAY}_TataSkyBB.html ;
cd /opt1/IPLMS/EPS/
paste -d ',' MUM1/*${DAY}* MUM2/*${DAY}* CHE1/*${DAY}* CHE2/*${DAY}* KOL1/*${DAY}* KOL2/*${DAY}* PUN1/*${DAY}* PUN2/*${DAY}* DEL1/*${DAY}* DEL2/*${DAY}* JAI1/*${DAY}* JAI2/*${DAY}*|cut -d',' -f 1,3,6,9,12,15,18,21,24,27,30,33,36 > JOINTEPS.csv
for i in {00..23}; do echo ${DAY1} $i; done > date.csv
cat JOINTEPS.csv |grep ${DAY1} |cut -d',' -f 2,3,4,5,6,7,8,9,10,11,12,13 > EPStable.csv
paste -d , date.csv EPStable.csv > FinalTable.csv
sed -i '1s/^/Procured License ,32000,32000,8000,8000,12000,12000,36000,36000,26000,26000,28000,28000\n/g' FinalTable.csv
sed -i '1s/^/Date,MUM1,MUM2,CHE1,CHE2,KOL1,KOL2,PUN1,PUN2,DEL1,DEL2,JAI1,JAI2\n/g' FinalTable.csv
    while read INPUT ; do
            echo "<tr style="background-color:${tablebg}"><td>${INPUT//,/</td><td>}</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html ;
    done < FinalTable.csv ;
    echo "</table>">>${ReportPath}/Report_${DAY}_TataSkyBB.html


########################################Memory Calculation#######################################################

echo -e "<h4> <p style="color:${h4color}">********************** Memory Stats *******************************</p></h4>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<table><style>table,th,td {border: 1px solid black;}</style><tr style="background-color:${tablebg}"><td>date</td><td>hostname</td><td>serverIP</td><td>total Memory</td><td>Total Free memory</td><td> total used memory</td><td>TotalInCache</td><td>TotalSwap</td><td>TotalFreeSwap</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
for i in {MUM1,MUM2,CHE1,CHE2,KOL1,KOL2,PUN1,PUN2,DEL1,DEL2,JAI1,JAI2}
do
k=`find ${HCLog}/${i}/ -type f -iname "*${DAY}*" -exec cat {} \;|grep systemmemory|grep ${DAY}|tail -6|head -1|awk -F',' '{print $2,"</td><td>",$3,"</td><td>",$5,"</td><td>",$6,"</td><td>",$7,"</td><td>",$8,"</td><td>",$9,"</td><td>",$10,"</td><td>",$11}'`
echo -e "<tr style="background-color:${tablebg}"><td>${k}</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
done
echo -e "</table>">>${ReportPath}/Report_${DAY}_TataSkyBB.html

#################################CPU Calculation#############################################
echo -e "<h4> <p style="color:${h4color}">********************** CPU Stats **********************************</p></h4>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<table><style>table,th,td {border: 1px solid black;}</style>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<tr style="background-color:${tablebg}"><td>Date</td><td>HostName</td><td>ServerIP</td><td>Load Avg1 </td><td>Load Avg2</td><td>Load Avg3</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
for i in {MUM1,MUM2,CHE1,CHE2,KOL1,KOL2,PUN1,PUN2,DEL1,DEL2,JAI1,JAI2}
do
k=`find ${HCLog}/${i}/ -type f -iname "*${DAY}*" -exec cat {} \;|grep systemload|grep ${DAY}|tail -6|head -1|awk -F',' '{print $2,"</td><td>",$3,"</td><td>",$4,"</td><td>",$5,"</td><td>",$6,"</td><td>",$7}'`
echo -e "<tr style="background-color:${tablebg}"><td>${k}</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
done
echo -e "</table></html>">>${ReportPath}/Report_${DAY}_TataSkyBB.html


#############################################DISK Calculation###############################
echo -e "<h4><p style="color:${h4color}">********************** Disk Stats *********************************</p></h4>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<table><style>table,th,td {border: 1px solid black;}</style>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<tr style="background-color:${tablebg}"><td>date</td><td>hostname</td><td>Server IP</td><td>/</td><td>/App-log</td><td>/u01</td><td>/boot</td><td>/opt</td><td>/dev/shm</td><td>/var</td><td>/home</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
for i in {MUM1,MUM2,CHE1,CHE2,KOL1,KOL2,PUN1,PUN2,DEL1,DEL2,JAI1,JAI2}
do
k=`find ${HCLog}/${i}/ -type f -iname "*${DAY}*" -exec cat {} \;|grep systemdisk|grep ${DAY}|tail -1|awk -F',' '{print $2,"</td><td>",$3,"</td><td>",$4,"</td><td>",$5,"</td><td>",$6,"</td><td>",$7,"</td><td>",$8,"</td><td>",$9,"</td><td>",$10,"</td><td>",$11,"</td><td>",$12}'`
echo -e "<tr style="background-color:${tablebg}"><td>${k}</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
done
echo -e "</table>">>${ReportPath}/Report_${DAY}_TataSkyBB.html


#######################################Downstream EPS Calculation############################################
echo -e "</table>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<h4> <p style="color:${h4color}"> ******************RECON STATS :  Valid Processed Downstream Records*********************** </p> </h4>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<table><style>table,th,td {border: 1px solid black;}</style>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<tr style="background-color:${tablebg}"><td>Circle</td><td>Date</td><td>File Count</td><td>Total Record Count</td><td>Size(GB)</td><td>EPS</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
for i in {MUM1,MUM2,CHE1,CHE2,KOL1,KOL2,PUN1,PUN2,DEL1,DEL2,JAI1,JAI2}
do
k=`find ${DisLog}/${i}/ -type f -iname "*${DAY}*" -exec cat {} \;|tail -1|awk -F',' '{print $2,"</td><td>",$3,"</td><td>",$4,"</td><td>",$5,"</td><td>",$6}'`
echo -e "<tr style="background-color:${tablebg}"><td>${i}</td><td>${k}</td></tr>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
done
echo -e "</table>">>${ReportPath}/Report_${DAY}_TataSkyBB.html



echo -e "<h3><p style="color:${h4color}">********************** Thank You : STL Tech *********************************</p></h3>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<h3>           Created By  : Chintan Makwana/Jayesh Shah               </h3>">>${ReportPath}/Report_${DAY}_TataSkyBB.html
echo -e "<h3>           Project M   : Uday Patil                               </h3></center">>${ReportPath}/Report_${DAY}_TataSkyBB.html





