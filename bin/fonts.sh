#!/usr/bin/env bash

if [ -z `pacman -Q xorg-server` ]; then
  echo -e '[infinality-bundle]\nServer = http://bohoomil.com/repo/$arch' >> /etc/pacman.conf
  echo -e '[infinality-bundle-multilib]\nServer = http://bohoomil.com/repo/multilib/$arch' >> /etc/pacman.conf
  echo -e '[infinality-bundle-fonts]\nServer = http://bohoomil.com/repo/fonts' >> /etc/pacman.conf
  pacman-key -r 962DDE58
  pacman-key -f 962DDE58
  pacman-key --lsign-key 962DDE58
  pacman -Syy --noconfirm
  pacman -Rdd --noconfirm --noprogressbar ttf-dejavu
  pac ibfonts-meta-base
else
  echo 'XWindows not installed.'
fi
