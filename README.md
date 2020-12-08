# Kupdate
A little script to keep the system Updated with just one click

### What does it does?

This script runs de *sudo apt update* to look for updates of your system. If there are updates aviable, it will try to do a *sudo apt upgrade*.
Every step will be followed with a *kool* notification in the corner of your screen thanks to the *kdialog* component.

### Why a script this simple? 

This is my first aproach to contibute with the great world of Linux, specially KDE wich gave me some of the *koolest* moments of my life.

This script is a intent to improve the experience of updating the system, specially for those who are introducing to KDE and are still afraid to use the powerful konsole, or just want to click somewhere and the computer do the job of updating.

### Using the script

Since this script is for new people entering to the programming world I'll try to be the clearest as possible to guide you. 

#### Downloading the code

This is as simple as clicking the green button on the right of this site or opening your terminal (press Alt + F2, then write konsole) and cloning this repository on your PC. 

For more info about cloning repositories here is the link with all the info necessary: [Cloning Repositories](https://docs.github.com/es/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/cloning-a-repository)

#### Unzipping the code

Thanks to KDE we just can go to the directory the file was downloaded (cloned), right click on it and unzip it. If you want to learn more about it just give a look over [here](https://docs.kde.org/trunk5/en/kdeutils/ark/ark-extract.html#:~:text=This%20can%20be%20done%20by,options%20that%20affect%20the%20extraction.).

#### Ok, I got it, what next?

Just to make sure, you have to give the scripts the permissions to run in your PC. Before you do it, consider the risk of running any code you download from internet. You can read the code with your favorite text editor and try to understand how it works. I tried to explain the code in the comments but make sure you can follow the logic and nothing in the code looks suspicious... 

Once you're done lets see how to give run permissions:

- If you're a fan of konsole, take a look over [here](https://bash.cyberciti.biz/guide/Setting_up_permissions_on_a_script).
- If you're more onto Graphic User Interface and use Dolphin as your File Explorer, you just can right click on the scrips, go to *Properties/Permissions* and mark *Is Executable*

#### Runing the script

Now everything is ready, just double click on the **update.sh** file and it will begin to update your system.

#### Making it even more beautiful

This is just for those who want to make it even cleaner than clicking on a awful sh file.

Even though there are a lot of ways to make short cuts I'll recommend you to use GnomePie. A really great tool to launch your applications and even scripts.

If you're interested try it [here](https://schneegans.github.io/gnome-pie)!
