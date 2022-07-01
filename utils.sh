
# function to check if provided app was installed
check () {
  which $1 > /dev/null && echo -e "$1 is already installed"
}

