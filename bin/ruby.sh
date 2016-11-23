#!/usr/bin/env bash
source `dirname $0`/config.sh

# THIS SCRIPT IS REPEATABLE

if [[ $DEVELOPMENT ]]; then
  [[ $RUBY_VERSION ]] || (RUBY_VERSION=2.3.1 && RUBY_GLOBAL=true)

  git clone https://github.com/rbenv/rbenv.git ~/apps/rbenv
  cd ~/apps/rbenv && src/configure && make -C src
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  git clone https://github.com/rbenv/ruby-build.git $(rbenv root)/plugins/ruby-build
  git clone https://github.com/ianheggie/rbenv-binstubs.git "$(rbenv root)/plugins/rbenv-binstubs"

  rbenv version | grep $RUBY_VERSION || rbenv install $RUBY_VERSION
  $RUBY_GLOBAL && rbenv global $RUBY_VERSION
  rbenv rehash
  gem install bundler mdl rubocop
fi
