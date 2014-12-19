#!/usr/bin/env bash

if [[ `pacman -Q xorg-server 2>/dev/null` != '' ]]; then

  sudo -i dirmngr < /dev/null # fixes https://bugs.archlinux.org/task/42798

  echo -e '[infinality-bundle]\nServer = http://bohoomil.com/repo/$arch' | sudo tee -a /etc/pacman.conf >> /dev/null
  echo -e '[infinality-bundle-multilib]\nServer = http://bohoomil.com/repo/multilib/$arch' | sudo tee -a /etc/pacman.conf >> /dev/null
  echo -e '[infinality-bundle-fonts]\nServer = http://bohoomil.com/repo/fonts'  | sudo tee -a /etc/pacman.conf >> /dev/null
  sudo pacman-key -r 962DDE58
  sudo pacman-key -f 962DDE58
  sudo pacman-key --lsign-key 962DDE58
  sudo pacman -Syy --noconfirm
  sudo pacman -Rdd --noconfirm --noprogressbar ttf-dejavu
  pac ibfonts-meta-base
fi

