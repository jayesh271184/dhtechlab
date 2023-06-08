. /home/oracle/.bash_profile
#------------------------------Start [ Do not Change Configuration Without DBA Approval ]-----------------------------------
#user of the database
user_name=system
#password of the user
pwd=manager
#netstring(service name or db_name)
netstr=cgfidea
/u01/app/oracle/product/11.2.0/db_1/bin/sqlplus $user_name/$pwd@$netstr << EOF
@/home/oracle/dbscripts/gather_stat_offpick_hour.sql
exit;
EOF
