Remove-Alias -Name gc -Force
Remove-Alias -Name gp -Force
Remove-Alias -Name gl -Force

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

function gcl {
    git clone $args
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
}

function gacp {
    git add . && git commit -m update && git push
}

function gfo {
    git fetch origin
}

function gmo {
    git merge origin/master
}


function gl {
    git log --graph
}

function gtl {
    git tag --list
}

function to_emacs_d {
    Set-Location ${env:USERPROFILE}\AppData\Roaming\.emacs.d
}

function To-Tmp {
    Set-Location C:\tmp
}

function To-Git {
    Set-Location $MyHome\git
}

function To-Rp {
    Set-Location $MyHome\git\RegisterPrinter
}

function To-Rpf {
    Set-Location $MyHome\git\register-printer-frontend
}

function To-Bin {
    Set-Location $MyHome\git\bin
}
