#!/usr/bin/bash

sudo apt update
sudo apt upgrade -y


###################
##### CONFGIS #####
###################

# OPTIONAL only for ubuntu users
# disable ubuntu dock (it's up to u, I really don't like it)
# to enable dock run `gnome-extensions enable ubuntu-dock@ubuntu.com`
#gnome-extensions disable ubuntu-dock@ubuntu.com


###########################
#### APPS INSTALLATION ####
###########################
bash programming_tools.bash
bash communication_apps.bash

