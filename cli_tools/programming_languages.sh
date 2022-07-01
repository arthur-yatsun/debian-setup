#!/usr/bin/env bash
set -e

source ../utils.bash
echo -e "\ninstall programming languages"

: '
- python3 + pip3 + distutils + virtualenv
- java + Maven
- nodeJS
'


# install python
check python3 || \
  (
    echo -e "\ninstall python3" && \
    sudo add-apt-repository ppa:deadsnakes/ppa -y && \
    sudo apt update && \
    sudo apt install python3.8 && \
    echo "python3.8 was installed";

    # install python stuff
    sudo apt install python3-distutils -y && \
    echo "python stuff were installed"
  )

check pip3 || \
 (
    echo -e "\ninstall pip3" && \
    sudo apt install python3-pip -y && \
    echo "pip3 was installed"
 )

check virtualenv || \
 (
    echo -e "\ninstall virtualenv" && \
    sudo pip3 install virtualenv && \
    echo "virtualenv was installed"
 )


# install node
check node || \
(
  echo -e "\ninstall node" && \
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && \
  sudo apt install -y nodejs && \
  echo "node was installed. node version - `node -v`"
)


# install java
check java || \
(
  echo -e "\ninstall java" && \
  sudo apt install default-jre default-jdk -y && \
  echo "java was installed. " && \
  echo "java version - `java -version`. javac version - `javac -version`"
)

check mvn || \
(
  echo -e "\ninstall mvn" && \
  sudo apt install maven -y && \
  echo "maven was installed. maven version - `mvn --version`"
)
