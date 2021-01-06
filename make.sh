#!/bin/bash

if [ "$ACT_UPDATED" = "" ]; then
  echo "ACT_UPDATED required"
  exit 1
fi

if [ "$ACT_VERSION" = "" ]; then
  echo "ACT_VERSION required"
  exit 1
fi

mkdir -p www
cp template.html www/index.html
sed -i "s/INFO_CLASS/$ACT_UPDATED/" www/index.html
if [ "$ACT_UPDATED" = "yes" ]; then
  sed -i "s/INFO_TEXT/更新了/" www/index.html
else
  sed -i "s/INFO_TEXT/还没有/" www/index.html
fi
sed -i "s/META_VERSION/$ACT_VERSION/" www/index.html
echo "www.actgxlm.com" > www/CNAME
