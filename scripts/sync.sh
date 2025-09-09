usage() {
  cat <<EOF
Usage: $0 [--work] [-h|--help]

    --work      Skip work-forbidden apps in your Brewfile
    -h, --help  Show this message
EOF
  exit 1
}

WORK_MACHINE=false

echo 'Begin sync...'

echo "\n"

# Parse optional --work flag
while [[ $# -gt 0 ]]; do
  case "$1" in
  --work)
    WORK_MACHINE=true
    shift
    ;;
  -h | --help)
    usage
    ;;
  *)
    echo "Error: unknown option '$1'" >&2
    usage
    ;;
  esac
done

# Install dependencies via brew
echo "Installing dependencies via Brewfile…"
if $WORK_MACHINE; then
  echo "Work machine → Installing work specific dependencies.."
  brew bundle --file="$HOME/scripts/brew/Brewfile.work"
else
  echo "Personal machine → Installing dependencies.."
  brew bundle --file="$HOME/scripts/brew/Brewfile"
fi
echo "Done."

echo "\n"

# Install powerlevel10k theme
source $HOME/scripts/install/install-oh-my-zsh-themes.zsh
installp10k

echo "\n"

# Install zsh plugins
source $HOME/scripts/install/install-oh-my-zsh-plugins.zsh
installplugins

echo "\n"

# Install tpm
source $HOME/scripts/install/install-tmux-tpm.zsh
installtpm

echo "\n"

echo 'Sync complete!'
