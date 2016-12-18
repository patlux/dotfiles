# ---------------------------------------------------------------------------- #
#   #ALIASES
# ---------------------------------------------------------------------------- #


alias ..='cd ..'
alias cb='cd $OLDPWD'

alias ls='ls --file-type --group-directories-first --color=auto --time-style="+ %F, %T "'
alias ll="ls -lh"
alias l.='ls --group-directories-first -ldh .*'

alias mkdir='mkdir -p -v'
alias du='du -c -h'
alias grep='grep --color=auto'
alias dmesg='dmesg -HL'
alias ping='ping -c 5'
alias nano='nano -w -c'
alias cp='rsync --progress -h -8'

alias recent='find -maxdepth 1 -type f -mtime -1 -printf "%T@-%Tk:%TM - %f\n" | sort -rn | cut -d- -f2-'

# ---------------------------------------------------------------------------- /
# SAFETY FEATURES
# -------------------------------- /

# alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)


# ---------------------------------------------------------------------------- /
# OTHER
# -------------------------------- /

alias alsi='alsi -a'
alias JDownloader='JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ JDownloader'
alias subl='subl3'
