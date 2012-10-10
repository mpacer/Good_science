function fl() {         # flip between two working directories
        if [ "$#" = "1" ]; then
                FL="$1"
        fi

        if [ -z "${FL}" ]; then
        FL=$HOME
        fi
        tmp=$FL
        mark
        cd "$tmp";
        pwd
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
PS1="\h:\W$RED \$(parse_git_branch)$NO_COLOR\$"
