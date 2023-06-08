log=/u01/jayesh/intellza/log/
SRC=/u01/jayesh/intellza/test
Direct=/u01/jayesh/intellza/Direct
Indirect=/u01/jayesh/intellza/Indirect
backup=/u01/jayesh/intellza/backup
nonipdr=/u01/jayesh/intellza/nonipdr
echo -e "Script Started on : `date`"
echo -e "total file in input: `ls -l $SRC|wc -l`"



for i in $SRC/*.gz
do
   ipdrflag=`zcat $i|head -1|awk -F','  '{print NF; exit}'`
   if [ $ipdrflag -ge 24 ]
   then
      flag=`ls $i|grep "_" | wc -l`
      if [ $flag -eq 1 ]
         then
         mkdir $Direct/`ls $i|cut -d'_' -f6`_`ls $i|cut -d'_' -f7|cut -c'1-2'`
         cp $i $Direct/`ls $i|cut -d'_' -f6`_`ls $i|cut -d'_' -f7|cut -c'1-2'`
         mv $i $backup
      else

         timestamp1=`zcat $i|grep -Ev 'IMSI|general|decompression'|cut -d',' -f12|cut -d' ' -f1|sort|uniq`
         hh=`zcat $i|grep -Ev 'IMSI|general|decompression'|cut -d',' -f12|cut -c'12-13'|sort|uniq`
          for j in $timestamp1
          do
                filename=`echo $i|cut -d'/' -f6|cut -d'.' -f1`
                dd=`echo $j|cut -d'/' -f1`
                mm=`echo $j|cut -d'/' -f2`
                yy=`echo $j|cut -d'/' -f3`
                  for k in $hh
                     do
                     mkdir -p $Indirect/${yy}${mm}${dd}${k}
                     zcat $i|grep -Ev 'IMSI|general|decompression'|awk -F',' '{if($12 ~ /^'${dd}'\/'${mm}'\/'${yy}'\ '${k}':/) print $0}'|gzip >> $Indirect/${yy}${mm}${dd}${k}/${filename}_cgnat_OO_04_VIL_${yy}${mm}${dd}_${k}.csv.gz
                     done
          done
         mv $i $backup
     fi
   else
   mv $i $nonipdr
   fi
done

echo -e "Script Completed on `date` "
echo -e "Total Files in backup :`ls -l $backup|wc -l`"
echo -e "Total NonIPDR files:`ls -l $nonipdr|wc -l`"
