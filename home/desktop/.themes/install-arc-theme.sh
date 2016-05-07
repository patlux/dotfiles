#!/bin/bash

DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git clone https://github.com/horst3180/arc-theme --depth 1 $DIRNAME/arc-theme

$DIRNAME/arc-theme/autogen.sh \
  --disable-transparency \
  --disable-darker \
  --disable-dark \
  --disable-cinnamon \
  --disable-gnome-shell \
  --disable-metacity \
  --disable-unity \
  --disable-xfwm \
  --disable-xfce-notify \
  --prefix=$DIRNAME/

make install

cp -r $DIRNAME/share/themes/Arc $DIRNAME/
rm -fr $DIRNAME/arc-theme
rm -fr $DIRNAME/share/

echo "Done"
