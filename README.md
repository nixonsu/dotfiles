# Dev Configuration

## Installation
1. Install iTerm2
```zsh
brew install iterm2
```

2. Install oh-my-zsh

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

3. Clone this repo into ~
```zsh
git clone git@github.com:ni-xon/dev-config.git ~
```

4. Temporarily set DEV environment variable for the install to work
```zsh
export DEV="$HOME/dev-config"
```

5. Run installation script
- This creates symlinks and installs zsh custom plugins & themes
```zsh
$DEV/install.sh
```

6. Restart shell and viola!

## Configuration Updates
1. Make changes to `dev-config`
2. Commit and push
2. Run installation script to apply changes to local
- This will recreate and update all local symlinks
```zsh
$DEV/install.sh
```

## Additional setup
1. Set `tmux attach -t base || tmux new -s base` to run everytime iTerm2 is booted - see [here](https://www.youtube.com/watch?v=FbKpN7c2aX8&ab_channel=BenjaminTan) for tutorial.

## Improvements
- [x] Move step 3 into `install.sh` itself. This enables script to be idempotent
- [ ] Abstract plugin/theme links in `install-plugins.sh` and `install-themes.sh` behind variables. This will promote DRY and reusability
- [x] Include Monokai Pro (Ristretto Filter) theme
