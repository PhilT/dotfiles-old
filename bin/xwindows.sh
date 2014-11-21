#!/usr/bin/env bash

pac xorg-server xorg-server-utils xorg-xinit
pac conky elementary-icon-theme feh gnome-themes-standard lxappearance mesa-vdpau
pac pcmanfm rxvt-unicode slock terminus-font ttf-arphic-uming xautolock xcursor-vanilla-dmz
pac gimp inkscape xsel

sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo cp /etc/conky/conky.conf /etc/conky/conky.conf.original
pac acpi
if [[ `acpi | grep Battery` != '' ]]; then
  ln -s $WORKSPACE/dotfiles/opt/conkyrc_laptop ~/.conkyrc
else
  sudo pacman -Rdd --noconfirm acpi
  ln -s $WORKSPACE/dotfiles/opt/conkyrc_desktop ~/.conkyrc
fi
sudo localectl set-x11-keymap gb

pushd $WORKSPACE
git clone $PUBLIC_GIT/dwm.git
cd dwm
sudo -S make clean install
popd

if [[ `lspci | grep VirtualBox` != '' ]]; then
  pac virtualbox-guest-utils virtualbox-guest-dkms virtualbox-guest-modules
  echo -e 'vboxguest\nvboxsf\nvboxvideo\n' | sudo tee /etc/modules-load.d/virtualbox.conf > /dev/null
  sudo systemctl enable vboxservice dkms
  sudo groupadd vboxusers && sudo gpasswd -a $USER vboxusers
fi

if [[ `lspci | grep VGA | grep Intel` != '' ]]; then
  pac xf86-video-intel xf86-input-synaptics
fi
