# disable ubuntu dock (it's up to u, I really don't like it) if INSTALL_OPTIONAL var is set
if [ ! -v $INSTALL_OPTIONAL ]; then
  gnome-extensions disable ubuntu-dock@ubuntu.com
fi
# to enable dock run `gnome-extensions enable ubuntu-dock@ubuntu.com`
