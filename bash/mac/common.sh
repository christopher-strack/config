
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


alias repository_root='${DIR}/../../python/repository_root.py'


# Setting for the new UTF-8 terminal support

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# Define colors for common commands

export CLICOLOR=1
export LSCOLORS=ExFxCxDxCxegedabagacad


# Autojump

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


# Git setup

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "
