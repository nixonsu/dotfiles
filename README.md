# Dotfiles

Dotfiles using git bare repository approach as seen in: https://www.atlassian.com/git/tutorials/dotfiles

## Getting Started


1. Clone this repo as a bare repository

```zsh
git clone --bare git@github.com:nixonsu/dotfiles.git $HOME/.dotfiles
```

2. Temporarily set alias `df`

```powershell
function g {
    & "C:\Program Files\Git\cmd\git.exe" --git-dir=$HOME/.dotfiles --work-tree=$HOME @args
}
```

3. Once off git config commands (don't show untracked files and fix remote to allow downloading remote branches)

```zsh
df config --local status.showUntrackedFiles no
df config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
```

4. Checkout intended OS

```zsh
df checkout windows
```
