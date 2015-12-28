#!/bin/env bash
source `dirname $0`/config.sh

if [[ $SOUND ]]; then
  pac alsa-utils alsa-plugins

  echo defaults.pcm.card 1 | sudo tee /etc/asound.conf >> /dev/null
  echo defaults.pcm.device 0 | sudo tee -a /etc/asound.conf >> /dev/null
  echo defaults.ctl.card 1 | sudo tee -a /etc/asound.conf >> /dev/null
fi

