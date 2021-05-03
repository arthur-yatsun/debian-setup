install cli applications, software, programming languages for Debian based systems by running one simple command.

Tested on Ubuntu 20.04

Usage:
### install applications
`make install`

the list of programs to be installed:
- Communication apps
    - Skype
    - Slack
    - Microsoft Teams
    - Telegram
    
- Command line tools and applications
    - curl
    - wget
    - git
    - vim
    - xclip
    - htop
    - tmux
    - zsh
    - oh-my-zsh
    
- Programming languages
    - Python 3.8 + pip3 + virtualenv + distutils
    - Java + Maven
    - NodeJS
    
- Databases
    - MySQL
    - PostgreSQL
    - MongoDB

- IDE
    - PyCharm
    - IntellijIDEA
    - VSCode
    
- Cloud SDK
    - Google Cloud Platform
    
- Other apps
    - Postman
    - Tilix
    - Clipit
    
You can install optional infrastructure by providing `$INSTALL_OPTIONAL` environment variable

`
export INSTALL_OPTIONAL=1
`

Optional infrastructure:
- oh-my-zsh plugins
    - zsh-autosuggestions
    - zsh-syntax-highlighting
    - zsh-autoswitch-virtualenv
- oh-my-zsh custom themes
    - powerlevel10k theme


### update configs
If you have a predefined set of configurations u can store them in separate repo and apply them on new system by running
`make update_configs`

Before you will start set these environmental variables:
```
export GIT_CONFIG_REPO="<link to the repository with your configs for which you have access>"
``` 

Supported configs:
- ~/.zshrc
- ~/.configs/user-dirs.dirs
- ~/.gitconfig
- /etc/hosts

You can add your custom config import (e.g `~/.vimrc`) by adding this code in the `user_conifgs/update_configs.bash` script
```bash
update_config <config_destination> <backup_destination> <origin_destination>
```


