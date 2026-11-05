#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
if [[ "$(uname -s)" != Linux || ! -r /etc/os-release ]]; then
  echo 'This branch targets Ubuntu 24.04 or newer.' >&2
  exit 1
fi
. /etc/os-release
if [[ "$ID" != ubuntu || "${VERSION_ID%%.*}" -lt 24 ]]; then
  echo 'This branch targets Ubuntu 24.04 or newer.' >&2
  exit 1
fi
if [[ $EUID -eq 0 ]]; then
  echo 'Run as your normal login user; sudo is used only for system packages.' >&2
  exit 1
fi

STOW_PACKAGES=(zsh alacritty editorconfig gh git nvim p10k rg tmux vim)
cd "$DOTFILES"
sudo apt-get update
sudo apt-get install -y ca-certificates curl git git-lfs zsh stow tmux \
  build-essential pkg-config unzip xz-utils sqlite3 fontconfig
if [[ "${DOTFILES_HEADLESS:-0}" != 1 ]]; then
  sudo apt-get install -y alacritty xdg-utils xclip wl-clipboard
fi

# Refuse existing file conflicts before downloading the user toolchain.
stow --simulate --target="$HOME" "${STOW_PACKAGES[@]}"

# Use the official Nix installer; it selects the appropriate installation mode.
# Systemd hosts normally use the multi-user daemon. Existing installations are reused.
scratch="$(mktemp -d)"
trap 'rm -rf "$scratch"' EXIT
activate_nix() {
  local profile
  for profile in /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh "$HOME/.nix-profile/etc/profile.d/nix.sh"; do
    if [[ -r "$profile" ]]; then
      set +u
      # shellcheck source=/dev/null
      . "$profile"
      set -u
      break
    fi
  done
  export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"
}
activate_nix
if ! command -v nix-env >/dev/null 2>&1; then
  curl -fsSL https://nixos.org/nix/install -o "$scratch/install-nix"
  sh "$scratch/install-nix"
  activate_nix
fi
command -v nix-env >/dev/null || { echo 'Nix is not active; open a new terminal and rerun.' >&2; exit 1; }

# Pin one Nixpkgs revision so all CLI tools come from the same package set.
NIXPKGS_REVISION="$(cat "$DOTFILES/nixpkgs-revision")"
[[ "$NIXPKGS_REVISION" =~ ^[0-9a-f]{40}$ ]] || { echo 'Invalid Nixpkgs revision' >&2; exit 1; }
nix-env -f "https://github.com/NixOS/nixpkgs/archive/$NIXPKGS_REVISION.tar.gz" -iA \
  btop gh gitleaks tmux delta diff-so-fancy lazygit lazydocker fd ripgrep fzf \
  k9s pgweb nodejs yarn uv stow tree neovim nerd-fonts.jetbrains-mono
export PATH="$HOME/.nix-profile/bin:$HOME/.local/bin:$PATH"
hash -r
nvim --headless -u NONE -i NONE '+lua if vim.fn.has("nvim-0.12") == 0 then vim.cmd("cquit 1") end' +qa

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  had_zshrc=0
  if [[ -e "$HOME/.zshrc" || -L "$HOME/.zshrc" ]]; then
    had_zshrc=1
  fi
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o "$scratch/install-omz"
  sh "$scratch/install-omz" --unattended --keep-zshrc
  # Even --keep-zshrc generates a default when no file existed. Move only that
  # newly generated file aside so Stow can install our configuration.
  if [[ "$had_zshrc" == 0 && -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$scratch/omz-zshrc"
  fi
fi
clone_if_missing() {
  if [[ ! -d "$2" ]]; then
    git clone --depth=1 "$1" "$2"
  fi
}
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
clone_if_missing https://github.com/Aloxaf/fzf-tab "$HOME/.oh-my-zsh/custom/plugins/fzf-tab"
clone_if_missing https://github.com/agkozak/zsh-z "$HOME/.oh-my-zsh/custom/plugins/zsh-z"
clone_if_missing https://github.com/romkatv/powerlevel10k "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# Link files rather than folding directories shared with generated plugin files.
stow --no-folding --target="$HOME" "${STOW_PACKAGES[@]}"
clone_if_missing https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
mkdir -p "$HOME/.local/share/fonts"
if [[ ! -e "$HOME/.local/share/fonts/nix-dotfiles" && ! -L "$HOME/.local/share/fonts/nix-dotfiles" ]]; then
  ln -s "$HOME/.nix-profile/share/fonts" "$HOME/.local/share/fonts/nix-dotfiles"
fi
fc-cache -f "$HOME/.local/share/fonts"
git config --local core.hooksPath ./git-hooks
if [[ "${SHELL:-}" != /usr/bin/zsh ]]; then
  chsh -s /usr/bin/zsh
fi
printf '\nInstalled. Log out and back in, then install tmux plugins with Ctrl+Space, Shift+I.\n'
