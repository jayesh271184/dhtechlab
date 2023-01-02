LogPath=/App-log/PARSING/STATS/PARSING_SERVICE/
ReconPath=/App-log/PARSING/Recon
Y=`date -d "-1 days" +"%Y"`;
M=`date -d "-1 days" +"%-m"`;
D=`date -d "-1 days" +"%-d"`;
DAY=`date -d "-1 days" +%Y%m%d`;

cd $LogPath/$Y/$M/$D/
rcount=`zcat $LogPath/$Y/$M/$D/* |cut -d',' -f6|cut -d":" -f2|sort -n|tail -1`;
eps=`zcat $LogPath/$Y/$M/$D/* |cut -d',' -f9|cut -d":" -f2|sort -n|tail -1`;
echo -e "Date,RecordCount,EPS" > ${ReconPath}/Recon_TataSkyJaipur_${DAY}.log
zcat *|cut -d ',' -f 7,6,9|sed 's/":/;/g'|sed 's/",/;/g'|sed 's/,"/;/g'|sed 's/;"/;/g'|awk -F';' '{print $4","$2","$6}' >> ${ReconPath}/Recon_TataSkyJaipur_${DAY}.log
echo -e "${DAY},${rcount},${eps}" >> ${ReconPath}/Recon_TataSkyJaipur_${DAY}.log



