function find_solution_or_project {
    echo $(find . -name '*.sln' -o -name '*.csproj' -maxdepth 1 | head -n 1)
}

alias ideaj='open -a "IntelliJ IDEA Ultimate" .'
alias idear='open -a "Rider" --args $(find_solution_or_project)'
alias ideap='open -a "PyCharm" .'
alias ideaw='open -a "WebStorm" .'

# sleep macos
alias sl='pmset sleepnow'
alias ld='lazydocker'

