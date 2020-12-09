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
    ## if you don't want the konsole to show, just toggle the comments of the next 2 lines
    # sudo -S apt upgrade -y
    sudo -S konsole --hold -e apt upgrade -y
    ####
    if [$? = 0] ; then
        echo "exit code $?"
        echo "update complete"        
    	exit 0 #snd_complete
    else        
        echo "exit code $?"
        echo "unable to upgrade"        
        exit 2 #snd_error     	
    fi
fi	