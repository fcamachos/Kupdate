#! /bin/bash

## Asks to the user for his SU password! 
## This script must be used at its own caution.

## Folder where script is stored. For more info visit: https://stackoverflow.com/a/4774063
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

## Declare de title in your language 
title="Kupdate"
## Write the SU password
message="Write your SU password"
## The string to be looked if everything is up to date
# updated="^All packages are up-to-date"

## Translation for Spanish devices
updated="^Todos los paquetes están actualizados"

## Shows a passive popup Looking for updates
snd_begin(){
	kdialog --icon "$SCRIPTPATH"/update.png --title "$title" --passivepopup \
	"Looking for updates" 2
}
## Shows a passive popup when the update ends with an error
snd_error(){
	kdialog --icon "$SCRIPTPATH"/updateF.png --title "$title" --passivepopup \
	"Updating error" 5
}
## Shows a passive popup when there are no updates aviable
snd_noUpdate(){
	kdialog --icon "$SCRIPTPATH"/updateF.png --title "$title" --passivepopup \
	"System is up to date" 5
}
## Shows a passive popup when the update finish correctly
snd_complete(){
	kdialog --icon "$SCRIPTPATH"/update.png --title "$title" --passivepopup \
	"System updated" 5
}
## Shows a passive popup when the user cancels the update
snd_cancel(){
	kdialog --icon "$SCRIPTPATH"/updateF.png --title "$title" --passivepopup \
	"Update canceled" 2
}

## Asking for the Super User password
PASSWD=$(kdialog --title "$title" --password "$message")

## Check the status exit code of the script to send the respective notification

if [ $? = 0 ]; then
	## send the notification of begining
 	snd_begin
	## run the aux script with SU privileges!
	echo $PASSWD | sudo -S sh update_aux.sh "$updated"
	## check the exit code of the aux script
	case $? in
		0)
			snd_complete	## send the notification of update complete
			;; 
		1)
			snd_noUpdate	## send the notification of no update aviable
			;;
		*)
			snd_error		## send the notification of error on Upgrade
			;;
	esac	
	
else
	snd_cancel		## send the notification of cancel update
fi

exit 0