# Create and overwrite symlinks
# WARNING: THIS WILL OVERWRITE EXISTING FILES
echo 'Creating symlinks...'
# If a custom symlink already exists, skip
if [ ! -L "$HOME/.oh-my-zsh/custom" ]; then
  ln -s "$DEV/oh-my-zsh/custom" "$HOME/.oh-my-zsh/custom"
fi
ln -sf $DEV/dotfiles/.vimrc ~/.vimrc
ln -sf $DEV/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf $DEV/dotfiles/.gitconfig ~/.gitconfig
ln -sf $DEV/dotfiles/.zshrc ~/.zshrc
ln -sf $DEV/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf $DEV/colorschemes/vim/monokai.vim ~/.vim/colors/monokai.vim
echo 'Done.'

# Install powerlevel10k theme
source $DEV/oh-my-zsh/custom/install-themes.zsh
installp10k

# Install zsh plugins
source $DEV/oh-my-zsh/custom/install-plugins.zsh
installplugins

# Install misc via brew
source $DEV/oh-my-zsh/custom/install-with-brew.zsh
installwithbrew

