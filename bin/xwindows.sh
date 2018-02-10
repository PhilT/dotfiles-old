#!/usr/bin/env bash
source `dirname $0`/config.sh

if [[ $DESKTOP ]]; then
  sudo pacman -Syy
  pac xorg-server xorg-server-utils xorg-xinit
  pac conky elementary-icon-theme feh gnome-themes-standard lxappearance mesa-vdpau
  pac pcmanfm slock terminus-font ttf-arphic-uming xautolock xcursor-vanilla-dmz
  pac xsel xbindkeys

  # material design GTK+ theme
  aur ttf-roboto
  aur adapta-gtk-theme
  aur archdroid-icon-theme

  [[ $APPS ]] && pac gimp inkscape


  sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
  sudo mkdir -p /etc/conky
  [ -f /etc/conky/conky.conf ] && sudo cp /etc/conky/conky.conf /etc/conky/conky.conf.original
  pac acpi
  if [[ `acpi | grep Battery` != '' ]]; then
    sudo ln -sf $WORKSPACE/dotfiles/opt/conkyrc_laptop /etc/conky/conky.conf
  else
    sudo pacman -Rdd --noconfirm acpi
    sudo ln -sf $WORKSPACE/dotfiles/opt/conkyrc_desktop /etc/conky/conky.conf
  fi
  sudo localectl set-x11-keymap gb

  pushd $WORKSPACE

  # Fork of DWM - suckless Dynamic Window Manager
  gup dwm
  cd dwm
  sudo -S make clean install
  cd -

  # Simple Terminal
  sudo sed -i 's/.*: delete-char/"\\e[P": delete-char/' /etc/inputrc # fix delete key in ST
  gup st
  cd st
  sudo -S make clean install

  popd

  # Install VirtualBox guest modules if on a VM
  if [[ `lspci | grep VirtualBox` != '' ]]; then
    pac virtualbox-guest-utils virtualbox-guest-dkms linux-headers
    echo -e 'vboxguest\nvboxsf\nvboxvideo\n' | sudo tee /etc/modules-load.d/virtualbox.conf > /dev/null
    sudo systemctl enable vboxservice dkms
    sudo groupadd vboxusers && sudo gpasswd -a $USER vboxusers
  fi

  if [[ `lspci | grep VGA | grep Intel` != '' ]]; then
    pac xf86-video-intel xf86-input-synaptics
  fi

  sudo chmod u+s /usr/bin/xinit
fi
