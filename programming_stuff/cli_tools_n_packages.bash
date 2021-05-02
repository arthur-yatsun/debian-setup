#!/usr/bin/env bash
set -e

source ./utils.bash
echo -e "\ninstall cli tools and packages"

: '
- curl
- wget
- git
- vim
- xclip
- htop
- tmux
- zsh
- software-properties-common
- oh-my-zsh
'

sudo apt install curl wget git vim xclip htop tmux zsh software-properties-common -y

# install oh-my-zsh
[ -d "$HOME/.oh-my-zsh/" ] && echo -e "\nohmyzsh is already installed" || \
  (
    echo -e "\ninstall ohmyzsh"
    echo "y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \

    # set zsh as a defaul shell. password required
    # without sudo should work. If you use sudo it will change the shell not for your working user but for root
    # chsh -s $(which zsh)

    # install zsh plugins. to use add them into the plugins variable in your .zshrc file
    # make sure that you define your plugins variable before you initialize zsh. https://stackoverflow.com/a/35929813
    # zsh-autosuggestions. https://github.com/zsh-users/zsh-autosuggestions
    git clone "https://github.com/zsh-users/zsh-autosuggestions" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && /
    # zsh-syntax-highlighting. https://github.com/zsh-users/zsh-syntax-highlighting
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && /

    # OPTIONAL. zsh-autoswitch-virtualenv. https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv. required python virtualenv installed. see `programming_stuff.bash` file
    # git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv
    # OPTIONAL. powerlevel10k theme. https://github.com/romkatv/powerlevel10k
    # git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  )