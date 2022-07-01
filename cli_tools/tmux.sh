#!/usr/bin/env bash

set -e

source ../utils.sh
echo -e "\ninstall tmux"


: '
- tmux tpm
'

apt-get install tmux

[ -d "$HOME/.tmux/plugins/tpm/" ] && echo -e "\ntpm has been already installed" || \
(
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
  echo -e "\ntpm installation was completed"
)

# install tmux-plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
