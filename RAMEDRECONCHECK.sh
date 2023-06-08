DPATH=/CGFBKUPEXT3/E2ERECON/CHECKFILES
SPATH=/CGFBKUPEXT3/E2ERECON/
TODAY=`date -d 'now -0 days' '+%Y%m%d'`
YDAY=`date -d 'now -1 days' '+%Y%m%d'`
a=`date -d 'now -0 days' '+%Y'`
b=`date -d 'now -0 days' '+%m'`
c=`date -d 'now -0 days' '+%d'`
HH=`date -d 'now -2 Hour' '+%H'`

echo -e "<--table InterfaceStats starts-->" >$SPATH/OUTPUT-RECON.txt
echo "Hour,RA-GGSN,MED-GGSN,RA-PGW,MED-PGW,RA-SGW,MED-SGW,TOTAL-RA,TOTAL-MED,DIIF-RA-MED">>$SPATH/OUTPUT-RECON.txt
#for (( i=00; i<=$HH; i++))
for i in {00..23}
do
if [ $HH == $i ]
then
echo -e "<--table InterfaceStats ends-->" >>$SPATH/OUTPUT-RECON.txt
exit 0
fi
HRAPGW=`cat /CGFBKUPEXT3/E2ERECON/R*RA*${a}${b}${c}*.log | grep PGW | awk -F ',' '{print$2}' | grep ${a}${b}${c}$i | sort | uniq | wc -l`
HRAGGSN=`cat /CGFBKUPEXT3/E2ERECON/R*RA*${a}${b}${c}*.log | grep -v "PGW" | grep -v "SGW" | awk -F ',' '{print$2}' | grep ${a}${b}${c}$i | sort | uniq | wc -l`
HRASGW=`cat /CGFBKUPEXT3/E2ERECON/R*RA*${a}${b}${c}*.log | grep SGW  | awk -F ',' '{print$2}' | grep ${a}${b}${c}$i |  sort | uniq |  wc -l`

HMEDPGW=`cat /CGFBKUPEXT3/E2ERECON/D69*MED*${a}${b}${c}*.log /CGFBKUPEXT3/E2ERECON/D75*MED*${a}${b}${c}*.log | grep -v "I" |  awk -F ',' '{print$2}' |  grep ${a}${b}${c}$i | sort | uniq | wc -l`
HMEDGGSN=`cat /CGFBKUPEXT3/E2ERECON/D8*MED*${a}${b}${c}*.log /CGFBKUPEXT3/E2ERECON/D77*MED*${a}${b}${c}*.log /CGFBKUPEXT3/E2ERECON/D71*MED*${a}${b}${c}*.log /CGFBKUPEXT3/E2ERECON/D77*MED*${a}${b}${c}*.log |  awk -F ',' '{print$2}'| grep ${a}${b}${c}$i | sort | uniq | wc -l`
HMEDSGW=`cat /CGFBKUPEXT3/E2ERECON/D69*MED*${a}${b}${c}*.log /CGFBKUPEXT3/E2ERECON/D75*MED*${a}${b}${c}*.log | grep "I"  |   awk -F ',' '{print$2}' | grep ${a}${b}${c}$i | sort | uniq |  wc -l`

HRA=`expr $HRAPGW + $HRAGGSN + $HRASGW`
HMED=`expr $HMEDPGW + $HMEDGGSN + $HMEDSGW`
DIFFRAMED=`expr $HRA - $HMED`
echo "$i,$HRAGGSN,$HMEDGGSN,$HRAPGW,$HMEDPGW,$HRASGW,$HMEDSGW,$HRA,$HMED,$DIFFRAMED">>$SPATH/OUTPUT-RECON.txt
TOTALHRAPGW=`expr $TOTALHRAPGW + $HRAPGW`
TOTALHRASGW=`expr $TOTALHRASGW + $HRASGW`
TOTALHRAGGSN=`expr $TOTALHRAGGSN + $HRAGGSN`

TOTALHMEDPGW=`expr $TOTALHMEDPGW + $HMEDPGW`
TOTALHMEDSGW=`expr $TOTALHMEDSGW + $HMEDSGW`
TOTALHMEDGGSN=`expr $TOTALHMEDGGSN + $HMEDGGSN`
TOTALRA=`expr $TOTALRA + $HRA`
TOTALMED=`expr $TOTALMED + $HMED`
TOTALDIIFEAMED=`expr $TOTALDIIFEAMED + $DIFFRAMED`
done

echo "TOTAL,$TOTALHRAGGSN,$TOTALHMEDGGSN,$TOTALHRAPGW,$TOTALHMEDPGW,$TOTALHRASGW,$TOTALHMEDSGW,$TOTALRA,$TOTALMED,$TOTALDIIFEAMED">>$SPATH/OUTPUT-RECON.txt
echo -e "<--table InterfaceStats ends-->" >>$SPATH/OUTPUT-RECON.txt

