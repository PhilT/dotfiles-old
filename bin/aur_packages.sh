#!/usr/bin/env bash
source `dirname $0`/config.sh

# THIS SCRIPT IS REPEATABLE


if [[ $DESKTOP ]]; then
  aur google-chrome
  aur urxvt-clipboard

  # RESIZE FONTS IN URXVT
  aur urxvt-font-size-git
fi

if [[ $MEDIA_SERVER ]]; then
  aur makemkv plex-media-server plex-media-player
fi

