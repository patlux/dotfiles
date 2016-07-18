# ---------------------------------------------------------------------------- #
#   #PROMPT (WITH GIT)
# ---------------------------------------------------------------------------- #

[[ -f /usr/share/doc/pkgfile/command-not-found.bash ]]  && source /usr/share/doc/pkgfile/command-not-found.bash

set_prompt() {
  local last_command=$?
  reset_color='\[\e[0m\]'

  PS1=''

  # reset color
  PS1+=$reset_color

  # --------------
  # DISPLAY CURRENT DIR

  # add "["
  PS1+=''

  # blue
  PS1+='\[\e[0;34m\]'

  # current dir
  PS1+='\W'

  # --------------
  # GIT BRANCH

  # cyan
  PS1+='\[\e[1;36m\]'

  # git current branch -> git function in .bash_functions
  PS1+='$(__git_ps1_hide " %s")'

  # reset color
  PS1+=$reset_color

  # add "]"
  PS1+=''

  # --------------
  # END

  PS1+=' '
}

PROMPT_COMMAND='set_prompt'

# PS1='\[\e[1;32m\]\[\e[0m\][\[\e[0;34m\]\W\[\e[1;36m\]$(__git_ps1_hide " (%s)")\[\e[0m\]] # '
