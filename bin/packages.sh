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
  pac neovim python-neovim
  pac the_silver_searcher nodejs npm phantomjs postgresql mysql
  pac docker docker-compose

  # Setup Docker
  sudo gpasswd -a ${USER} docker
  sudo systemctl enable docker
  echo 'Logout and log back in to allow docker without sudo'

  # Install Dein (Neovim package manager)
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.config/nvim

  # FZF - Commandline Fuzzy Finder
  gup fzf junegunn ~/apps/fzf
  ~/apps/fzf/install

  # linters
  sudo npm install -g eslint jsonlint

  # ctags
  gup ctags universal-ctags ~/apps/ctags
  cd ~/apps/ctags
  ./autogen.sh &&
    ./configure &&
    sudo make install

  # POSTGRESQL
  if [[ $(sudo systemctl status postgresql) ]]; then
    sudo -u postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
    sudo systemctl enable postgresql
    sudo systemctl start postgresql
    sudo -u postgres createuser -s phil
  fi
fi
