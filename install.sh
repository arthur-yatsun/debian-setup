#!/usr/bin/env bash
set -e

echo -e "\nstart the installation"

apt-get update

cd cli_tools/

# bash common.sh bash && \
# bash zsh.sh && \
# bash tmux.sh 
bash programming_languages.sh && \
# bash databases.sh && \
# bash cloud_sdk.sh

