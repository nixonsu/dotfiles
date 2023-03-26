function find_solution_or_project {
    echo $(find . -name '*.sln' -o -name '*.csproj' -maxdepth 1 | head -n 1)
}

alias ideaj='open -a "IntelliJ IDEA" .'
alias idear='open -a "Rider" --args $(find_solution_or_project)'
