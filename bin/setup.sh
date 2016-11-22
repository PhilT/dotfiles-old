#!/usr/bin/env bash

dir=`dirname $0`

$dir/network.sh
ssh-keyscan bitbucket.org -t rsa >> ~/.ssh/known_hosts
$dir/bin_setup.sh
$dir/repos.sh
$dir/xwindows.sh
$dir/ruby.sh
$dir/packages.sh
$dir/aur_packages.sh
$dir/fonts.sh
$dir/bluetooth.sh
$dir/sound.sh
