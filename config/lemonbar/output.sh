#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"


# ---------------------------------------------------------------------------- #
# FIFO

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"


# ---------------------------------------------------------------------------- #
# PID

[ -e "$PANEL_PID" ] && pkill -P $(cat "$PANEL_PID")
echo $$ >"$PANEL_PID"


# ---------------------------------------------------------------------------- #
# INITIALIZE BLOCKS

declare -A blocks
for block in $DIRNAME/blocks/*.sh ; do
  $block "$@" > "$PANEL_FIFO" &
done


# ---------------------------------------------------------------------------- #
# MAIN LOOP

while IFS='' read -r cmd; do
  IFS="$CMD_IFS" read -ra infos <<< "$cmd"
  blocks[${infos[0]}]="${infos[1]}"

  # INITIALIZE OUTPUT

  output=""


  # -------------------------------------------------------------------------- #
  # LEFT

  output+="%{l}"
  output+=" ${blocks[kernel]}"
  output+=" ${blocks[pacupdates]}"

  # -------------------------------------------------------------------------- #
  # CENTER

  output+="%{c}"
  output+="${blocks[weather]}"


  # -------------------------------------------------------------------------- #
  # RIGHT

  output+="%{r}"
  # output+="$(SysInfos)"
  output+="${blocks[vpn]}"
  output+="  ${blocks[cpu]}"
  output+="  ${blocks[ram]}"
  output+="  ${blocks[volume]}"
  output+="  ${blocks[clock]}"


  # -------------------------------------------------------------------------- #
  # PIPE TO LEMONBAR

  echo -e "$output"

done < "$PANEL_FIFO" \
  | lemonbar \
    -g "$RES_X"x"$BAR_HEIGHT"+"$BAR_OFFSET_X"+"$BAR_OFFSET_X" \
    -B "$BAR_BACKGROUND_COLOR" \
    -F "$BAR_FOREGROUND_COLOR" \
    -f "$BAR_FONT_ICON" \
    -f "$BAR_FONT" \
    -u $BAR_UNDERLINE_WIDTH \
    -U "$BAR_UNDERLINE_COLOR" \
    -n "dock" \
    -p \
  | bash

wait
