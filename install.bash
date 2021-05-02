#!/usr/bin/env bash
set -e

echo -e "\nstart the installation"

# OPTIONAL only for ubuntu users
# disable ubuntu dock (it's up to u, I really don't like it)
# to enable dock run `gnome-extensions enable ubuntu-dock@ubuntu.com`
#gnome-extensions disable ubuntu-dock@ubuntu.com

sudo apt update && \
bash ./programming_stuff/cli_tools_n_packages.bash && \
bash ./programming_stuff/languages.bash && \
bash ./programming_stuff/apps.bash && \
bash ./programming_stuff/ide_s.bash && \
bash ./programming_stuff/databases.bash && \
bash ./programming_stuff/cloud_sdk.bash

echo "\ninstallation was finished successfully"