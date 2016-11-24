#!/usr/bin/env bash
source `dirname $0`/config.sh

# THIS SCRIPT IS REPEATABLE


pac linux-lts pacmatic unison evince the_silver_searcher

# material design GTK+ theme
aur adapta-gtk-theme
aur archdroid-icon-theme
aur ttf-roboto

# FZF - Commandline Fuzzy Finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/apps/fzf
~/apps/fzf/install

if [[ $DEVELOPMENT ]]; then
  pac ctags nodejs npm phantomjs postgresql

  sudo npm install -g eslint jsonlint

  # POSTGRESQL
  psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='phil'" | grep -q 1 || sudo -u postgres -c 'createuser -s phil'
  sudo systemctl enable postgresql
  sudo systemctl restart postgresql
fi
