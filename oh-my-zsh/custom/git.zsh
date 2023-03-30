# Delete all local branches except main or master
alias gbr='git branch | grep -v "main\|master" | xargs git branch -D'

# Switch to personal profile
alias gpersonal='git config user.name "ni-xon"; git config user.email "nixon.s.uch@gmail.com"'

alias gs='git status -s'
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
