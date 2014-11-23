#!/usr/bin/env bash

# PACKAGES

pac nodejs unison postgresql alsa-utils alsa-plugins skype

# RUBY

RUBY_VERSION=2.1.4

aur 'rb' 'rbenv'
aur 'ru' 'ruby-build'
aur 'im' 'imagemagick-no-hdri'
rbenv version | grep $RUBY_VERSION || rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash
gem install mdl ruby-lint

# NODE LIBS

sudo npm install -g jscs jshint jsonlint


if [[ `pacman -Q xorg-server 2>/dev/null` != '' ]]; then
  pac alsa-lib flac gconf harfbuzz-icu icu libxtst nss opus snappy speech-dispatcher xdg-utils
  aur 'go' 'google-chrome'
  aur 'ur' 'urxvt-clipboard'
fi

