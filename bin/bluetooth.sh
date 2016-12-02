#!/usr/bin/env bash
source `dirname $0`/config.sh

if [[ $BLUETOOTH ]]; then
  pac bluez bluez-utils expect
  sudo systemctl enable bluetooth
  sudo systemctl restart bluetooth

  echo ACTION=="add", KERNEL=="hci0", RUN+="/usr/bin/hciconfig hci0 up" | tee -a sudo /etc/udev/rules.d/10-local.rules >> /dev/null

  `dirname $0`/pair_mouse.exp
fi
