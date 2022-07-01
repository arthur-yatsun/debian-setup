#!/usr/bin/bash

set -e

source ../utils.bash
echo -e "\ninstall cli tools and packages"

: '
- curl wget git xclip htop software-properties-common
- tmux tpm
- zsh oh-my-zsh 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    zsh-autoswitch-virtualenv 
    powerlevel10k theme
'

sudo apt-get install curl wget git xclip htop tmux zsh software-properties-common -y

[ -d "$HOME/.tmux/plugins/tpm/" ] && echo -e "\ntpm has been already installed" || \
(
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
  echo "\ntpm installation was completed"
)



# install oh-my-zsh
[ -d "$HOME/.oh-my-zsh/" ] && echo -e "\nohmyzsh is already installed" || \
(
  echo -e "\ninstall ohmyzsh" && \
  echo "y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
  echo "ohmyzsh was installed"
)
# set zsh as a defaul shell. password required
# without sudo should work. If you use sudo it will change the shell not for your working user but for root
# chsh -s $(which zsh)


# install zsh plugins if INSTALL_OPTIONAL var is set
# make sure that you define your plugins variable before you initialize zsh. https://stackoverflow.com/a/35929813
if [ -d "$HOME/.oh-my-zsh/" ] && [ ! -v $INSTALL_OPTIONAL ]; then
  : '
  - zsh-autosuggestions          https://github.com/zsh-users/zsh-autosuggestions
  - zsh-syntax-highlighting      https://github.com/zsh-users/zsh-syntax-highlighting
  - zsh-autoswitch-virtualenv    https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv
  - powerlevel10k theme          https://github.com/romkatv/powerlevel10k
  '
  echo -e "\ninstall zsh plugins"

  [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] && echo "zsh-autosuggestions is already installed" || \
  git clone "https://github.com/zsh-users/zsh-autosuggestions" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] && echo "zsh-syntax-highlighting is already installed" || \
  git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # virtualenv required
  [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ] && echo "autoswitch_virtualenv is already installed" || \
  git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv

  [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv ] && echo "powerlevel10k theme is already installed" || \
  git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
