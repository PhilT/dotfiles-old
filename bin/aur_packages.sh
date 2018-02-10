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
  pac cmake ffmpeg hicolor-icon-theme icu libcec libxbcommon-x11 mpv qt5-base qt5-webengine linuxtv-dvb-apps openssl python2 uriparser
  aur prelink
  aur makemkv
  aur plex-media-server-plexpass
  aur libcec3
  aur python-semver
  aur python-patch
  aur python-monotonic
  aur python-fasteners
  aur conan
  aur plex-media-player
  aur tvheadend-git

  sudo usermod -G plex -a $USER

  sudo systemctl daemon-reload
  sudo systemctl restart plexmediaserver.service
fi
