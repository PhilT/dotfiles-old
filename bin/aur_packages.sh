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
  pac cmake ffmpeg hicolor-icon-theme icu libcec libxbcommon-x11 mpv qt5-base qt5-webengine
  aur makemkv plex-media-server-plexpass plex-media-player
fi

