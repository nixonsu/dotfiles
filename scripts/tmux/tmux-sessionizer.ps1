#!/usr/bin/env powershell

param(
    [string]$Selected
)

$SearchPaths = @(
    "C:\dev"
)

if (-not $Selected) {
    $dirs = @($env:USERPROFILE)
    foreach ($searchPath in $SearchPaths) {
        if (Test-Path $searchPath) {
            $dirs += Get-ChildItem -Path $searchPath -Directory | Select-Object -ExpandProperty FullName
        }
    }

    $homePrefix = "$env:USERPROFILE\"
    $displayDirs = $dirs | ForEach-Object {
        if ($_ -eq $env:USERPROFILE) { "~" }
        elseif ($_.StartsWith($homePrefix)) { $_.Substring($homePrefix.Length) }
        else { $_ }
    }

    $picked = $displayDirs | fzf
    if (-not $picked) { return }

    if ($picked -eq "~") {
        $Selected = $env:USERPROFILE
    }
    elseif ([System.IO.Path]::IsPathRooted($picked)) {
        $Selected = $picked
    }
    else {
        $Selected = Join-Path $env:USERPROFILE $picked
    }
}

if (-not $Selected) { return }

$selectedName = (Split-Path $Selected -Leaf) -replace '\.', '_'

$insidePsmux = [bool]$env:PSMUX_SESSION
$psmuxRunning = Get-Process -Name psmux -ErrorAction SilentlyContinue

if (-not $insidePsmux -and -not $psmuxRunning) {
    psmux new-session -s $selectedName -c $Selected
    return
}

# Clear the nesting guard so psmux commands don't get blocked.
# psmux identifies the client via ConPTY handles, not the env var.
$savedSession = $env:PSMUX_SESSION
$env:PSMUX_SESSION = $null

try {
    psmux has-session -t $selectedName 2>$null
    if ($LASTEXITCODE -ne 0) {
        psmux new-session -d -s $selectedName -c $Selected
    }

    if (-not $insidePsmux) {
        psmux attach -t $selectedName
    }
    else {
        psmux switch-client -t $selectedName
    }
}
finally {
    $env:PSMUX_SESSION = $savedSession
}
