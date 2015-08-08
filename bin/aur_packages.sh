#!/usr/bin/env bash

# THIS SCRIPT IS REPEATABLE


# CHROME and CLIPBOARD
if [[ `pacman -Q xorg-server 2>/dev/null` != '' ]]; then
  aur google-chrome
  aur urxvt-clipboard
fi

# HEROKU
aur heroku-client-standalone

# RESIZE FONTS IN URXVT
aur urxvt-font-size-git

# makemkv
[[ `hostname` == $SERVER ]] && aur makemkv-cli

