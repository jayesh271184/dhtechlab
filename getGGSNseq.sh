#!/bin/bash


DBUSER='CRESTELMEDIATIONPRD501'
DBUSERPASSWORD='CRESTELMEDIATIONPRD501'
DB='cgfidea2'

ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export ORACLE_HOME


counter=$(/u01/app/oracle/product/11.2.0/db_1/bin/sqlplus -S $DBUSER/$DBUSERPASSWORD@$DB <<EOF

set pagesize 0 feedback off verify off heading off echo off;
select ggsnasn_seq.nextval from dual;
exit


EOF
)
echo -n "GGSN_SEQ=" 
echo -n $counter
echo "=GGSN_SEQ"
