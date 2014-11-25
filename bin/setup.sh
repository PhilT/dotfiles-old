#!/usr/bin/env bash

export DESKTOP=evm
export LAPTOP=evx
export SERVER=evs

ssh-keyscan -H bitbucket.org | >> ~/.ssh/known_hosts
dir=`dirname $0`

$dir/network.sh
$dir/bin_setup.sh
$dir/vim_plugins.sh
$dir/repos.sh
[[ `hostname` != $SERVER ]] && $dir/xwindows.sh
$dir/packages.sh
$dir/fonts.sh

