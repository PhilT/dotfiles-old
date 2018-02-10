#!/usr/bin/env bash

MACHINE=`hostname`
DESKTOP_VM=evm
LAPTOP=evx
SERVER=evs

if [[ $MACHINE == $DESKTOP_VM ]]; then
  DESKTOP=true
  DEVELOPMENT=true
  APPS=true
elif [[ $MACHINE == $LAPTOP ]]; then
  DESKTOP=true
  SOUND=true
  DEVELOPMENT=true
  BLUETOOTH=true
  BT_MOUSE=true
elif [[ $MACHINE == $SERVER ]]; then
  DESKTOP=true
  MEDIA_SERVER=true
  SOUND=true
  APPS=true
  BLUETOOTH=true
else
  echo 'Machine (hostname) not recognised.'
  echo 'Did you forget to update config.sh or arch_installer/install.sh?'
  exit 1
fi

