# Phils dotfiles

A simple repo for storing and symlinking my dotfiles to make them portable.

## Usage

Removes all symlinks from ~ and then adds any symlinks to ~ for each file/folder in data/ prepended with a dot.

    bin/sync.sh

## TODO

Improve sync script to update symlinks rather than delete and recreate them all.
