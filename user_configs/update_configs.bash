# disable ubuntu dock (it's up to u, I really don't like it) if INSTALL_OPTIONAL var is set
#if [ ! -v $INSTALL_OPTIONAL ]; then
#  gnome-extensions disable ubuntu-dock@ubuntu.com
#fi
# to enable dock run `gnome-extensions enable ubuntu-dock@ubuntu.com`

update_config () {
  config_destination=$1
  backup_destination=$2
  origin_destination=$3

  if [ -f $config_destination ]; then
    echo -e "backup $origin_destination in $backup_destination... \c" && \
    cp $origin_destination $backup_destination && \
    echo "done"

    echo -e "update config for $origin_destination... \c" && \
    sudo cp $config_destination $origin_destination && \
    echo -e "done\n"
  fi
}

if [ ! -v $GIT_CONFIG_REPO ]; then
  git clone $GIT_CONFIG_REPO $CONFIGS_DIR

  CONFIGS_DIR="./configs"
  BACKUP_DIR="./configs_backup"

  mkdir -p $BACKUP_DIR

  echo "update zshrc"
  update_config $CONFIGS_DIR/zshrc $BACKUP_DIR/zshrc ~/.zshrc

  echo "update gitconfig"
  update_config $CONFIGS_DIR/gitconfig $BACKUP_DIR/gitconfig ~/.gitconfig

  echo "update /etc/hosts"
  update_config $CONFIGS_DIR/hosts $BACKUP_DIR/hosts /etc/hosts

  echo "update user-dirs.dirs"
  update_config $CONFIGS_DIR/user-dirs.dirs $BACKUP_DIR/user-dirs.dirs ~/.config/user-dirs.dirs

  # add your custom configs here
fi
