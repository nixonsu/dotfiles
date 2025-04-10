function install_zsh_autosuggestions {
  local autosuggestions_dir="${DEV}/zsh/custom/plugins/zsh-autosuggestions"
  if [ -d "$autosuggestions_dir" ]; then
    echo "zsh-autosuggestions directory already exists. Skipping clone."
  else
    git clone https://github.com/zsh-users/zsh-autosuggestions "$autosuggestions_dir"
  fi
}

function install_zsh_z {
  local z_dir="${DEV}/zsh/custom/plugins/zsh-z"
  if [ -d "$z_dir" ]; then
    echo "zsh-z directory already exists. Skipping clone."
  else
    git clone https://github.com/agkozak/zsh-z "$z_dir"
  fi
}

function install_zsh_syntax_highlighting {
  local syntax_highlighting_dir="${DEV}/zsh/custom/plugins/zsh-syntax-highlighting"
  if [ -d "$syntax_highlighting_dir" ]; then
    echo "zsh-syntax-highlighting directory already exists. Skipping clone."
  else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$syntax_highlighting_dir"
  fi
}

alias installplugins='echo "Installing zsh plugins...";install_zsh_autosuggestions;install_zsh_z;install_zsh_syntax_highlighting;echo "Done."'
