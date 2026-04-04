# PowerShell Profile - Git Shortcuts and Navigation Helpers
# This file provides PowerShell equivalents to the Bash aliases in alias.bash

# Remove built-in PowerShell aliases that conflict with git commands
# (gc = Get-Content, gp = Get-ItemProperty, gl = Get-PfxCertificate)
foreach ($alias in @('gc', 'gp', 'gl')) {
    if (Get-Alias -Name $alias -ErrorAction SilentlyContinue) {
        Write-Host "Removing built-in alias: $alias"
        Remove-Alias -Name $alias -Force
    }
}

# Set up $MyHome variable - uses $env:MY_HOME if set, otherwise falls back to $HOME
if (-not $MyHome) {
    $MyHome = if ($env:MY_HOME) { $env:MY_HOME } else { $HOME }
}

# Git Functions
# These functions provide shortcuts for common git operations

# Pull from remote repository
function gpu {
    git pull $args
}

# Stage files for commit
function ga {
    git add $args
}

# List all branches (local and remote)
function gb {
    git branch -a
}

# Show working tree changes
function gd {
    git diff $args
}

# Show staged changes
function gdc {
    git diff --cached $args
}

# Show repository status
function gs {
    git status $args
}

# Initialize and update submodules recursively
function gsu {
    git submodule update --init --recursive
}

# Commit changes
function gc {
    git commit $args
}

# Switch branches or restore files
function gco {
    git checkout $args
}

# Push to remote repository
function gp {
    git push $args
}

# Clean repository - stash changes, remove untracked files, and prune remote branches
function gclean {
    git stash
    git clean -dxff
    git submodule foreach --recursive git stash
    git submodule foreach --recursive git clean -dxff
    git remote prune origin
    git submodule foreach --recursive git remote prune origin
}

# Add all changes, commit with message "update", and push
function gacp {
    git add .
    if ($LASTEXITCODE -ne 0) {
        return
    }

    git commit -m update
    if ($LASTEXITCODE -ne 0) {
        return
    }

    git push
}

# Fetch from origin
function gfo {
    git fetch origin
}

# Show commit history with graph
function gl {
    git log --graph
}

# List all tags
function gtl {
    git tag --list
}

# Navigation Functions
# These functions provide quick directory navigation to common locations

# Navigate to Emacs configuration directory
function Enter-EmacsD {
    Set-Location ${env:USERPROFILE}\AppData\Roaming\.emacs.d
}

# Navigate to temporary directory
function Enter-Tmp {
    Set-Location C:\tmp
}

# Navigate to git projects root
function Enter-Git {
    Set-Location (Join-Path $MyHome 'git')
}

# Navigate to RegisterPrinter project
function Enter-Rp {
    Set-Location (Join-Path (Join-Path $MyHome 'git') 'RegisterPrinter')
}

# Navigate to register-printer-frontend project
function Enter-Rpf {
    Set-Location (Join-Path (Join-Path $MyHome 'git') 'register-printer-frontend')
}

# Navigate to bin utilities directory
function Enter-Bin {
    Set-Location (Join-Path (Join-Path $MyHome 'git') 'bin')
}
