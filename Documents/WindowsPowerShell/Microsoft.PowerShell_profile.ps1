# Source private profile
$privateProfile = Join-Path $HOME/Documents/WindowsPowerShell private_profile.ps1

if (Test-Path $privateProfile) {
    . $privateProfile
}

# Aliases
function lg { lazygit }

function df {
    & "C:\Program Files\Git\cmd\git.exe" --git-dir=$HOME/.dotfiles --work-tree=$HOME @args
}

function lgdf {
    lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Public/profile-managed config here

