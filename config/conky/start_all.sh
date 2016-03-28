#!/bin/bash
# start all conky-config inside `conkyrc.d`

# to skip nonexistent files
shopt -s nullglob

# ---------------------------------------------------------------------------- #

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

for file in $SCRIPT_DIR/conkyrc.d/*.config; do
  conky -c "$file" &
done

# ---------------------------------------------------------------------------- #

shopt -u nullglob
