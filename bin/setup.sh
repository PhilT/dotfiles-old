#!/usr/bin/env bash

export DESKTOP=evm
export LAPTOP=evx
export SERVER=evs

dir=`dirname $0`

$dir/network.sh
ssh-keyscan bitbucket.org -t rsa >> ~/.ssh/known_hosts
$dir/bin_setup.sh
$dir/vim_plugins.sh
$dir/repos.sh
[[ `hostname` != $SERVER ]] && $dir/xwindows.sh
$dir/ruby.sh
$dir/packages.sh
$dir/aur_packages.sh
$dir/fonts.sh

