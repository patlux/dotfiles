# ---------------------------------------------------------------------------- #
#   #FUNCTIONS
# ---------------------------------------------------------------------------- #


# ---------------------------------------------------------------------------- #
# GIT PROMPT

# hide git prompt in home
# https://github.com/robbyrussell/oh-my-zsh/issues/357
# in git repo.:
# $ > git config prompt.hide true


function __git_ps1_hide {
    [ "$(git config prompt.hide)" = "true" ] && return
    echo "$(__git_ps1)" # or whatever you use to display the git prompt
}


# ---------------------------------------------------------------------------- #
# MKCD

# create dir and cd in
# http://superuser.com/questions/152794/is-there-a-shortcut-to-mkdir-foo-and-immediately-cd-into-it
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}


# ---------------------------------------------------------------------------- #
# SWAP - SWITCH 2 FILENAMES AROUND

function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}


# ---------------------------------------------------------------------------- #
## DD with PIPE-VIEWER

ddpv() {
    size=$(stat -c%s $1)
    dd if=$1 &> /dev/null | pv -petrb -s $size | dd of=$2
}


# ---------------------------------------------------------------------------- #
## REMIND ME!!!

# remind me, its important!
# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
function remindme()
{
  sleep $1 && notify-send $2 --icon=dialog-information &
}


# ---------------------------------------------------------------------------- #
## UPLOAD FILE TO transfer.sh

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
