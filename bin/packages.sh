#!/usr/bin/env bash

aur 'https://aur.archlinux.org/packages/rb/rbenv/rbenv.tar.gz'
aur 'https://aur.archlinux.org/packages/ru/ruby-build/ruby-build.tar.gz'
rbenv install 2.1.5
gem install mdl ruby-lint

pac nodejs unison
npm install -g jscs jshint jsonlint

if [ -z `pacman -Q xorg-server` ]; then
  aur 'https://aur.archlinux.org/packages/go/google-chrome/google-chrome.tar.gz'
  aur 'https://aur.archlinux.org/packages/ur/urxvt-clipboard/urxvt-clipboard.tar.gz'
fi

