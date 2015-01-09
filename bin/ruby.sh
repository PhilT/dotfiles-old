#!/usr/bin/env bash

# THIS SCRIPT IS REPEATABLE


# RUBY

RUBY_VERSION=2.2.0

aur 'rb' 'rbenv'
aur 'ru' 'ruby-build'
rbenv version | grep $RUBY_VERSION || rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash
gem install mdl ruby-lint

