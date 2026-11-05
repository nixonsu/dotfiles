# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable oh-my-zsh (plugins, aliases etc)
# ZSH_THEME and plugins must be set before sourcing oh-my-zsh.sh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab zsh-z)
source $ZSH/oh-my-zsh.sh

# Enable Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable vi mode in shell
bindkey -v
KEYTIMEOUT=1

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Platform specific
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
	export CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN=1
	export SDKMAN_DIR="$HOME/.sdkman"
	[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
	export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
	# Load nvm
	export NVM_DIR="$HOME/.nvm"
	[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
	[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  export PATH="/opt/homebrew/opt/fzf/bin:$PATH"
fi

# Enable fzf
source <(fzf --zsh)

