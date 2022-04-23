#!/usr/bin/env bash
set -e

source ../utils.bash
echo -e "\ninstall tools"

: '
- Tilix
- Clipit
- Postman
'


# install tilix. terminal emulator (docs. https://gnunn1.github.io/tilix-web/)
check tilix || \
(
  echo -e "\ninstall tilix" &&
    sudo apt install tilix -y &&
    # set tilix as default shell. remove default terminal from alternatives
    sudo update-alternatives --remove "x-terminal-emulator" "/usr/bin/gnome-terminal.wrapper" &&
    echo "tilix was installed"
)

# to return default terminal as default terminal run
#sudo update-alternatives --install `which x-terminal-emulator` x-terminal-emulator /usr/bin/gnome-terminal.wrapper 40

# to config default terminal manually run
#sudo update-alternatives --config x-terminal-emulator

# if you will have issues with overriding command prompt go here https://gnunn1.github.io/tilix-web/manual/vteconfig/
# run to open tilix configurations
#tilix --preferences


# context manager, deb package in ./deb_packages folder, it's hard to find not broken release
check clipit || \
(
  echo -e "\ninstall clipit" && \
  sudo dpkg -i ./deb_packages/clipit_1.4.2-1.2_amd64.deb && \
  # prevent update because next clipit releases has broken dependecies with GTK linux library
  # to unhold run `sudo apt-mark unhold <package-name>`, to show all hold packages run `sudo apt-mark showhold`
  sudo apt-mark hold clipit && \
  echo "clipit was installed"
)

# install Postman
check postman || \
(
  echo -e "\ninstall postman" && \
  curl https://dl.pstmn.io/download/latest/linux64 --output /tmp/Postman.tar.gz && \
  sudo tar -xzf /tmp/Postman.tar.gz -C /opt/ && \
  sudo ln -s /opt/Postman/Postman /usr/bin/postman
)
# to run postman execute `postman` in terminal
# or `postman > /dev/null 2>$1 $` to run in background
# or you can create desktop entry if you want by executing this command
: '
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
'
