#!/usr/bin/env bash
source `dirname $0`/config.sh

# THIS SCRIPT IS REPEATABLE

if [[ $DEVELOPMENT ]]; then
  [[ $RUBY_VERSION ]] || (RUBY_VERSION=2.3.1 && RUBY_GLOBAL=true)

  aur 'rbenv'
  aur 'ruby-build'
  rbenv version | grep $RUBY_VERSION || rbenv install $RUBY_VERSION
  $RUBY_GLOBAL && rbenv global $RUBY_VERSION
  rbenv rehash
  gem install mdl ruby-lint
  gem install bundler
fi
