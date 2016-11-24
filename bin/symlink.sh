#!/usr/bin/env bash

# Adds symlinks for everything in data/ to ~/ and prefixes them with a dot ('.')
# so that dotfiles can be kept updated

existing=`find ~ -maxdepth 1 -type l`
current=`cd data > /dev/null && find -maxdepth 1 -type f -printf '%P\n'`

config_files='Trolltech.conf gtk-3.0/settings.ini nvim/init.vim'

remove_existing () {
  for symlink in $existing; do
    rm -f $symlink
  done

  for symlink in $config_files; do
    rm -f ~/.config/$symlink
  done
}

add_current () {
  for file in $current; do
    ln -s `pwd`/data/$file ~/.$file
  done

  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/gtk-3.0
  for file in $config_files; do
    ln -s `pwd`/data/config/$file ~/.config/$file
  done
}

remove_existing
add_current
