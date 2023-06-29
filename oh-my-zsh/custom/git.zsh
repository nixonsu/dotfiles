# Open this file
alias git-aliases='vim ~/dev-config/oh-my-zsh/custom/git.zsh'

# Delete all local branches except main or master
alias gbr='git branch | grep -v "main\|master" | xargs git branch -D'
alias gs='(git fetch &>/dev/null &); git status -s'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias ga='git add'
alias gp='git pull'
alias gps='git push'
alias gl='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(    white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias grest='git restore'
alias gd='git diff'
alias gm='git merge'
alias gb='git branch'
alias grpo='git remote prune origin'
alias gst='git stash'
alias gcl='git clone'
alias grev='git revert'
# Open current branch in github
alias ghub='open $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )'

# Alias for lazygit
alias lg='lazygit'
