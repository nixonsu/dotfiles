alias aliases='nvim ~/dotfiles/zsh/custom/aliases.zsh'

# Git aliases
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
alias gra='git restore .'
alias gd='git diff'
alias gm='git merge'
alias gb='git branch'
alias grpo='git remote prune origin'
alias gst='git stash'
alias gcl='git clone'
alias grev='git revert'
alias gpr='open "$(git config --get remote.origin.url | sed -e "s/git@github.com:/https:\/\/github.com\//" -e "s/\.git$//")/compare/$(git symbolic-ref --short HEAD)?expand=1"'
alias gw='git worktree'

# Open current branch in github
alias ghub='open $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )'

# Lazy tools
alias lg='lazygit'
alias ld='lazydocker'

# Open Jetbrains IDEs
function find_solution_or_project {
    echo $(find . -name '*.sln' -o -name '*.csproj' -maxdepth 1 | head -n 1)
}

alias ideaj='open -a "IntelliJ IDEA Ultimate" .'
alias idear='open -a "Rider" --args $(find_solution_or_project)'
alias ideap='open -a "PyCharm" .'
alias ideaw='open -a "WebStorm" .'

# Sleep macos
alias sl='pmset sleepnow'

# Source zsh
alias so='source ${DEV}/zsh/.zshrc'

