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
alias gclean="git stash;git clean -dxff;git submodule foreach --recursive git stash;git submodule foreach --recursive git clean -dxff;git remote prune origin;git submodule foreach --recursive git remote prune origin"
alias gacp="git add . && git commit -m update && git push"
alias gpu="git pull"
alias gfo="git fetch origin"
alias gmo="git merge origin/master"
alias gl="git log --graph"
alias gr="git remote -v"
alias gtl="git tag --list"

# tmux
alias t="tmux attach"

function get-my-home() {
    if [[ -z "${MY_HOME}" ]]; then
	echo $HOME
    else
	echo ${MY_HOME}
    fi
}

function to-git() {
    my_home=`get-my-home`
    cd ${my_home}/git
}

function to-bin() {
    my_home=`get-my-home`
    cd ${my_home}/git/bin
}

function to-rp() {
    my_home=`get-my-home`
    cd ${my_home}/git/RegisterPrinter
}

function to-rpf() {
    my_home=`get-my-home`
    cd ${my_home}/git/register-printer-frontend
}
