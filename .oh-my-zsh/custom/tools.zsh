# Activate python virtual env with name .venv
uva() {
    local venv_name=${1:-'.venv'}
    venv_name=${venv_name//\//} # remove trailing slashes (Linux)
    venv_name=${venv_name//\\/} # remove trailing slashes (Windows)

    local venv_bin=
    if [[ -d ${WINDIR} ]]; then
        venv_bin='Scripts/activate'
    else
        venv_bin='bin/activate'
    fi

    local activator="${venv_name}/${venv_bin}"

    if [[ ! -f ${activator} ]]; then
        echo "[ERROR] Python virtual environment not found with name: ${venv_name}"
        return
    fi

    # shellcheck disable=SC1090
    . "${activator}"
    echo "[INFO] Activated Python virtual environment: ${venv_name} (via ${activator})"
}

# Usage: Given ./directory/plugins/temp -> Then `ccd d p t` ends up in temp
ccd() {
  local path="."
  for part in "$@"; do
    local dirs=($path/${part}*/)
    if (( ${#dirs[@]} == 0 )); then
      echo "No match for $part"
      return 1
    fi
    path="${dirs[1]%/}"
  done
  cd "$path"
}
