#
# ~/.bashrc
#

# If not running interactively, do not do anything
[[ $- != *i* ]] && return


# ---------------------------------------------------------------------------- #
# TMUX

[[ -z "$TMUX" ]] && exec tmux


# ---------------------------------------------------------------------------- #
# ENV VARIABLES

export OOO_FORCE_DESKTOP=gnome

#- DEFAULT APPLICATIONS

export TERMINAL="urxvt"
export EDITOR="nano"
export PYTHON=python2

if [ -n "$DISPLAY" ]; then
    export BROWSER="inox"
else
    export BROWSER="links"
fi

#- XDG VARIABLES

export XDG_CONFIG_HOME=~/.config/
export XDG_CACHE_HOME=~/.cache/

#- HOME BINARIES

export HOME_BIN="$HOME/.bin"
export PATH="$HOME_BIN:${PATH}"


#- HISTORY SEARCH

# Avoid duplicates in history
# export HISTCONTROL=ignoredups
# disable logging of lines beginning with a space
# export HISTCONTROL=ignorespace
export HISTCONTROL=ignoreboth


# ---------------------------------------------------------------------------- #
# HOST BASHRC

[ -f ~/.bashrc.$HOSTNAME ] && source ~/.bashrc.$HOSTNAME


# ---------------------------------------------------------------------------- #
# GLOBAL SCRIPTS

for config in ~/.bash/*.sh
  do
    source $config
done
