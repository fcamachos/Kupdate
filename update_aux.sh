#!/bin/bash 

###############################################################
##						Auxiliar Script
###############################################################
## Author: fcamachos

## Check if the update command has the key word when system is updated
## If system is updated do nothing
if ! apt update 2>&1 | grep -i "upgradable" ; then    
    echo "exit code $?"
    echo "up to date"    
    exit 3      #snd_noUpdate
## If there are updates aviable run the upgrade
else
    echo "update needed"
    ## send to konsole and to the logfile the upgrade process. 
    ## If you don't want to overwrite it add -a to the parameter
    ## Example: apt upgrade -y 2>&1 | tee -a /tmp/logfile.log
    apt upgrade -y 2>&1 | tee /tmp/KupdateLogfile.log
    echo "exit code $?"
    if grep "^[0-9].*[0-9].*[0-9].*[0]" /tmp/KupdateLogfile.log ; then         
        echo "upgrade complete"
        exit 0 #snd_complete
    else
        echo "exit code $?"
        echo "unable to upgrade, see /tmp/KupdateLogfile.log for details"
        exit 2 #snd_error     	
    fi
fi	