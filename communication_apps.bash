#!/usr/bin/env bash
set -e

source ./utils.bash
echo -e "install communication apps\n"

: '
- telegram
- slack
- skype
- microsoft teams
'

# install telegram
# for first time to open telegram run `telegram-desktop` in terminal
check telegram-desktop || \
(
  echo "install telegram-desktop" && \
  sudo wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/ && \
  sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop && \
  echo -e "telegram-desktop was installed"
)


# install slack
check slack || \
(
  echo "install slack" && \
  wget -P /tmp/ https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb && /
  sudo apt install /tmp/slack-desktop-*.deb -y && \
  echo "slack was installed"
)


# install skype
check skypeforlinux || \
(
  echo "install skypeforlinux" && \
  wget -P /tmp/ https://go.skype.com/skypeforlinux-64.deb && \
  sudo apt install /tmp/skypeforlinux-64.deb -y && \
  echo "skypeforlinux was installed"
)


# install microsoft teams
check teams || \
(
  echo "install microsoft teams" && \
  wget -P /tmp/ https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.7556_amd64.deb && \
  sudo apt install /tmp/teams_1.4.00.7556_amd64.deb -y && \
  echo "microsoft teams was installed"
)