#!/bin/bash 

###############################################################
##						Auxiliar Script
###############################################################
## Author: fcamachos

## Check if it has su privileges
if [[ $EUID -ne 0 ]]; then
    echo "Not running as root"
    exit
else 
    echo "Running as root"
fi

## Check if the update command has the key word when system is updated
## If system is updated do nothing
if ! apt update 2>&1 | grep -i "upgradable" ; then    
    echo "apt update exit code $?"
    echo "up to date"    
    exit 3      #snd_noUpdate
## If there are updates aviable run the upgrade
else
    echo "update needed"    
    
    ## Launch the window progress feedback
    # pid=$$
    # sh update_progress.sh "$pid" "$1" &    
    
    ## send to konsole and to the logfile the upgrade process. 
    ## If you don't want to overwrite it add -a to the parameter
    ## Example: apt upgrade -y 2>&1 | tee -a /tmp/logfile.log    
    apt upgrade -y 2>&1 | tee /tmp/KupdateLogfile.log
    
    ## Checks if there were any error during the upgrade
    echo "exit code $?"
    if ! grep -i "ERROR.*" /tmp/KupdateLogfile.log ; then         
        echo "upgrade complete"
        exit 0 #snd_complete
    else
        echo "exit code $?"
        echo "unable to upgrade, see /tmp/KupdateLogfile.log for details"
        exit 2 #snd_error     	
    fi
fi	
