#!/bin/env bash

echo defaults.pcm.card 1 | sudo tee /etc/asound.conf >> /dev/null
echo defaults.pcm.device 0 | sudo tee -a /etc/asound.conf >> /dev/null
echo defaults.ctl.card 1 | sudo tee -a /etc/asound.conf >> /dev/null

