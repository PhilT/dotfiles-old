#!/usr/bin/env bash

# THIS SCRIPT IS REPEATABLE

# PACKAGES

pac nodejs npm unison postgresql alsa-utils alsa-plugins skype evince ctags phantomjs


# NODE LIBS

sudo npm install -g eslint jsonlint


# POSTGRESQL
psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='phil'" | grep -q 1 || sudo -u postgres -c 'createuser -s phil'
sudo systemctl enable postgresql
sudo systemctl restart postgresql

