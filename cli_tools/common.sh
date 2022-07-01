#!/usr/bin/bash

set -e

source ../utils.sh
echo -e "\ninstall cli tools and packages"

: '
'
apt-get install curl vim wget git xclip htop zsh \
    software-properties-common stow libreadline-dev ripgrep -y
