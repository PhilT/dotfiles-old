#!/usr/bin/env bash

dir=`dirname $0`

$dir/network.sh
ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts # not repeatable
$dir/bin_setup.sh
$dir/repos.sh
$dir/xwindows.sh
$dir/ruby.sh
$dir/packages.sh
$dir/fonts.sh
$dir/bluetooth.sh
$dir/sound.sh
