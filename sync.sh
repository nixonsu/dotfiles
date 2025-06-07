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

# Clear default settings
echo 'Clearing defaults oh-my-zsh and tmux configurations at root...'
rm -rf $HOME/.oh-my-zsh/custom
rm -rf $HOME/.config/alacritty
rm -rf $HOME/.config/karabiner
rm -rf $HOME/.config/yazi
rm -rf $HOME/.config/nvim
echo 'Done.'

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
  brew bundle --file="${DEV}/Brewfile.work"
else
  echo "Personal machine → Installing dependencies.."
  brew bundle --file="${DEV}/Brewfile"
fi
echo "Done."

echo "\n"

# Create and overwrite symlinks
echo 'Creating symlinks...'
# If a custom symlink already exists, skip
if [ ! -L "$HOME/.oh-my-zsh/custom" ]; then
  ln -s "$DEV/zsh/custom" "$HOME/.oh-my-zsh/custom"
fi
if [ ! -L "$HOME/.tmux/plugins/tpm" ] && [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  mkdir -p "$HOME/.tmux/plugins"
  ln -s "$DEV/tmux/plugins/tpm" "$HOME/.tmux/plugins/tpm"
fi
if [ ! -L "$HOME/.config/nvim" ] && [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p "$HOME/.config"
  ln -s "$DEV/nvim" "$HOME/.config/nvim"
fi
if [ ! -L "$HOME/.config/alacritty" ] && [ ! -d "$HOME/.config/alacritty" ]; then
  mkdir -p "$HOME/.config"
  ln -s "$DEV/alacritty" "$HOME/.config/alacritty"
fi
if [ ! -L "$HOME/.config/karabiner" ] && [ ! -d "$HOME/.config/karabiner" ]; then
  mkdir -p "$HOME/.config"
  ln -s "$DEV/karabiner" "$HOME/.config/karabiner"
fi
if [ ! -L "$HOME/.config/yazi" ] && [ ! -d "$HOME/.config/yazi" ]; then
  mkdir -p "$HOME/.config"
  ln -s "$DEV/yazi" "$HOME/.config/yazi"
fi

ln -sf $DEV/vim/.vimrc ~/.vimrc
ln -sf $DEV/vim/.ideavimrc ~/.ideavimrc
ln -sf $DEV/vim/.obsidian.vimrc ~/Dropbox/Obsidian/Vault/.obsidian.vimrc
ln -sf $DEV/git/.gitconfig ~/.gitconfig
ln -sf $DEV/zsh/.zshrc ~/.zshrc
ln -sf $DEV/tmux/.tmux.conf ~/.tmux.conf
ln -sf $DEV/zsh/.p10k.zsh ~/.p10k.zsh
echo 'Done.'

echo "\n"

# Install powerlevel10k theme
source $DEV/zsh/custom/install-themes.zsh
installp10k

echo "\n"

# Install zsh plugins
source $DEV/zsh/custom/install-plugins.zsh
installplugins

echo "\n"

# Install tpm
source $DEV/tmux/install-tpm.zsh
installtpm

echo "\n"

echo 'Sync complete!'
