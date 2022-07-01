#!/usr/bin/env bash
set -e

source ../utils.sh
echo -e "\ninstall programming languages"

: '
- python3 + pip3 + distutils + virtualenv
- java + Maven
- nodeJS
- lua
'


# install python
check python3 || \
(
  echo -e "\ninstall python3" && \
  add-apt-repository ppa:deadsnakes/ppa -y && \
  apt-get update && \
  apt-get install python3.8 && \
  echo "python3.8 was installed";

  # install python stuff
  apt-get install python3-distutils -y && \
  echo "python stuff were installed"
)

check pip3 || \
(
  echo -e "\ninstall pip3" && \
  apt-get install python3-pip -y && \
  echo "pip3 was installed"
)

check virtualenv || \
(
  echo -e "\ninstall virtualenv" && \
  apt-get -y install virtualenv && \
  echo "virtualenv was installed"
)


# install node
# check node || \
# (
#   echo -e "\ninstall node" && \
#   curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
#   apt-get install -y nodejs && \
#   echo "node was installed. node version - `node -v`"
# )
#
#
# # install java
# check java || \
# (
#   echo -e "\ninstall java" && \
#   apt-get install default-jre default-jdk -y && \
#   echo "java was installed. " && \
#   echo "java version - `java -version`. javac version - `javac -version`"
# )
#
# check mvn || \
# (
#   echo -e "\ninstall mvn" && \
#   apt-get install maven -y && \
#   echo "maven was installed. maven version - `mvn --version`"
# )

# install lua
check lua || \
(
  echo -e "\ninstall lua" && \
  wget -P /tmp/ http://www.lua.org/ftp/lua-5.3.5.tar.gz && \
  tar xvfz /tmp/lua-5.3.5.tar.gz -C /tmp/ && \
  cd /tmp/lua-5.3.5 && make linux install INSTALL_TOP=/usr/local/lua/5_3_5 MYLIBS="-lncurses"
)
