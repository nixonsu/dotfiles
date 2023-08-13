# Dev Configuration

## Installation

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
export DEV="$HOME/dev-config"
```

4. Run installation script
- This creates symlinks and installs zsh custom plugins & themes
```zsh
$DEV/install.sh
```

5. Restart shell and viola!

## Tmux
I use tmux as a terminal multiplexor, which is just a fancy way to say I use tmux to manage and persist multiple terminal sessions at the same time. It also carries the advantage of still running whenever I accidentally close my terminal for whatever reason - pretty neat. To setup tmux with my plugins, run `Installing Plugins` section.
### Installing plugins
1. Add new plugin to ~/.tmux.conf with set -g @plugin '...'
2. Press prefix + I (capital i, as in Install) to fetch the plugin.
You're good to go! The plugin was cloned to ~/.tmux/plugins/ dir and sourced.

### Uninstalling plugins
1. Remove (or comment out) plugin from the list.
2. Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.

All the plugins are installed to `$DEV/tmux/plugins/` so alternatively you can find plugin directory there and remove it.



## Configuration Updates
1. Make changes to `dev-config`
2. Commit and push
2. Run installation script to apply changes to local
- This will recreate and update all local symlinks
```zsh
$DEV/install.sh
```

## Improvements
- [x] Move step 3 into `install.sh` itself. This enables script to be idempotent
- [ ] Abstract plugin/theme links in `install-plugins.sh` and `install-themes.sh` behind variables. This will promote DRY and reusability
- [x] Include Monokai Pro (Ristretto Filter) theme
