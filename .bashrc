#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias dotfiles='/usr/bin/git --git-dir=/home/aleksander/.cfg/ --work-tree=/home/aleksander'

