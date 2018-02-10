#!/usr/bin/env bash
source `dirname $0`/config.sh

# If installing in unclean environment and problems occur try removing ~/.gem

if [[ $DEVELOPMENT ]]; then
  [[ ! $RUBY_VERSION ]] && RUBY_VERSION=2.4.1 && RUBY_GLOBAL=true

  cd $HOME/apps
  curl -sL https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz | tar -zx
  cd chruby-0.3.9 && sudo make install

  cd $HOME/apps
  curl -sL https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz | tar -zx
  cd ruby-install-0.6.1 && sudo make install

  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby | grep $RUBY_VERSION || ruby-install ruby $RUBY_VERSION

  $RUBY_GLOBAL && chruby $RUBY_VERSION
  gem install bundler mdl rubocop
fi
