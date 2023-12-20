# emacs alias
alias e="start_emacs.bash"
alias ee="emacsclient -nw"

# git alias
alias ga="git add"
alias gb="git branch -a"
alias gd="git diff"
alias gdc="git diff --cached"
alias gs="git status"
alias gsu="git submodule update --init --recursive"
alias gc="git commit"
alias gcl="git clone"
alias gco="git checkout"
alias gp="git push"
alias gclean="git stash;git clean -dxf;git submodule foreach --recursive git stash;git submodule foreach --recursive git clean -dxf;git remote prune origin;git submodule foreach --recursive git remote prune origin"
alias gacp="git add . && git commit -m update && git push"
alias gpu="git pull"
alias gfo="git fetch origin"
alias gmo="git merge origin/master"
alias gl="git log --graph"
alias gr="git remote -v"
alias gtl="git tag --list"

# rpf alias
alias to_rpf='cd ~/git/register-printer-frontend'
