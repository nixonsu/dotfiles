alias aliases='nvim ~/.oh-my-zsh/custom/aliases.zsh'

# Git aliases
# Delete all local branches except main or master
alias gbr='git branch | grep -v "main\|master" | xargs git branch -D'
alias gs='(git fetch &>/dev/null &); git status -s'
alias gl='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(    white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias gpr='xdg-open "$(git config --get remote.origin.url | sed -e "s/git@github.com:/https:\/\/github.com\//" -e "s/\.git$//")/compare/$(git symbolic-ref --short HEAD)?expand=1"'
alias gco='f() { git remote set-branches --add origin "$1" && git fetch origin && git switch "$1"; }; f'

# Open current branch in github
alias ghub='xdg-open $(git config remote.origin.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")/tree/$(git symbolic-ref --quiet --short HEAD )'

# Lazy tools
alias lg='lazygit'
alias ld='lazydocker'
alias lsql='lazysql'

# Open Jetbrains IDEs
function find_solution_or_project {
    echo $(find . -name '*.sln' -o -name '*.csproj' -maxdepth 1 | head -n 1)
}

alias ideaj='idea .'
alias idear='rider .'
alias ideap='pycharm .'
alias ideaw='webstorm .'

# Suspend the machine, or prevent sleep until Ctrl+C.
alias sl='systemctl suspend'
alias ds='systemd-inhibit --what=sleep --why="Interactive development" sleep infinity'

# Tree
alias t='tree'
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias t4='tree -L 4'

# Source zsh
alias so='source $HOME/.zshrc'
