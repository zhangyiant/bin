foreach ($alias in @('gc', 'gp', 'gl')) {
    if (Get-Alias -Name $alias -ErrorAction SilentlyContinue) {
        Write-Host "Removing built-in alias: $alias"
        Remove-Alias -Name $alias -Force
    }
}

if (-not $MyHome) {
    $MyHome = if ($env:MY_HOME) { $env:MY_HOME } else { $HOME }
}

function gpu {
    git pull $args
}

function ga {
    git add $args
}

function gb {
    git branch -a
}

function gd {
    git diff $args
}

function gdc {
    git diff --cached $args
}

function gs {
    git status $args
}

function gsu {
    git submodule update --init --recursive
}

function gc {
    git commit $args
}

function gco {
    git checkout $args
}

function gp {
    git push $args
}

function gclean {
    git stash
    git clean -dxff
    git submodule foreach --recursive git stash
    git submodule foreach --recursive git clean -dxff
    git remote prune origin
    git submodule foreach --recursive git remote prune origin
}

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

function gfo {
    git fetch origin
}


function gl {
    git log --graph
}

function gtl {
    git tag --list
}

function Enter-EmacsD {
    Set-Location ${env:USERPROFILE}\AppData\Roaming\.emacs.d
}

function Enter-Tmp {
    Set-Location C:\tmp
}

function Enter-Git {
    Set-Location (Join-Path $MyHome 'git')
}

function Enter-Rp {
    Set-Location (Join-Path (Join-Path $MyHome 'git') 'RegisterPrinter')
}

function Enter-Rpf {
    Set-Location (Join-Path (Join-Path $MyHome 'git') 'register-printer-frontend')
}

function Enter-Bin {
    Set-Location (Join-Path (Join-Path $MyHome 'git') 'bin')
}
