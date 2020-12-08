#! /bin/bash

###############################################################
##						Kupdate
###############################################################
## Author: fcamachos
## This script asks for the user's SU password! 
## Use it with caution.

## Folder where script is stored. For more info visit: https://stackoverflow.com/a/4774063
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
###############################################################
## 						Language Settings
###############################################################
## Search your system language and stores it in a variable
lang=$(locale | grep LANGUAGE | cut -d= -f2 | cut -d_ -f1)
## You can add your language following the rules in the next method
case "$lang" in
	es)			
		title="Kupdate"										## Declare de title in your language 
		message="Escribe tu contraseña de Super Usuario" 	## Write the SU password			
		updated="^Todos los paquetes están actualizados" 	## The string to be looked if everything is up to date | run sudo apt update in a terminal and look for the final result
		beginMsg="Buscando actualizaciones" 				## Looking for updates
		errorMsg="Error de actualización"					## Updating error
		noUpdateMsg="No hay actualizaciones disponibles"	## System is up to date
		completeMsg="Actualización completa"				## System updated
		cancelMsg="Actualización cancelada"					## Update canceled
		wrongPassMsg="Contraseña incorrecta"				## Wrong password
		;; 
	*)	## The Default Language is English
		title="Kupdate"										## Declare de title in your language 
		message="Write your SU password" 					## Write the SU password			
		updated="^All packages are up-to-date"			 	## The string to be looked if everything is up to date | run sudo apt update in a terminal and look for the final result
		beginMsg="Looking for updates"						## Looking for updates
		errorMsg="Updating error"							## Updating error
		noUpdateMsg="System is up to date"					## System is up to date
		completeMsg="System updated"						## System updated
		cancelMsg="Update canceled"							## Update canceled
		wrongPassMsg="Wrong password"						## Wrong password
		;;
esac	
###############################################################
##						PopUp Settings
###############################################################
## You can modify this changing the icon to a one you like
## Also you can modify the last number to control the time the popup is displayed

## Shows a passive popup Looking for updates
snd_begin(){
	kdialog --icon "$SCRIPTPATH"/icons/update.png --title "$title" --passivepopup \
	"$beginMsg" 2
}
## Shows a passive popup when the update ends with an error
snd_error(){
	kdialog --icon "$SCRIPTPATH"/icons/updateF.png --title "$title" --passivepopup \
	"$errorMsg" 5
}
## Shows a passive popup when there are no updates aviable
snd_noUpdate(){
	kdialog --icon "$SCRIPTPATH"/icons/updateF.png --title "$title" --passivepopup \
	"$noUpdateMsg" 5
}
## Shows a passive popup when the update finish correctly
snd_complete(){
	kdialog --icon "$SCRIPTPATH"/icons/update.png --title "$title" --passivepopup \
	"$completeMsg" 5
}
## Shows a passive popup when the user cancels the update
snd_cancel(){
	kdialog --icon "$SCRIPTPATH"/icons/updateF.png --title "$title" --passivepopup \
	"$cancelMsg" 2
}
## Shows a passive popup when the SU password is incorrect
snd_badPassword(){
	kdialog --icon "$SCRIPTPATH"/icons/updateF.png --title "$title" --passivepopup \
	"$wrongPassMsg" 5
}
###############################################################
##						Execution Settings
###############################################################
## Asking for the Super User password
PASSWD=$(kdialog --title "$title" --password "$message")

## Check the status exit code of the script to send the respective notification
if [ $? = 0 ]; then
	## send the notification of begining
 	snd_begin
	## run the aux script with SU privileges!
	echo $PASSWD | sudo -S sh "$SCRIPTPATH"/update_aux.sh "$updated" 
	## check the exit code of the aux script
	case $? in
		0)
			snd_complete	## send the notification of update complete
			;; 
		1)
			snd_badPassword	## send the notification of wrong SU password
			;;
		3)
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