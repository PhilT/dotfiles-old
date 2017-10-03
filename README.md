# Phils dotfiles

Make dotfiles portable. Make setup scripts portable (for ArchLinux). Try to make them repeatable.

Has worked on Archlinux, OSX and currently running on Ubuntu on Windows.

## Usage

Full installation for desired system (uses hostname to determine config to use):

    bin/setup.sh


Removes all symlinks/files from `~/` and then adds any symlinks to
`~/` for each file/folder in `data/` prepended with a dot.

    bin/symlink.sh

## Notes

`xinitrc` will merge `~/.Xoverrides` after `Xresources` if it exists.
