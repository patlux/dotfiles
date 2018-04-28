# ---------------------------------------------------------------------------- #
#   #MPW ( masterpasswordapp.com )
# ---------------------------------------------------------------------------- #

mpw_dir="$HOME/.mpw.d"

if [ -d "$mpw_dir" ]; then
  _copy() {
    if hash xclip 2>/dev/null; then
      xclip -selection clipboard
    else
      cat; echo 2>/dev/null
      return
    fi
    echo >&2 "Copied!"
  }

  mpw() {
    # Empty the clipboard
    :| _copy 2>/dev/null

    # Ask for the user's name and password if not yet known.
    # MP_FULLNAME=${MP_FULLNAME:-$(ask 'Your Full Name:')}

    # Start Master Password and copy the output.
    printf %s "$(MP_FULLNAME=$MP_FULLNAME command mpw "$@")" | _copy
  }

  # [[ -r $mpw_dir/mpw.completion.bash ]] && . $mpw_dir/mpw.completion.bash
fi
