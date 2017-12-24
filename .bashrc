#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# colored prompt
PS1='\[\033[00;32m\]\u\[\033[00;33m\]@\[\033[00;32m\]\h\[\033[01;30m\]:\[\033[01;36m\]\w\[\033[01;37m\]$ \[\033[00m\]'

# a few needed aliases
alias ls='ls --color=auto'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

# source alias file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enables bash autocompletion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# adds coloring to man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# adds syntax coloring to less (depends on source-highlight package)
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

# git handling for dotfiles
alias dotfiles='/usr/bin/git --git-dir=/home/aleksander/.cfg/ --work-tree=/home/aleksander'

