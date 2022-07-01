#!/usr/bin/bash

set -e

source ../utils.sh
echo -e "\ninstall cli tools and packages"

: '
- zsh oh-my-zsh 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    zsh-autoswitch-virtualenv 
    powerlevel10k theme
'
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
if [ -d "$HOME/.oh-my-zsh/" ]; then
  : '
  - zsh-autosuggestions          https://github.com/zsh-users/zsh-autosuggestions
  - zsh-syntax-highlighting      https://github.com/zsh-users/zsh-syntax-highlighting
  - zsh-autoswitch-virtualenv    https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv
  - powerlevel10k theme          https://github.com/romkatv/powerlevel10k
  '
  echo -e "\ninstall zsh plugins"

  [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && echo "zsh-autosuggestions is already installed" || \
  git clone "https://github.com/zsh-users/zsh-autosuggestions" ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

  [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && echo "zsh-syntax-highlighting is already installed" || \
  git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

  # virtualenv required
  [ -d ~/.oh-my-zsh/custom/plugins/autoswitch_virtualenv ] && echo "autoswitch_virtualenv theme is already installed" || \
  git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" ~/.oh-my-zsh/custom/plugins/autoswitch_virtualenv

  [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] && echo "powerlevel10k is already installed" || \
  git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

