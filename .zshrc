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

# PATH 

export PATH=$HOME/.bin:$PATH # custom binaries in home folder
export PATH=$HOME/.bin/n/bin:$PATH # node 
export PATH=$HOME/.cargo/bin:$PATH # rust
export PATH=$(ruby -e "puts Gem.user_dir")/bin:$PATH # rubygems
export PATH=/opt/homebrew/bin:$PATH # brew on apple silicon
export PATH="/usr/local/bin:$PATH"

# DEFAULTS 

alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias mkdir='mkdir -p -v'
alias nano='nano -w -c'
alias ll='ls -lh'
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export EDITOR='vim'
alias vim='nvim'
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# JAVA

export JAVA_HOME=`/usr/libexec/java_home`

# ANDROID

# export ANDROID_NDK_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/build-tools/27.0.3:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH

# BASH 

export HISTCONTROL=ignoreboth

# CUSTOM

fpath=( $HOME/.config/custom/zshfn "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
