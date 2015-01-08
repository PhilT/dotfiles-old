#!/usr/bin/env bash

# THIS SCRIPT IS REPEATABLE

cd ~
gup bin
cd -

echo "{
  \"dir\": \"c:/data/$WORKSPACE/documents\",
  \"file\": \".passwords.csv\"
}" > ~/.pwconfig.json

