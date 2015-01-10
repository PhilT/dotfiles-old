#!/usr/bin/env bash

# THIS SCRIPT IS REPEATABLE


# CHROME and CLIPBOARD

if [[ `pacman -Q xorg-server 2>/dev/null` != '' ]]; then
  aur 'go' 'google-chrome'
  aur 'ur' 'urxvt-clipboard'
fi

# HEROKU

aur 'he' 'heroku-client-standalone'

