# ---------------------------------------------------------------------------- #
#   #RVM
# ---------------------------------------------------------------------------- #

rvm_dir="$HOME/.rvm"
if [ -d "$rvm_dir" ]; then
  # export PATH="$PATH:$rvm_dir/bin" # Add RVM to PATH for scripting
  [[ -s "$rvm_dir/scripts/rvm" ]] && source "$rvm_dir/scripts/rvm"
  [[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
  export rvm_ignore_gemrc_issues=1 # ignore warning /etc/gemrc
fi
