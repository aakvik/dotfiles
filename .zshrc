# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set vim as default editor
export EDITOR='vim'

# set theme
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="agnoster"
#ZSH_THEME="jonathan"
ZSH_THEME="powerlevel10k/powerlevel10k"

# add plugins
plugins=(git)

unsetopt nomatch

source $ZSH/oh-my-zsh.sh

# some verbose stuff
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

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

# git for dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
