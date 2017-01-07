#!/usr/bin/env bash
source `dirname $0`/config.sh

pac linux-lts pacmatic unison

sudo sed -i 's/keyserver.*/keyserver hkps:\/\/hkps.pool.sks-keyservers.net/' /etc/pacman.d/gnupg/gpg.conf

if [[ $DESKTOP ]]; then
  pac evince
  aur google-chrome

  # make browser-launch npm package able to detect chrome
  $DEVELOPMENT && sudo ln -s /usr/bin/google-chrome-stable /usr/bin/google-chrome
fi

if [[ $MEDIA_SERVER ]]; then
  pac cmake ffmpeg hicolor-icon-theme icu libcec libxbcommon-x11 mpv qt5-base qt5-webengine
  aur prelink
  aur makemkv
  aur plex-media-server-plexpass
  aur plex-media-player

  sudo usermod -G plex -a $USER
fi

if [[ $DEVELOPMENT ]]; then
  pac nodejs npm phantomjs

  # Docker
  pac docker docker-compose
  sudo gpasswd -a ${USER} docker
  sudo systemctl enable docker
  echo 'Logout and log back in to allow docker without sudo'

  # Neovim,  Dein (Neovim package manager)
  pac neovim python-neovim the_silver_searcher
  sudo ln -s /bin/nvim /bin/vim
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.config/nvim

  # FZF - Commandline Fuzzy Finder
  gup fzf junegunn ~/apps/fzf
  ~/apps/fzf/install

  # npm global without sudo
  mkdir -p ~/.npm-packages
  npm config set depth 0
  npm config set prefix ${HOME}/.npm-packages

  # linters
  sudo npm install -g eslint jsonlint

  # Universal Ctags
  gup ctags universal-ctags ~/apps/ctags
  cd ~/apps/ctags
  ./autogen.sh &&
    ./configure &&
    sudo make install

  # PostgreSQL
  pac postgresql
  if [[ $(sudo systemctl status postgresql) ]]; then
    sudo -u postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
    sudo systemctl enable postgresql
    sudo systemctl start postgresql
    sudo -u postgres createuser -s phil
  fi

  # MySQL
  pac mysql
  sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi
