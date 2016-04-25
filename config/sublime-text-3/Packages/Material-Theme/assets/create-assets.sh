#!/bin/bash

SRC_NAME="accent-blue"
SRC_COLOR="#2979ff"

DST_NAME="accent-arc"
DST_COLOR="#5294e2"

[[ -d "$DST_NAME" ]] && rm -fr "$DST_NAME"

mkdir -p $DST_NAME
cp -r $SRC_NAME/* $DST_NAME

parallel \
  convert \
  "{} -fuzz 50% -fill '$DST_COLOR' -opaque '$SRC_COLOR' PNG32:{.}.png" \
  ::: \
  $DST_NAME/*.png
