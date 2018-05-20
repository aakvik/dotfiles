# Path to your oh-my-zsh installation.
export ZSH=/home/aleksander/.oh-my-zsh

# set vim as default editor
export EDITOR='vim'

# set theme
ZSH_THEME="aakvik"

# add plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# some verbose stuff
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

# source alias file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

# pastebin
pb () {
      curl -F "c=@${1:--}" https://ptpb.pw/
  }

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# start tmux in interactive shells
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

