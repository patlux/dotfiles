# ---------------------------------------------------------------------------- #
#   #NVM
# ---------------------------------------------------------------------------- #

alias nr='npm run'

nvm_dir="/usr/share/nvm/"

if [ -d "$nvm_dir" ]; then
  export NVM_SYMLINK_CURRENT=true # create 'current'-symlink to current version
  source "$nvm_dir/init-nvm.sh"
fi
