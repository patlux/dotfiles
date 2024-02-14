#!/bin/sh

set -e # stop on error

cd /Users/patwoz/dev
echo "`date`" Backing up $PWD ...
/opt/homebrew/bin/duplicacy -log backup -stats
echo "`date`" Stopped backing up $PWD ...

curl -m 10 --retry 5 https://hc-ping.com/afb3d3a4-9e72-4b1d-baf0-cb88e60b5bb2
