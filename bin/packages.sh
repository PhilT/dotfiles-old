!/usr/bin/env bash

aur 'https://aur.archlinux.org/packages/rb/rbenv/rbenv.tar.gz'
aur 'https://aur.archlinux.org/packages/ru/ruby-build/ruby-build.tar.gz'
rbenv install 2.1.4
rbenv global 2.1.4
gem install mdl ruby-lint

pac nodejs unison
sudo npm install -g jscs jshint jsonlint

pacman -Q xorg-server
if [ $? -eq 0 ]; then
  pac alsa-lib flac gconf harfbuzz-icu icu libxtst nss opus snappy speech-dispatcher xdg-utils
  aur 'https://aur.archlinux.org/packages/go/google-chrome/google-chrome.tar.gz'
  aur 'https://aur.archlinux.org/packages/ur/urxvt-clipboard/urxvt-clipboard.tar.gz'
fi

