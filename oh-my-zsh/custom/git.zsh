# Delete all local branches except main or master
alias gbr='git branch | grep -v "main\|master" | xargs git branch -D'

# Switch to personal profile
alias gpersonal='git config user.name "ni-xon"; git config user.email "nixon.s.uch@gmail.com"'
