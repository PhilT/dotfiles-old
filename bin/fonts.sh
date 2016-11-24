#!/usr/bin/env bash
source `dirname $0`/config.sh

# THIS SCRIPT IS REPEATABLE

if [[ $DESKTOP ]]; then

  sudo -i dirmngr < /dev/null # fixes https://bugs.archlinux.org/task/42798

  grep -q infinality /etc/pacman.conf
  if [[ $? -eq 1 ]]; then
    echo -e '[infinality-bundle]\nServer = http://bohoomil.com/repo/$arch' | sudo tee -a /etc/pacman.conf >> /dev/null
    echo -e '[infinality-bundle-multilib]\nServer = http://bohoomil.com/repo/multilib/$arch' | sudo tee -a /etc/pacman.conf >> /dev/null
    echo -e '[infinality-bundle-fonts]\nServer = http://bohoomil.com/repo/fonts'  | sudo tee -a /etc/pacman.conf >> /dev/null
  fi

  sudo pacman-key -r 962DDE58
  sudo pacman-key -f 962DDE58
  sudo pacman-key --lsign-key 962DDE58
  sudo pacman -Syy --noconfirm
  sudo pacman -Q ttf-dejavu
  if [[ $? -eq 0 ]]; then
    sudo pacman -Rdd --noconfirm --noprogressbar ttf-dejavu
  fi
  sudo pacman -Q ibfonts-meta-base
  if [[ $? -eq 0 ]]; then
    sudo pacman -Rdd --noconfirm --noprogressbar ibfont-meta-base
  fi
  pac ibfonts-meta-base

  gup fonts powerline ~/apps
fi
