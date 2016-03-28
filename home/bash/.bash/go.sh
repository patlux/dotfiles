# ---------------------------------------------------------------------------- #
#   #GOLANG ENVIRONMENT
# ---------------------------------------------------------------------------- #

golang_dir="${HOME}/Documents/dev/go"

if [ -d "$golang_dir" ]; then
  export GOPATH=$golang_dir
  export PATH="${PATH}:${GOPATH//://bin:}/bin"
fi
