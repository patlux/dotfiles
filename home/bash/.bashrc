#
# ~/.bashrc
#

# If not running interactively, do not do anything
[[ $- != *i* ]] && return


# ---------------------------------------------------------------------------- #
# TMUX

if [[ -z "$TMUX" ]]; then

  # get the id of a deattached session
  ID="$(tmux ls | grep -vm1 attached | cut -d: -f1)"

  if [[ -z "$ID" ]]; then
    # if not available create a new one
    tmux new-session
  else
    # if available attach to it
    tmux attach-session -t "$ID"
  fi

fi



# ---------------------------------------------------------------------------- #
# ENV VARIABLES

export OOO_FORCE_DESKTOP=gnome
export TERMINAL="urxvt"
export EDITOR="nano"
export PYTHON=python2

if [ -n "$DISPLAY" ]; then
    export BROWSER="inox"
else
    export BROWSER="links"
fi

export XDG_CONFIG_HOME=~/.config/
export XDG_CACHE_HOME=~/.cache/

export HOME_BIN="$HOME/.bin"
export PATH="$HOME_BIN:${PATH}"



# ---------------------------------------------------------------------------- #
# HOST BASHRC

[ -f ~/.bashrc.$HOSTNAME ] && source ~/.bashrc.$HOSTNAME



# ---------------------------------------------------------------------------- #
# GLOBAL SCRIPTS

for config in ~/.bash/*.sh
  do
    source $config
done
