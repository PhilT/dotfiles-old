#!/usr/bin/env bash
source `dirname $0`/config.sh

wl=`ls /sys/class/net | grep wl`

if [[ $wl != '' ]]; then
  echo Enter WIFI password for 'router':
  read router_password

  echo Enter WIFI password for 'mev':
  read mobile_password

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
ESSID=mev
IP=dhcp
Key=$mobile_password
" | sudo tee /etc/netctl/$wl-mev > /dev/null
  sudo systemctl enable netctl-auto@${wl}.service
  sudo systemctl start  netctl-auto@${wl}.service
fi

en=`ls /sys/class/net | grep en`

if [[ $en != '' ]]; then
  echo "Interface=$en
Connection=ethernet
IP=dhcp
" | sudo tee /etc/netctl/$en > /dev/null
  sudo systemctl enable netctl-ifplugd@${en}.service
  sudo systemctl start  netctl-ifplugd@${en}.service
fi

sudo systemctl enable netctl.service
sudo systemctl start  netctl.service


echo -n Waiting for network to come up..
for i in {1..20}; do
  ip a | grep -q 192.168.1
  [ $? -eq 0 ] && break
  echo -n .
  sleep 1
done
echo ''

ip a | grep -q 192.168.1
if [ $? -eq 0 ]; then
  echo Network up.
else
  echo Network timeout
  exit 1
fi

