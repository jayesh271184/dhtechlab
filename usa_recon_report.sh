NODE=CH1
D=`date -d -1days +%d/%m/%Y | cut -d / -f1`
M=`date -d -1days +%d/%m/%Y | cut -d / -f2`
Y=`date -d -1days +%d/%m/%Y | cut -d / -f3`

sh /u01/scripts/report_script/usa_recon.sh $D $M $Y >> /u01/cgf_recon/${NODE}_CEN_USAGE_${D}_${M}_${Y}.csv
