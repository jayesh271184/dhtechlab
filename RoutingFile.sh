#!/bin/bash/
PATH1="/CGNATDATA1/CGNAT_ROOT/SYSLOG_COLLECTION/IDEA_UPE/ROUTING_INPUT"
P0="/CGNATDATA1/CGNAT_ROOT/SYSLOG_COLLECTION/IDEA_UPE/input"
lock_path="/tmp/"
if test -f ${lock_path}.Prasing_UPE.SPLIT.lock
        then
                echo "script is already running"
                exit
        else
                echo " creating lock file "
                touch ${lock_path}.Prasing_UPE.SPLIT.lock
fi;

####################HP###########################
INPUT=`find $P0 -name "*" -type f |wc -l`

##########################FOR INPUT###############################
if [ $INPUT -le 300 ]
then
find $PATH1 -type f -name "*"| head -2500 | xargs -I {} mv {} $P0
else
echo "Much Files in INPUT PATH of Parsing Services"
fi
rm -f ${lock_path}.Prasing_UPE.SPLIT.lock
