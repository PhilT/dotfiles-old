#!/usr/bin/env bash

# THIS SCRIPT IS REPEATABLE

# PACKAGES

pac nodejs unison postgresql alsa-utils alsa-plugins skype evince ctags phantomjs

# RUBY

RUBY_VERSION=2.2.0

aur 'rb' 'rbenv'
aur 'ru' 'ruby-build'
rbenv version | grep $RUBY_VERSION || rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash
gem install mdl ruby-lint

# NODE LIBS

sudo npm install -g jscs jshint jsonlint


# CHROME and CLIPBOARD

if [[ `pacman -Q xorg-server 2>/dev/null` != '' ]]; then
  aur 'go' 'google-chrome'
  aur 'ur' 'urxvt-clipboard'
fi


# POSTGRESQL
psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='phil'" | grep -q 1 || sudo -u postgres 'createuser -s phil'
sudo systemctl enable postgresql
sudo systemctl start postgresql


# HEROKU

aur 'he' 'heroku-client-standalone'

