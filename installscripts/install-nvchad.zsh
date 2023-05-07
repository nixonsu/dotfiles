function install_nvchad {
  local nvchad_dir="${DEV}/nvim"
  if [ -d "$nvchad_dir" ]; then
    echo "nvchad directory already exists. Skipping clone."
  else
    git clone https://github.com/NvChad/NvChad $nvchad_dir --depth 1
  fi
}
alias installnvchad='echo "Installing NvChad...";install_nvchad;echo "Done."'

