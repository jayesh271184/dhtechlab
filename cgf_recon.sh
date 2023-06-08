#!/bin/sh

##################-----CGF reconsillation script-----#######################

ADIR=/u01/cgf_recon/
BDIR=/u01/scripts/usaflow_collector_logs/
LOGDIR=/u01/cgf_recon/CGF_CGNAT_Recon/
DIFF_FILE=/u01/cgf_recon/diff_file/
a=`ls -ltr $ADIR  | egrep "CH2_CH1_CGNAT_Postpaid_Recon_Filelist_$3$2$1|CH2_CH1_CGNAT_Prepaid_Recon_Filelist_$3$2$1|CH1_CGNAT_Postpaid_Recon_Filelist_$3$2$1|CH1_CGNAT_Prepaid_Recon_Filelist_$3$2$1" | awk '{print $9}'`
printf '%s\n' $a > $LOGDIR/CGF_files
for i in `cat $LOGDIR/CGF_files | grep ^CH1_CGNAT ` ; do cat $ADIR/$i |  awk '{print $9}' | sed 's/.prc$//' ;done > $LOGDIR/file_log_cgf.log
for j in `cat $LOGDIR/CGF_files | grep ^CH2_CH1` ; do cat $ADIR/$j |  awk -F "/" '{print $2}' | sed 's/.prc$//' ;done >> $LOGDIR/file_log_cgf.log
b=`ls $BDIR/ | grep "CH1_usalog_input_$3$2$1.log"`
cat $BDIR/$b | awk -F "," '{print $3}' > $LOGDIR/file_log_cgnat.log
sort $LOGDIR/file_log_cgf.log > $LOGDIR/sort_cgf
sort $LOGDIR/file_log_cgnat.log > $LOGDIR/sort_cgnat
Count1=`cat $LOGDIR/sort_cgf | wc -l`
Count2=`cat $LOGDIR/sort_cgnat | wc -l`
diff --normal $LOGDIR/sort_cgf $LOGDIR/sort_cgnat > /dev/null
 
if [[ $Count1 -eq $Count2 && $? -eq 0  ]] ; then 
          echo "Counts are same at both side" > $LOGDIR/Result.log
 else 

     echo "Files Missing at CGF==>" > $LOGDIR/Result.log
diff1=`diff $LOGDIR/sort_cgf $LOGDIR/sort_cgnat | grep "^>" | wc -l`

if [[ "$diff1" -le 0 ]] ; then 
      echo "-----There is no difference-----" >> $LOGDIR/Result.log
            
elif [[ "$diff1" -ge 20 ]] ; then
diff $LOGDIR/sort_cgf $LOGDIR/sort_cgnat | grep "^>" | awk '{print $2}' > $DIFF_FILE/cgf_diff_$3$2$1.log
    echo "Please see the CGF difference file at server "$HOSTNAME" ===/u01/cgf_recon/diff_file/" >> $LOGDIR/Result.log

elif [[ "$diff1" -le 20 ]] ; then 
diff $LOGDIR/sort_cgf $LOGDIR/sort_cgnat | grep "^>" | awk '{print $2}' >> $LOGDIR/Result.log
 fi; 
          
                     
    echo "Files Missing at CGNAT==>" >> $LOGDIR/Result.log
diff2=`diff $LOGDIR/sort_cgf $LOGDIR/sort_cgnat | grep "^<" |wc -l`

if [[ "$diff2" -le 0 ]] ; then
     echo "-----There is no difference-----" >> $LOGDIR/Result.log

elif [[ "$diff2" -ge 20 ]] ; then
diff $LOGDIR/sort_cgf $LOGDIR/sort_cgnat | grep "^<" | awk '{print $2}' > $DIFF_FILE/cgnat_diff_$3$2$1.log
   echo "Please see the CGNAT difference file a server "$HOSTNAME" ===/u01/cgf_recon/diff_file/" >> $LOGDIR/Result.log

elif [[ "$diff_file" -le 20 ]] ; then
diff $LOGDIR/sort_cgf $LOGDIR/sort_cgnat | grep "^<" | awk '{print $2}' >> $LOGDIR/Result.log

fi;
     fi;
