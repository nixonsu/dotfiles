# Dotfiles

## Getting Started

0. Install brew
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

1. Install oh-my-zsh

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

2. Clone this repo into ~
```zsh
git clone git@github.com:ni-xon/dev-config.git ~
```

3. Temporarily set DEV environment variable for the install to work
```zsh
export DEV="$HOME/dotfiles"
```

4. Run installation script
- This creates symlinks and installs zsh custom plugins & themes
```zsh
$DEV/install.sh
```

5. Restart shell and viola!

## Making Updates
1. Make changes to `dotfiles`
2. Push changes
2. Run `sync.sh` to apply changes to local
```zsh
$DEV/sync.sh
```


## Details
### Tmux
I use tmux to ensure sesions are persisted even when my local shell is disconnected for whatever reason. It's also a great tool to organise my workspace. To setup tmux with my plugins, run `Installing Plugins` section.

#### Installing plugins
1. Add new plugin to ~/.tmux.conf with set -g @plugin '...'
2. Press prefix + I (capital i, as in Install) to fetch the plugin.
You're good to go! The plugin was cloned to ~/.tmux/plugins/ dir and sourced.

### Uninstalling plugins
1. Remove (or comment out) plugin from the list.
2. Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.

All the plugins are installed to `$DEV/tmux/plugins/` so alternatively you can find plugin directory there and remove it.

### Karabiner
I use karabiner-elements to configure raw key mappings. For example, repurposing CAPS LOCK as ESC.

### Git
Git configuration is setup to allow me to use one set of creds under one folder and another set of creds under another folder. This is especially handy for working on my personal projects on a work device for example.

### Zsh
This folder contains all zsh configurations and also includes useful aliases. Zsh scripts in this folder are auto-loaded when oh-my-zsh runs.

