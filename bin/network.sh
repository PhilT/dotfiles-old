#!/usr/bin/env bash

wl=`ls /sys/class/net | grep wl`

if [[ $wl != '' ]]; then
  echo Enter WIFI password for 'router':
  read router_password

  echo Enter WIFI password for 'evmob':
  read evmob_password

  echo "Interface=$wl
Connection=wireless
Security=wpa
ESSID=router
IP=dhcp
Key=$router_password
" | sudo tee /etc/netctl/$wl-router > /dev/null

  echo "Interface=$wl
Connection=wireless
Security=wpa
ESSID=evmob
IP=dhcp
Key=$evmob_password
" | sudo tee /etc/netctl/$wl-evmob > /dev/null
sudo systemctl enable netctl-auto@${wl}.service
fi

en=`ls /sys/class/net | grep en`

if [[ $en != '' ]]; then
  echo "Interface=$en
Connection=ethernet
IP=dhcp
" | sudo tee /etc/netctl/$en > /dev/null
sudo systemctl enable netctl-ifplugd@${en}.service
fi

sudo systemctl enable netctl.service

