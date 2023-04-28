function install_tpm {
  local tpm_dir="${DEV}/tmux/plugins/tpm"
  if [ -d "$tpm_dir" ]; then
    echo "tpm directory already exists. Skipping clone."
  else
    git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
  fi
}

alias installtpm='echo "Installing tpm...";install_tpm;echo "Done."'
