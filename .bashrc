#source ~/source/jellydoughnut/three_venv.sh

# Add pwd to prompt and add current branch in Git
function find_git_branch {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head == ref:\ refs/heads/* ]]; then
                git_branch=" ${head#*/*/}"
            elif [[ $head != '' ]]; then
                git_branch=' (detached)'
            else
                git_branch=' (unknown)'
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

green=$'\e[1;32m'
magenta=$'\e[1;35m'
normal_colours=$'\e[m'

export PS1="\[$green\]\u@\h:\w\[$magenta\]\$git_branch\[$green\]\\$\[$normal_colours\] "

source ~/.bash/aliases
#source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

export PATH=$HOME/local/bin:$PATH
