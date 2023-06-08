SRC=/u01/jayesh/intellza/test
Direct=/u01/jayesh/intellza/Direct
Indirect=/u01/jayesh/intellza/Indirect
backup=/u01/jayesh/intellza/backup
nonipdr=/u01/jayesh/intellza/nonipdr


for i in $SRC/*.gz
do
   ipdrflag=`zcat $i|awk -F','  '{print NF; exit}'`
   if [ $ipdrflag -eq 24 ]
   then
      flag=`ls $i|grep "_" | wc -l`
      if [ $flag -eq 1 ]
         then
         mkdir $Direct/`ls $i|cut -d'_' -f6`_`ls $i|cut -d'_' -f7|cut -c'1-2'`
         cp $i $Direct/`ls $i|cut -d'_' -f6`_`ls $i|cut -d'_' -f7|cut -c'1-2'`
         mv $i $backup
      else

         timestamp1=`zcat $i |cut -d',' -f12|cut -d' ' -f1|sort|uniq`
         hh=`zcat $i |cut -d',' -f12|cut -c'12-13'|sort|uniq`
          for j in $timestamp1
          do
                dd=`echo $j|cut -d'/' -f1`
                mm=`echo $j|cut -d'/' -f2`
                yy=`echo $j|cut -d'/' -f3`
                  for k in $hh
                     do
                     mkdir -p $Indirect/${yy}${mm}${dd}${k}
                    #zcat $i|awk -F',' '$12 ~ /^'${j}' '${k}'/{print $0}'|gzip >>$Indirect/${yy}${mm}${dd}${k}/${yy}${mm}${dd}${k}.csv.gz
                     zcat $i|awk -F',' '{if($12 ~ /^'${dd}'\/'${mm}'\/'${yy}'\ '${k}':/) print $0}'|gzip >> $Indirect/${yy}${mm}${dd}${k}/${yy}${mm}${dd}${k}.csv.gz
                     done
          done
         mv $i $backup
     fi
   else
   mv $i $nonipdr
   fi
done
