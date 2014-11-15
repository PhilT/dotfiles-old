#!/usr/bin/env bash

cd ~/bin
gup bin
cd -

echo "{
  \"dir\": \"c:/data/$WORKSPACE/documents\",
  \"file\": \".passwords.csv\"
}" > ~/.pwconfig.json
