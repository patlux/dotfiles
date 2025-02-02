#!/bin/sh

# Sync's changes back to ~/.dotfiles/

# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# the temp directory used, within $DIR
# omit the -p parameter to create a temporal directory in the default location
TMP_DIR=`mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir'`

# check if tmp dir was created
if [[ ! "$TMP_DIR" || ! -d "$TMP_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {
  rm -rf "$TMP_DIR"
  echo "Deleted temp working directory $TMP_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# START -------------------

ROOT_DIR=$HOME

rsync -avR \
  $ROOT_DIR/.zshrc \
  $ROOT_DIR/.gitconfig \
  $TMP_DIR

rsync -avR $ROOT_DIR/Library/LaunchAgents/de.patwoz.KeyRemapping.plist $TMP_DIR
rsync -avR $ROOT_DIR/dev/dwins/.gitconfig $TMP_DIR

rsync -avR $ROOT_DIR/.duplicacy/filters $TMP_DIR
rsync -avR $ROOT_DIR/.duplicacy/preferences $TMP_DIR
rsync -avR $ROOT_DIR/dev/.duplicacy/filters $TMP_DIR
rsync -avR $ROOT_DIR/dev/.duplicacy/preferences $TMP_DIR

rsync -avR $ROOT_DIR/.config/nvim $TMP_DIR

WORK_DIR="${TMP_DIR}${ROOT_DIR}"

rsync -a "$WORK_DIR/" ~/.dotfiles/
