#!/bin/bash
 
logfile="/var/log/tsm/last_backup.log"
export LANG=en_US.UTF-8
 
if [[ "x`whoami`" != "xroot" ]] ;then
    /bin/echo "${0} must be run as root"
    exit 1
fi
 
umask 077
/usr/bin/dsmc incremental > $logfile
 
if [[ $? -ne 0 ]] ;then
    /bin/echo "Error while doing a backup of $HOSTNAME
 
Last 13 lines of the dsmc output:
"
    /usr/bin/tail -n13 $logfile
fi
