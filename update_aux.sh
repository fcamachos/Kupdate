#!/bin/bash 

## Check if the update command has the key word when system is updated
log={ apt update 2>&1 } | grep -i "$1" ##"$updated"
## If system is updated do nothing
if $log ; then    
    echo "up to date"
    echo "$1"
    exit 1      #snd_noUpdate
## If there are updates aviable run the upgrade
else
    echo "update needed"
    sudo -S konsole --hold -e apt upgrade -y
    if [$? = 0]; then
    	exit 0 #snd_complete
    else
    	exit 2 #snd_error
    fi
fi	