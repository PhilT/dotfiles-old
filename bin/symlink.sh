#!/usr/bin/env bash

# Adds symlinks for everything in data/ to ~/ and prefixes them with a dot ('.')

existing=`find ~ -maxdepth 1 -type l`
current=`ls data`

remove_existing () {
  for symlink in $existing; do
    rm -f $symlink
  done
}

add_current () {
  for file in $current; do
    ln -s `pwd`/data/$file ~/.$file
  done
}

remove_existing
add_current

