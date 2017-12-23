#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='\[\033[00;32m\]\u\[\033[00;33m\]@\[\033[00;32m\]\h\[\033[01;30m\]:\[\033[01;36m\]\w\[\033[01;37m\]$ \[\033[00m\]'

export TERM=xterm-256color

alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias dotfiles='/usr/bin/git --git-dir=/home/aleksander/.cfg/ --work-tree=/home/aleksander'

