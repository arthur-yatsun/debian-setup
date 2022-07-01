#!/usr/bin/env bash
set -e

echo -e "\nstart the installation"

apt-get update

cd cli_tools/
bash common.sh bash && \
bash zsh.sh && \
bash programming_languages.sh && \
bash databases.sh && \
bash cloud_sdk.sh

# bash ./programming_stuff/cli_tools_n_packages.bash && \
# bash ./programming_stuff/languages.bash && \
# bash ./programming_stuff/apps.bash && \
# bash ./programming_stuff/ide_s.bash && \
# bash ./programming_stuff/databases.bash && \
# bash ./programming_stuff/cloud_sdk.bash
