#########################
##### TERMINAL APPS #####
#########################
#sudo apt install curl wget git vim xclip -y


###################################
##### TILIX TERMINAL EMULATOR #####
###################################
# install tilix. terminal emulator (docs. https://gnunn1.github.io/tilix-web/)
# sudo apt install tilix -y

# set tilix as default shell. remove default terminal from alternatives
# sudo update-alternatives --remove "x-terminal-emulator" "/usr/bin/gnome-terminal.wrapper"

# to return default terminal run
# sudo update-alternatives --install `which x-terminal-emulator` x-terminal-emulator /usr/bin/gnome-terminal.wrapper 40
# to config default terminal manually run
# sudo update-alternatives --config x-terminal-emulator
# if you will have issues with overriding command prompt go here
# https://gnunn1.github.io/tilix-web/manual/vteconfig/
# run to open tilix configurations
# tilix --preferences


##################
##### CLIPIT #####
##################
# context manager, deb package in ./deb_packages folder, it's hard to find not broken release
#sudo dpkg -i ./deb_packages/clipit_1.4.2-1.2_amd64.deb
# prevent update because next clipit releases has broken dependecies with GTK linux library
#sudo apt-mark hold clipit
# to unhold run `sudo apt-mark unhold <package-name>`
# to show all hold packages run `sudo apt-mark showhold`


###########################
##### OH_MY_ZSH SHELL #####
###########################
# sudo apt install zsh -y

# install oh-my-zsh
# echo "y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# set zsh as a defaul shell. password required
# without sudo should work. If you use sudo it will change the shell not for your working user but for root
# chsh -s $(which zsh)

# install zsh plugins. to use add them into the plugins variable in your .zshrc file
# make sure that you define your plugins variable before you initialize zsh. https://stackoverflow.com/a/35929813
# zsh-autosuggestions. https://github.com/zsh-users/zsh-autosuggestions
# git clone "https://github.com/zsh-users/zsh-autosuggestions" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting. https://github.com/zsh-users/zsh-syntax-highlighting
# git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# OPTIONAL. zsh-autoswitch-virtualenv. https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv. required python virtualenv installed. see `programming_tools.bash` file
# git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv


###############################
#### PROGRAMMING LANGUAGES ####
###############################
# ---- python3 ----
# by default Linux has installed python. install pip + distutils + virtualenv
# sudo apt-get install python3-pip -y
# sudo apt-get install python3-distutils -y
# sudo pip3 install virtualenv

# ---- nodejs ----
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# sudo apt-get install -y nodejs
# node -v

# ---- java ----
# sudo apt install default-jre default-jdk -y
# java -version
# javac -version


#################
##### IDE's #####
#################
# ----- pycharm -----
# wget -P /tmp/ https://download.jetbrains.com/python/pycharm-professional-2020.3.5.tar.gz
# sudo tar xf /tmp/pycharm-professional-*.tar.gz -C /opt/
# to run pycharm execute in terminal`. /opt/pycharm-2020.3.5/bin/pycharm.sh`
# or add this line in your .zshrc or .bashrc file:
# function charm { . /opt/pycharm-2020.3.5/bin/pycharm.sh "$1"; }


######################
##### DATA BASES #####
######################
# ----- mysql -----
#sudo apt install mysql-server
# systemctl status mysql.service
# for advanced configs go here https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04

# ----- postgres -----
#sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install postgresql -y
# systemctl status postgresql.service
# for advanced configs go here https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04

# ----- mongodb -----
#wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
#sudo apt-get update
#sudo apt-get install mongodb-org -y
#sudo systemctl start mongod
# stop mongo deamon process `sudo systemctl stop mongod`

# systemctl status mongod.service
# for advanced configs go here https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/


#####################
##### CLOUD SDK #####
#####################
# ----- GCP -----
#echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
#sudo apt-get install apt-transport-https ca-certificates gnupg -y
#curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
#sudo apt-get update && sudo apt-get install google-cloud-sdk -y
# gcloud init