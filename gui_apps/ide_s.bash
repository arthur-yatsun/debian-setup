#!/usr/bin/env bash
set -e

source ../utils.bash
echo -e "\ninstall IDE's and programming other programming software"

: '
- PyCharm
- IntelliJ
- VSCode
'

# install pycharm
check charm ||
  (
    echo -e "\ninstall pycharm" && \
      wget -P /tmp/ https://download.jetbrains.com/python/pycharm-professional-2020.3.5.tar.gz && \
      sudo tar xf /tmp/pycharm-professional-*.tar.gz -C /opt/ && \
      sudo ln -s /opt/pycharm-*/bin/pycharm.sh /usr/local/bin/charm && \
      echo "pycharm was installed"
  )
# to run pycharm execute `charm <dir_name>` in terminal
# or `charm <dir_name> > /dev/null 2>$1 $` to run in background
# or you can create desktop entry if you want by executing this command
# provide valid path for the Icon attribute
: '
cat > ~/.local/share/applications/charm.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=PyCharm
Exec=charm
Icon=/opt/charm*/bin/pycharm.png
Terminal=false
Type=Application
Categories=Development;
EOL
'

# install intellij idea
check idea || \
  (
    echo -e "\ninstall intellij idea" && \
      wget -P /tmp/ https://download.jetbrains.com/idea/ideaIU-2021.1.tar.gz && \
      sudo tar -xzf /tmp/ideaIU-*.tar.gz -C /opt/ && \
      sudo ln -s /opt/idea-IU*/bin/idea.sh /usr/bin/idea && \
      echo "intellij idea was installed"
  )
# to run pycharm execute `idea <dir_name>` in terminal
# or `idea <dir_name> > /dev/null 2>$1 $` to run in background
# or you can create desktop entry if you want by executing this command
# provide valid path for the Icon attribute
: '
cat > ~/.local/share/applications/idea.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=IntelliJ IDEA
Exec=idea
Icon=/opt/idea-IU*/bin/idea.png
Terminal=false
Type=Application
Categories=Development;
EOL
'

# install vscode
check code || \
  (
    echo -e "\ninstall vscode" && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    rm -f packages.microsoft.gpg && \

    sudo apt install apt-transport-https -y && \
    sudo apt update && \
    sudo apt install code -y
  )
# to run execute `code <dir_name> | <file_name>` in terminal
