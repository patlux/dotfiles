#!/bin/bash

DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git clone https://github.com/horst3180/arc-theme --depth 1
cd "arc-theme"

./autogen.sh \
  --disable-transparency \
  --disable-darker \
  --disable-dark \
  --disable-cinnamon \
  --disable-gnome-shell \
  --disable-metacity \
  --disable-unity \
  --disable-xfwm \
  --disable-xfce-notify \
  --prefix=$DIRNAME/.themes/

make install

cd ..

cp -r ./.themes/share/themes/Arc ./.themes/
rm -fr ./arc-theme
rm -fr ./.themes/share/

echo "Done"
