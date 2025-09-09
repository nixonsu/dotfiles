# Dotfiles

Dotfiles using git bare repository approach as seen in: https://www.atlassian.com/git/tutorials/dotfiles

## Getting Started

1. Install brew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install oh-my-zsh

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

3. Clone this repo as a bare repository

```zsh
git clone --bare git@github.com:nixonsu/dotfiles.git ~/.dotfiles
```

4. Temporarily set alias `df`

```zsh
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

5. Once off git config commands (don't show untracked files and fix remote to allow downloading remote branches)

```zsh
df config --local status.showUntrackedFiles no
df config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
```

6. Checkout intended OS

```zsh
df checkout macos
```

7. Run sync script (installs themes, plugins and applications)

```zsh
~/scripts/sync.sh
```

8. Restart shell and viola!

## Details

### Tmux

I use tmux to ensure sesions are persisted even when my local shell is disconnected for whatever reason. It's also a great tool to organise my workspace. To setup tmux with my plugins, run `Installing Plugins` section.

#### Installing plugins

1. Add new plugin to ~/.tmux.conf with set -g @plugin '...'
2. Press prefix + I (capital i, as in Install) to fetch the plugin.
You're good to go! The plugin was cloned to ~/.tmux/plugins/ dir and sourced.

### Karabiner

I use karabiner-elements to configure raw key mappings. For example, `CAPS LOCK` -> `ESC` when tapped and `CAPS LOCK` -> `CTRL` when held.

### Git

Git config allows me to use one set of creds under one folder and another set of creds under another folder. This is especially handy for working on my personal projects on a work device.

### Oh My Zsh

`.oh-my-zsh` contains zsh configurations like plugins, themes, aliases, scripts etc. `.zsh` scripts in this folder are auto-loaded when oh-my-zsh runs.

### MacOS specific stuff

`Option + num` shortcuts will by default insert characters like ¡™£¢. These need to be disabled to use them effectively for other shortcuts.

1. Write to directory: `~/Library/KeyBindings/DefaultKeyBinding.dict` with the following content:

```
{ "~a" = (); "~b" = (); "~c" = (); "~d" = (); "~e" = (); "~f" = (); "~g" = (); "~h" = (); "~i" = (); "~j" = (); "~k" = (); "~l" = (); "~m" = (); "~n" = (); "~o" = (); "~p" = (); "~q" = (); "~r" = (); "~s" = (); "~t" = (); "~u" = (); "~v" = (); "~w" = (); "~x" = (); "~y" = (); "~z" = (); }
```

2. Save and reboot machine
