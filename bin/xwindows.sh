#!/usr/bin/env bash

pac xorg-server xorg-server-utils xorg-xinit
pac conky elementary-icon-theme feh gnome-themes-standard lxappearance mesa-vdpau
pac pcmanfm rxvt-unicode slock terminus-font ttf-arphic-uming xautolock xcursor-vanilla-dmz
pac gimp inkscape xsel
sudo ln -s ../conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo cp /etc/conky/conky.conf /etc/conky/conky.conf.original
echo 'out_to_console yes
out_to_x no
background no
update_interval 5
total_run_times 0
use_spacer none

TEXT
${cpu cpu1}% ${cpu cpu2}% ${cpu cpu3}% ${cpu cpu4}% | $memperc% ($mem) | ${time %Y-%m-%d %H:%M}
' | sudo tee /etc/conky/conky.conf > /dev/null

pushd $WORKSPACE
git clone $PUBLIC_GIT/dwm.git
cd dwm
sudo -S make clean install
popd

if [[ ! $(lspci | grep -q VirtualBox) ]]; then
  pac virtualbox-guest-utils virtualbox-guest-dkms virtualbox-guest-modules
  echo -e 'vboxguest\nvboxsf\nvboxvideo\n' | sudo tee /etc/modules-load.d/virtualbox.conf > /dev/null
  sudo systemctl enable vboxservice dkms
  sudo groupadd vboxusers && sudo gpasswd -a $USER vboxusers
fi
