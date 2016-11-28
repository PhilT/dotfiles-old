#!/usr/bin/env bash
source `dirname $0`/config.sh

# THIS SCRIPT IS REPEATABLE


pac linux-lts pacmatic unison evince the_silver_searcher

# material design GTK+ theme
aur adapta-gtk-theme
aur archdroid-icon-theme
aur ttf-roboto

# FZF - Commandline Fuzzy Finder
gup fzf junegunn ~/apps/fzf
~/apps/fzf/install

if [[ $DEVELOPMENT ]]; then
  pac ctags nodejs npm phantomjs postgresql

  sudo npm install -g eslint jsonlint

  # POSTGRESQL
  if [[ $(sudo systemctl status postgresql) ]]; then
    sudo -u postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
    sudo systemctl enable postgresql
    sudo systemctl start postgresql
    sudo -u postgres createuser -s phil
  fi
fi
