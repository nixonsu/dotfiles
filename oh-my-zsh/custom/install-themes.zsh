function installp10k {
  local p10k_dir="${DEV}/oh-my-zsh/custom/themes/powerlevel10k"
  if [ -d "$p10k_dir" ]; then
    echo "Powerlevel10k directory already exists. Skipping clone."
  else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_dir"
  fi
}

alias installp10k='echo "Installing Powerlevel10k theme...";installp10k;echo "Done."'
