#
# ~/.bashrc
#

# If not running interactively, do not do anything
[[ $- != *i* ]] && return


# ---------------------------------------------------------------------------- #
# TMUX (run only on desktop)

if command -v tmux>/dev/null; then
 [ ! "$TERM" = "linux" ] && [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi


# ---------------------------------------------------------------------------- #
# BASH CONFIGURATION

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist


# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

export dotfiles="$HOME/.dotfiles"
export dev="$HOME/Documents/dev"


# ---------------------------------------------------------------------------- #
# ENV VARIABLES

export OOO_FORCE_DESKTOP=gnome

#- DEFAULT APPLICATIONS

export TERMINAL="urxvt"
export EDITOR="nano"
export PYTHON=python2
export DE=mate

if [ -n "$DISPLAY" ]; then
    export BROWSER="inox"
else
    export BROWSER="links"
fi

#- XDG VARIABLES

export XDG_CONFIG_HOME=~/.config/
export XDG_CACHE_HOME=~/.cache/
export XDG_CONFIG_DIR=~/.config/
export XDG_MUSIC_DIR=~/Music/

#- HOME BINARIES

export HOME_BIN="$HOME/.bin"
export PATH="$HOME_BIN:${PATH}"

#- HISTORY

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicates in history
# export HISTCONTROL=ignoredups
# disable logging of lines beginning with a space
# export HISTCONTROL=ignorespace
export HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'


# ---------------------------------------------------------------------------- #
# HOST BASHRC

[ -f ~/.bashrc.$HOSTNAME ] && source ~/.bashrc.$HOSTNAME


# ---------------------------------------------------------------------------- #
# GLOBAL SCRIPTS

for config in ~/.bash/*.sh
  do
    source $config
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
