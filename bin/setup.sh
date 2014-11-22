#!/usr/bin/env bash

DESKTOP=evm
LAPTOP=evx
SERVER=evs

dir=`dirname $0`

$dir/wifi.sh
$dir/bin_setup.sh
$dir/vim_plugins.sh
$dir/repos.sh
[[ `hostname` != $SERVER ]] && $dir/xwindows.sh
$dir/packages.sh
$dir/fonts.sh
