#!/bin/bash

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --remove $(which node)
sudo codesign --force --sign - $(which node)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add $(which node)

