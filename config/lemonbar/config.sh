#!/bin/bash

DIRNAME="$HOME/.config/lemonbar"
source "$DIRNAME/siji-icons.sh"

PANEL_FIFO='/tmp/panel-fifo'
PANEL_PID='/tmp/panel-pid'
CMD_IFS='󠄳'

# read display resolution
read RES_X RES_Y <<< $(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $3, $4}')

BAR_HEIGHT=18
BAR_OFFSET_X=0
BAR_OFFSET_Y=0

COLOR_BRAND="#5294e2"

BAR_UNDERLINE_COLOR="#5294e2"
BAR_UNDERLINE_WIDTH=1
BAR_BACKGROUND_COLOR="#BB3E424D"
BAR_FOREGROUND_COLOR="#ffffff"
BAR_FONT="-*-profont-medium-*-*-*-12-*-*-*-*-*-*-*"
BAR_FONT_ICON="-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1"

ICON_COLOR="$COLOR_BRAND"

