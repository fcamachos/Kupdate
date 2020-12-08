#!/bin/bash 

###############################################################
##						Auxiliar Script
###############################################################
## Author: fcamachos

## Check if the update command has the key word when system is updated
log= apt update 2>&1 | grep -i "$1" ##"$updated"
echo $log
## If system is updated do nothing
if apt update 2>&1 | grep -i "$1" ; then    
    echo "up to date"
    exit 3      #snd_noUpdate
## If there are updates aviable run the upgrade
else
    echo "update needed"
    ## if you don't want the konsole to show, just toggle the comments of the next 2 lines
    # sudo -S apt upgrade -y
    sudo -S konsole -e apt upgrade -y
    ####
    if [$? = 0] ; then
    	exit 0 #snd_complete
    else
    	exit 2 #snd_error
    fi
fi	