#!/bin/env bash
source `dirname $0`/config.sh

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
URL="https://www.archlinux.org/mirrorlist/?country=GB&protocol=http&ip_version=4&use_mirror_status=on"
curl -s $URL | sudo sed 's/^#Server/Server/w /etc/pacman.d/mirrorlist'
sudo pacman -Syy
