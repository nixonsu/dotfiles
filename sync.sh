echo 'Begin sync...'

# Clearing default settings
echo 'Clearing defaults oh-my-zsh and tmux configurations at root...'
rm -rf $HOME/.oh-my-zsh/custom
rm -rf $HOME/.config/alacritty
rm -rf $HOME/.config/karabiner
rm -rf $HOME/.config/yazi
echo 'Done.'

# Install via brew
source $DEV/zsh/custom/install-with-brew.zsh
installwithbrew

# Create and overwrite symlinks
# WARNING: THIS WILL OVERWRITE EXISTING FILES
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
ln -sf $DEV/vim/.obsidian.vimrc ~/Documents/Obsidian/Vault/.obsidian.vimrc
ln -sf $DEV/git/.gitconfig ~/.gitconfig
ln -sf $DEV/zsh/.zshrc ~/.zshrc
ln -sf $DEV/tmux/.tmux.conf ~/.tmux.conf
ln -sf $DEV/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf $DEV/vim/monokai.vim ~/.vim/colors/monokai.vim
echo 'Done.'

# Install powerlevel10k theme
source $DEV/zsh/custom/install-themes.zsh
installp10k

# Install zsh plugins
source $DEV/zsh/custom/install-plugins.zsh
installplugins

# Install tpm
source $DEV/tmux/install-tpm.zsh 
installtpm

echo 'Sync complete!'

