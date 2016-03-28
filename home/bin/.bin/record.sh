#!/bin/bash
IFS=x+ read w h x y < <(xrectsel)
ffmpeg -f x11grab -s ${w}x$h -i ${DISPLAY}+$x,$y "$@"
