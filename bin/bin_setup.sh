#!/usr/bin/env bash

git clone $PUBLIC_GIT/bin.git ~/bin

echo "{
  \"dir\": \"c:/data/$WORKSPACE/documents\",
  \"file\": \".passwords.csv\"
}" > ~/.pwconfig.json
