#!/usr/bin/env bash
source `dirname $0`/config.sh

cd ~
gup bin
cd -

echo "{
  \"dir\": \"c:/data/$WORKSPACE/documents\",
  \"file\": \".passwords.csv\"
}" > ~/.pwconfig.json
