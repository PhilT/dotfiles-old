#!/usr/bin/env bash

# THIS SCRIPT IS REPEATABLE

pac bluez bluez-utils expect
sudo systemctl enable bluetooth
sudo systemctl restart bluetooth

