# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# - EXPORTS

export HISTCONTROL=ignoreboth
export PATH="/usr/local/bin:$PATH"
export PATH=$HOME/.cargo/bin:$PATH # rust
export PATH=/opt/homebrew/bin:$PATH # brew on apple silicon
export PATH=$PATH:$HOME/.bin # binaries in home folder
export N_PREFIX="$HOME/.bin/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# - ALIAS

alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias mkdir='mkdir -p -v'
alias nano='nano -w -c'
alias ll='ls -lh'

# - JAVA

# JAVA set to java 8
export JAVA_HOME=`/usr/libexec/java_home`
# MacOS Java 10 fix for the android sdk
# export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

# - ANDROID

# export ANDROID_NDK_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/build-tools/27.0.3:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make less the default pager, add some options and enable syntax highlight using source-highlight
LESSPIPE=`which src-hilite-lesspipe.sh`
[ -n "$LESSPIPE" ] && export LESSOPEN="| ${LESSPIPE} %s"
less_options=(
  # If the entire text fits on one screen, just show it and quit. (Be more
  # like "cat" and less like "more".)
  --quit-if-one-screen

  # Do not clear the screen first.
  --no-init

  # Like "smartcase" in Vim: ignore case unless the search pattern is mixed.
  --ignore-case

  # Do not automatically wrap long lines.
  --chop-long-lines

  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS

  # Do not ring the bell when trying to scroll past the end of the buffer.
  --quiet

  # Do not complain when we are on a dumb terminal.
  --dumb
);
export LESS="${less_options[*]}"
export PAGER='less'
export CLICOLOR=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
