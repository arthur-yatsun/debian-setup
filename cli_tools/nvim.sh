#!/usr/bin/bash

set -e

source ../utils.sh
echo -e "\ninstall neovim"


check nvim ||
(
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb -P /tmp && /
  apt install /tmp/nvim-linux64.deb
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
)

