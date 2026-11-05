# Dotfiles

My development environment for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/). The installer also supports Linux with Nix.

## Getting Started

1. Install Homebrew on macOS:

   ```zsh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Clone the `macos` branch as a normal repository at `~/.dotfiles`:

   ```zsh
   git clone --branch macos git@github.com:nixonsu/dotfiles.git ~/.dotfiles
   ```

3. Back up and move any existing configuration files that conflict with Stow, then run the installer:

   ```zsh
   cd ~/.dotfiles
   ./install.sh
   ```

   The installer installs packages, oh-my-zsh, Powerlevel10k, shell plugins and the tmux plugin manager; links the Stow packages into `~`; enables the gitleaks pre-push hook; and sets zsh as the default shell. It simulates Stow before creating links and leaves conflicting files intact. On Linux, install Nix first instead of Homebrew.

4. Restart the shell and install tmux plugins as described below.

## Stow setup

Each package mirrors paths under the home directory. For example, `git/.gitconfig` is linked to `~/.gitconfig`, and `nvim/.config/nvim/init.lua` to `~/.config/nvim/init.lua`. The installer resolves the checkout location automatically and explicitly targets `$HOME` with Stow, so it works from `~/.dotfiles` or another directory.

| Package | Configuration |
| --- | --- |
| `zsh`, `p10k` | Shell, aliases, fzf helpers and prompt |
| `nvim`, `vim` | Neovim (0.12+), Vim, IdeaVim and Obsidian mappings |
| `tmux` | tmux configuration and session picker |
| `git`, `gh` | Git and GitHub CLI |
| `alacritty`, `karabiner` | Terminal and keyboard mappings |
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

### Karabiner

I use karabiner-elements to configure raw key mappings. For example, `CAPS LOCK` -> `ESC` when tapped and `CAPS LOCK` -> `CTRL` when held.

### Git

The default commit identity is Nixon Uch <nixon.s.uch@gmail.com>. On a personal laptop, this applies to repositories anywhere; neither the checkout nor projects need to live under `~/personal`.

On a work laptop, keep the existing global configuration and configure a folder-based personal identity separately if needed. That machine-specific setup belongs outside this repository. Cloning here temporarily does not change the active configuration. SSH keys and credentials are not stored in this repository.

### Oh My Zsh

`.oh-my-zsh` contains zsh configurations like plugins, themes, aliases, scripts etc. `.zsh` scripts in this folder are auto-loaded when oh-my-zsh runs.

### MacOS specific stuff

#### Allow keybind shortcuts to be used
`Option + num` shortcuts will by default insert characters like ¡™£¢. These need to be disabled to use them effectively for other shortcuts.

1. Write to directory: `~/Library/KeyBindings/DefaultKeyBinding.dict` with the following content:

```
{ "~a" = (); "~b" = (); "~c" = (); "~d" = (); "~e" = (); "~f" = (); "~g" = (); "~h" = (); "~i" = (); "~j" = (); "~k" = (); "~l" = (); "~m" = (); "~n" = (); "~o" = (); "~p" = (); "~q" = (); "~r" = (); "~s" = (); "~t" = (); "~u" = (); "~v" = (); "~w" = (); "~x" = (); "~y" = (); "~z" = (); }
```

2. Save and reboot machine

#### Allow holding down keys

```
defaults write -g ApplePressAndHoldEnabled -bool false
```
