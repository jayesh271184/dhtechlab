#!/bin/bash/
NODE=CHN1
CTR=`date -d -1Days +%Y%m%d`
PDIR=/LVBACKLOGDATA/CHN1_MED_DATA/archieved/postpaid/
RDIR=/LVBACKLOGDATA/CHN1_MED_DATA/archieved/prepaid/
REPO=/u01/legal_recon/
IT=/u01/med_recon/
DATE=`date -d -1Days +%Y%m%d`
cat /u01/scripts/legalflow_collector_logs/${NODE}_legallog_po_input_${DATE}.log | cut -d , -f3,4 > ${REPO}${NODE}_${DATE}_po_Legal_Recon.csv
cat /u01/scripts/legalflow_collector_logs/${NODE}_legallog_pr_input_${DATE}.log | cut -d , -f3,4 > ${REPO}${NODE}_${DATE}_pr_Legal_Recon.csv

# MEDIATION REPORT GENERATION
for i in `cat ${REPO}${NODE}_${DATE}_po_Legal_Recon.csv | cut -c3-5 | sort | uniq`
do
cat ${REPO}${NODE}_${DATE}_po_Legal_Recon.csv | grep `echo "$i"` > ${IT}${NODE}_${i}_PO_${DATE}.csv
done

for j in `cat ${REPO}${NODE}_${DATE}_pr_Legal_Recon.csv | cut -c3-5 | sort | uniq`
do
cat ${REPO}${NODE}_${DATE}_pr_Legal_Recon.csv | grep `echo "$j"` > ${IT}${NODE}_${j}_PR_${DATE}.csv
done
