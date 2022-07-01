#!/usr/bin/bash

set -e

source ../utils.sh
echo -e "\ninstall neovim"


check nvim ||
(
  add-apt-repository ppa:neovim-ppa/stable -y && \
  apt-get update && \
  apt-get install neovim -y && \
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
)

