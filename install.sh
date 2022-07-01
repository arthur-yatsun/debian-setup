#!/usr/bin/env bash
set -e

echo -e "\nstart the installation"

apt-get update && apt-get upgrade -y && \
bash ./cli_tools/utilities.sh
# bash ./programming_stuff/cli_tools_n_packages.bash && \
# bash ./programming_stuff/languages.bash && \
# bash ./programming_stuff/apps.bash && \
# bash ./programming_stuff/ide_s.bash && \
# bash ./programming_stuff/databases.bash && \
# bash ./programming_stuff/cloud_sdk.bash
