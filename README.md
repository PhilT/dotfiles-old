# Phils dotfiles

Make dotfiles portable. Make setup scripts portable.

## Usage

Removes all symlinks from `~/` and then adds any symlinks to `~/` for each file/folder in `data/` prepended with a dot.

    bin/symlink.sh

## Notes

`xinitrc` will merge `~/.Xoverrides` after `Xresources` if it exists.

