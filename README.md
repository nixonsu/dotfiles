# Dotfiles

Dotfiles using git bare repository approach as seen in: https://www.atlassian.com/git/tutorials/dotfiles

## Getting Started


1. Clone this repo as a bare repository

```zsh
git clone --bare git@github.com:nixonsu/dotfiles.git $HOME/.dotfiles
```

2. Temporarily set alias `df`

```powershell
function df {
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
df checkout windows --force
```

5. Install programs

```powershell
winget install `
Google.Chrome `
Obsidian.Obsidian `
Alacritty.Alacritty `
Microsoft.VisualStudioCode `
Ytmdesktop.Ytmdesktop `
JesseDuffield.lazygit `
ajeetdsouza.zoxide `
fzf `
DEVCOM.JetBrainsMonoNerdFont`
psmux
```

- [AutoHotKey V2](https://www.autohotkey.com/)

## Annoyances
1. Windows terminal gets stuck processing and doesn't resume until a key is pressed. Solution: Right click window > Properties > Disable 'QuickEdit Mode'
2. Windows aliases not working. Solution: Run `echo $profile.CurrentUserAllHosts` to see if the correct profile is being referenced.

