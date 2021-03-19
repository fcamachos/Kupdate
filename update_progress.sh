#!/bin/bash 

###############################################################
##						Auxiliar Script
###############################################################
## Author: fcamachos
## this script adds a visual feedback about the status of the ugdate

## Gets the languaje from the main script
case $1 in 
    es)
        title1="Actualizando"
        message="Esta ventana se cerrará cuando todos los procesos hayan finalizado"
        title2="Registro"
        ;;
    *)  ## The Default Language is English
        title1="Updating"
        message="This window will close when all processes have fihished"
        title2="Log"
        ;;
esac
## Define the kdialog window
dbusRef=`kdialog --title "$title1" --progressbar "$message" 10`
qdbus $dbusRef showCancelButton false

## Excecute the script and save its process ID
#sudo sh update_aux.sh &
#pid=$!
pid="$1"

echo "$pid"

## Fill the progress bar in a loop until the update_aux.sh exits
while ps -p $pid &>/dev/null; do
 sleep 0.5
 inc=$((`qdbus $dbusRef Get "" "value"` + 1))
 qdbus $dbusRef Set "" "value" $inc; 
done

## Close the kdialog
qdbus $dbusRef close

## Shows the log of the update
kdialog --textbox /tmp/KupdateLogfile.log 512 256