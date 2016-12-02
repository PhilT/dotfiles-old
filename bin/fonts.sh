#!/usr/bin/env bash
source `dirname $0`/config.sh

if [[ $DESKTOP ]]; then

  grep -q infinality /etc/pacman.conf
  if [[ $? -eq 1 ]]; then
    echo -e '[infinality-bundle]\nServer = http://bohoomil.com/repo/$arch' | sudo tee -a /etc/pacman.conf >> /dev/null
    echo -e '[infinality-bundle-multilib]\nServer = http://bohoomil.com/repo/multilib/$arch' | sudo tee -a /etc/pacman.conf >> /dev/null
    echo -e '[infinality-bundle-fonts]\nServer = http://bohoomil.com/repo/fonts'  | sudo tee -a /etc/pacman.conf >> /dev/null
  fi

  sudo pacman-key -r 962DDE58
  sudo pacman-key -f 962DDE58
  sudo pacman-key --lsign-key 962DDE58
  sudo pacman -Syyu
  sudo pacman -Rdd --noconfirm --noprogressbar ttf-dejavu > /dev/null 2>&1 # conflicts as ibfonts-meta-base has this
  sudo pacman -Rdd --noconfirm --noprogressbar ibfonts-meta-base > /dev/null 2>&1
  pac ibfonts-meta-base

  gup fonts powerline ~/apps/fonts
  cd ~/apps/fonts
  ./install.sh
  cd -
fi
