ReportPath=/opt1/IPLMS/Final_EPS_Report
DAY=`date -d "-1 days" +%Y%m%d`;
echo -e "Dear Team,\nPlease find the IPLMS status Report\n\nRegards,\nTeam STL" | mailx -s "TSBB IPLMS Report" sterliteusers@tataskybb.com -c jayesh.shah@stl.tech -a /opt1/IPLMS/Final_EPS_Report/Report_${DAY}_TataSkyBB.html
