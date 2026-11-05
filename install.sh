#!/usr/bin/env bash

# Install the development environment and link packages with GNU Stow.

set -euox pipefail
IFS=$'\n\t'

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo 'This installer supports macOS only. Use the linux branch for Ubuntu.' >&2
  exit 1
fi
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Install macOS packages with Homebrew.
brew install \
	tmux \
	git-delta \
	gitleaks \
	lazygit \
	lazydocker \
	fd \
	ripgrep \
	fzf \
	k9s \
	pgweb \
	nvm \
	yarn \
	uv \
	stow \
	tree \
	gh \
	neovim

brew install --cask \
	obsidian \
	karabiner-elements \
	scroll-reverser \
	font-jetbrains-mono-nerd-font

# Install oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh plugins
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/fzf-tab" ]]; then
  git clone https://github.com/Aloxaf/fzf-tab "$HOME/.oh-my-zsh/custom/plugins/fzf-tab"
fi
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-z" ]]; then
  git clone https://github.com/agkozak/zsh-z "$HOME/.oh-my-zsh/custom/plugins/zsh-z"
fi

# Install Powerlevel10k theme
if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi


# Step 2:
## (optional) Create a single-source of truth for your dotfiles
## by deleting files that exist or cause conflicts as the contents
## of these files should be managed instead in your dotfiles.
## rm -f ~/.bash_profile

# Step 3:
## Personalize your home directory configuring using `stow`
## https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html

# Existing conflicting files must be backed up and moved before stowing.

# Stow packages
STOW_PACKAGES=(
  zsh
  alacritty
  editorconfig
  gh
  git
  karabiner
  nvim
  p10k
  rg
  tmux
  vim
)

cd "$DOTFILES"
stow --simulate -t "$HOME" "${STOW_PACKAGES[@]}"
stow -t "$HOME" "${STOW_PACKAGES[@]}"

# Step 4:
## Configure gitleaks to scan this dotfiles repo before every push.
## This prevents accidental secret commits to your dotfiles.
git config core.hooksPath ./git-hooks

# Install the tmux plugin manager; install plugins with prefix + I in tmux.
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Step 5:
# Set zsh as default shell
chsh -s /bin/zsh

