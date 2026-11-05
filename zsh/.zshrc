# Powerlevel10k instant prompt stays near the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keep Nix tools available in interactive and login shells, including inside tmux.
if [[ -r /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
  source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
elif [[ -r "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi
typeset -U path
path=("$HOME/.local/bin" "$HOME/.nix-profile/bin" $path)

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab zsh-z)
source "$ZSH/oh-my-zsh.sh"
[[ ! -r ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -v
KEYTIMEOUT=1
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN=1
export SDKMAN_DIR="$HOME/.sdkman"
[[ ! -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] || source "$SDKMAN_DIR/bin/sdkman-init.sh"

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi
