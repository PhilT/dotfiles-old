#!/usr/bin/env bash

cd ~
gup bin
cd -

echo "{
  \"dir\": \"c:/data/$WORKSPACE/documents\",
  \"file\": \".passwords.csv\"
}" > ~/.pwconfig.json

