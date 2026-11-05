# Dotfiles

My development environment for Ubuntu 24.04 or newer, managed with [GNU Stow](https://www.gnu.org/software/stow/). The `macos` branch contains the macOS setup.

## Getting Started

1. Install Git and clone this branch as a normal repository at `~/.dotfiles`:

   ```bash
   sudo apt-get update
   sudo apt-get install -y git
   git clone --branch linux https://github.com/nixonsu/dotfiles.git ~/.dotfiles
   ```

   HTTPS cloning works before a personal SSH key is set up. Configure SSH separately if you prefer it for pushing.

2. Back up and move configuration files that conflict with Stow, then run as your normal login user:

   ```bash
   cd ~/.dotfiles
   ./install.sh
   ```

   The installer uses sudo for apt packages and bootstraps [Nix using its official installer](https://nix.dev/manual/nix/stable/installation/installing-binary.html) if needed. Ubuntu with systemd normally uses the multi-user Nix daemon. Follow any installer prompts. Do not run the whole script with sudo.

   Apt installs system tools, zsh, build dependencies, Alacritty and Wayland/X11 clipboard helpers. Nix installs the pinned development tools, Node.js, Yarn, Neovim 0.12+ and JetBrains Mono Nerd Font. The installer also installs oh-my-zsh, Powerlevel10k, shell plugins and TPM, links Stow packages into `~`, enables the pre-push scanner and sets zsh as the login shell. Existing conflicting files are preserved; move them aside and rerun. Ubuntu's Universe repository must be enabled for desktop packages.

   For a server without a graphical desktop, use `DOTFILES_HEADLESS=1 ./install.sh` to skip Alacritty and desktop helpers. Clipboard copying and browser launch shortcuts require a desktop session.

3. Log out and back in. Install tmux plugins with `Ctrl+Space`, then `Shift+I`.

`~/.dotfiles` is the normal install location. A temporary clone under `~/personal/dotfiles` is also supported, but running the installer there still changes the home-directory configuration. This is a normal Git checkout, not a bare repository.

## Stow setup

Each package mirrors paths under the home directory. For example, `git/.gitconfig` is linked to `~/.gitconfig`, and `nvim/.config/nvim/init.lua` to `~/.config/nvim/init.lua`. The installer resolves the checkout location automatically and explicitly targets `$HOME` with Stow, so it works from `~/.dotfiles` or another directory.

| Package | Configuration |
| --- | --- |
| `zsh`, `p10k` | Shell, aliases, fzf helpers and prompt |
| `nvim`, `vim` | Neovim (0.12+), Vim, IdeaVim and Obsidian mappings |
| `tmux` | tmux configuration and session picker |
| `git`, `gh` | Git and GitHub CLI |
| `alacritty` | Terminal configuration |
| `editorconfig`, `rg` | Editor defaults and ripgrep |


To preview or relink one package:

```zsh
cd ~/.dotfiles
stow --simulate --target="$HOME" zsh
stow --target="$HOME" zsh
```

To add a package, mirror its home-directory paths and add its name to `STOW_PACKAGES` in `install.sh`.

## Making changes

Files in `~` are symlinks, so you can edit them in place (for example, `vim ~/.zshrc`). Review and commit from the checkout:

```zsh
cd ~/.dotfiles
git status
git add -p
git commit -m "Update configuration"
git push
```

## Details

### Tmux

I use tmux to ensure sessions are persisted even when my local shell is disconnected for whatever reason. It's also a great tool to organise my workspace. To set up tmux with my plugins, follow the `Installing plugins` section.

#### Installing plugins

1. Add new plugin to ~/.tmux.conf with set -g @plugin '...'
2. Press prefix + I (capital i, as in Install) to fetch the plugin.

You're good to go! The plugin was cloned to `~/.tmux/plugins/` and sourced.

### Linux desktop

Alacritty starts tmux from `PATH` and uses JetBrains Mono Nerd Font. Tmux copy mode uses `wl-copy` on Wayland or `xclip` on X11; Neovim detects these clipboard providers automatically. These commands need an active desktop session.

Karabiner is macOS-only and is not included. Configure Caps Lock and navigation mappings with your Linux desktop or a separate keyboard remapper. The installer does not alter desktop keybindings.

`gpr` and `ghub` use `xdg-open`. IDE shortcuts expect the `idea`, `rider`, `pycharm` and `webstorm` launchers on `PATH`; install your IDEs separately. `sl` suspends via systemd. `ds` blocks sleep until Ctrl+C; there is no separate `es` command.

Chrome history defaults to the Chrome or Chromium `Default` profile. Set `CHROME_HISTORY_FILE` for another profile, including Snap Chromium. SQLite snapshots are temporary and removed after selection.

### Git

The default commit identity is Nixon Uch <nixon.s.uch@gmail.com>. On a personal laptop, this applies to repositories anywhere; neither the checkout nor projects need to live under `~/personal`.

On a work laptop, keep the existing global configuration and configure a folder-based personal identity separately if needed. That machine-specific setup belongs outside this repository. Cloning here temporarily does not change the active configuration. SSH keys and credentials are not stored in this repository.

### Oh My Zsh

`.oh-my-zsh` contains zsh configurations like plugins, themes, aliases, scripts etc. `.zsh` scripts in this folder are auto-loaded when oh-my-zsh runs.

### Development tools

The Nix toolchain supplies Node.js instead of Homebrew's nvm. Existing SDKMAN installations are loaded if present; SDKMAN, IDEs, Docker Engine and desktop applications such as Obsidian are not installed automatically. Docker/kubernetes client tools still need their services and credentials configured separately.

`nixpkgs-revision` pins the package set. Update it deliberately and rerun `./install.sh` to upgrade the tools together. Neovim requires 0.12+ for `vim.pack`; the installer checks this before linking files.
