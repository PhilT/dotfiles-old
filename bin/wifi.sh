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
" > /etc/netctl/$wl-router

  echo "Interface=$wl
Connection=wireless
Security=wpa
ESSID=evmob
IP=dhcp
Key=$evmob_password
" > /etc/netctl/$wl-evmob
fi

