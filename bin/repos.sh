#!/usr/bin/env bash
source `dirname $0`/config.sh

if [[ $DEVELOPMENT ]]; then
  cd $WORKSPACE
  gup documents --private
  gup condensd --private
  gup velocity --private

  gup arch_installer
  gup canvas_experiment
  gup canvas_starfield
  gup jlue
  gup minifake
  gup spikes
  gup tigen

  cd -
fi

