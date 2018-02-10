#!/usr/bin/env bash

# Adds symlinks for everything in data/ to ~/ and prefixes them with a dot ('.')
# so that dotfiles can be kept updated. Also symlinks selected files in ~/.config.

# This Windows version copies a smaller subset of files as many are ArchLinux specific
# in main bin/symlink script.

existing=`find ~ -maxdepth 1 -type l`

config_files='nvim/init.vim'
main_files='bashrc eslintrc gitignore ignore gitconfig profile ruby-version rubocop.yml tmux.conf vimrc'

remove_existing () {
  for symlink in $existing; do
    rm -f $symlink
  done

  for symlink in $config_files; do
    rm -f ~/.config/$symlink
  done
}

add_current () {
  data_dir=$(dirname "$(readlink -f "$0")")/../data
  echo DATA_DIR=$data_dir
  for file in $main_files; do
    [ -f ~/.$file  ] && mv ~/.$file ~/.$file.orig
    ln -s $data_dir/$file ~/.$file
  done

  mkdir -p ~/.config/nvim
  for file in $config_files; do
    [ -f ~/.config/$file  ] && mv ~/.config/$file ~/.$file.orig
    ln -s $data_dir/config/$file ~/.config/$file
  done
}

remove_existing
add_current
