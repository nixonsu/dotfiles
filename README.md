# Dev environment setup
1. Install iTerm2
`brew install iterm2`

2. Install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

3. Remove oh-my-zsh default `custom` folder
`rm -rf ~/.oh-my-zsh/custom`

4. Clone this repo into ~
`git clone git@github.com:ni-xon/dev-config.git ~`

5. Temporarily set DEV environment variable for the install to work
`export DEV="$HOME/dev-config"`

6. Run installation script
`$DEV/install.sh`

7. Restart shell and viola!
