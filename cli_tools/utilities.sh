#!/usr/bin/bash

set -e

source ../utils.bash
echo -e "\ninstall cli tools and packages"

: '
- curl wget git xclip htop software-properties-common stow
- tmux tpm
'

apt-get install curl wget git xclip htop tmux zsh software-properties-common stow -y

[ -d "$HOME/.tmux/plugins/tpm/" ] && echo -e "\ntpm has been already installed" || \
(
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
  echo "\ntpm installation was completed"
)

