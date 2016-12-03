#!/usr/bin/env bash
source `dirname $0`/config.sh

if [[ $DEVELOPMENT ]]; then
  [[ ! $RUBY_VERSION ]] && RUBY_VERSION=2.3.3 && RUBY_GLOBAL=true

  rbenv_dir=$HOME/apps/rbenv
  gup rbenv rbenv $rbenv_dir
  cd $rbenv_dir && src/configure && make -C src
  export PATH="$rbenv_dir/bin:$PATH"
  eval "$(rbenv init -)"

  gup ruby-build rbenv $(rbenv root)/plugins/ruby-build
  gup rbenv-binstubs ianheggie "$(rbenv root)/plugins/rbenv-binstubs"

  rbenv version | grep $RUBY_VERSION || rbenv install $RUBY_VERSION
  $RUBY_GLOBAL && rbenv global $RUBY_VERSION
  rbenv rehash
  gem install bundler mdl rubocop
fi
