echo "================================================== AHD CIRCLE =============================================================="
 ssh root@10.164.7.1 sh /u01/scripts/memory.sh  
 ssh root@10.164.7.2 sh /u01/scripts/memory.sh 
 ssh root@10.164.7.3 sh /u01/scripts/memory.sh
echo "================================================== LKO CIRCLE =============================================================="
 ssh root@10.164.7.7 sh /u01/scripts/memory.sh
 ssh root@10.164.7.8 sh /u01/scripts/memory.sh
 ssh root@10.164.7.9 sh /u01/scripts/memory.sh
echo "================================================== KOL CIRCLE =============================================================="
 ssh root@10.164.7.13 sh /u01/scripts/memory.sh
 ssh root@10.164.7.14 sh /u01/scripts/memory.sh
 ssh root@10.164.7.15 sh /u01/scripts/memory.sh
echo "================================================== CH1 CIRCLE =============================================================="
 ssh root@10.164.7.19 sh /u01/scripts/memory.sh
 ssh root@10.164.7.20 sh /u01/scripts/memory.sh
 ssh root@10.164.7.21 sh /u01/scripts/memory.sh
echo "================================================== CH2 CIRCLE =============================================================="
 ssh root@10.164.7.25 sh /u01/scripts/memory.sh
 ssh root@10.164.7.26 sh /u01/scripts/memory.sh
 ssh root@10.164.7.27 sh /u01/scripts/memory.sh
echo "================================================== DEL CIRCLE =============================================================="
 ssh root@10.164.7.31 sh /u01/scripts/memory.sh
 ssh root@10.164.7.32 sh /u01/scripts/memory.sh
 ssh root@10.164.7.33 sh /u01/scripts/memory.sh
echo "================================================== MUM1 CIRCLE =============================================================="
 ssh root@10.164.7.37 sh /u01/scripts/memory.sh
 ssh root@10.164.7.38 sh /u01/scripts/memory.sh
 ssh root@10.164.7.39 sh /u01/scripts/memory.sh
#echo "================================================== MUM2 CIRCLE =============================================================="
# ssh root@10.164.7.43 sh /u01/scripts/memory.sh
# ssh root@10.164.7.44 sh /u01/scripts/memory.sh
# ssh root@10.164.7.45 sh /u01/scripts/memory.sh
echo "================================================== APP SERVER =============================================================="
ssh root@10.164.7.49 sh /u01/scripts/memory.sh
sh /u01/scripts/memory.sh
