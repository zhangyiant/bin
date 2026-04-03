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
alias gco="git checkout"
alias gp="git push"
alias gclean="git stash;git clean -dxff;git submodule foreach --recursive git stash;git submodule foreach --recursive git clean -dxff;git remote prune origin;git submodule foreach --recursive git remote prune origin"
alias gacp="git add . && git commit -m update && git push"
alias gpu="git pull"
alias gfo="git fetch origin"
alias gl="git log --graph"
alias gtl="git tag --list"

# tmux
alias t="tmux attach"

# Get the user's home directory, preferring MY_HOME if set, otherwise $HOME
function get-my-home() {
    echo "${MY_HOME:-$HOME}"
}

# Change directory to the git directory in the user's home
function to-git() {
    my_home=`get-my-home`
    cd ${my_home}/git
}

# Change directory to the bin directory in the git repo
function to-bin() {
    my_home=`get-my-home`
    cd ${my_home}/git/bin
}

# Change directory to the RegisterPrinter project
function to-rp() {
    my_home=`get-my-home`
    cd ${my_home}/git/RegisterPrinter
}

# Change directory to the register-printer-frontend project
function to-rpf() {
    my_home=`get-my-home`
    cd ${my_home}/git/register-printer-frontend
}
