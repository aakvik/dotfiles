# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# change location of zcompdumps
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# set vim as default editor
export EDITOR='vim'

# set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# add plugins
plugins=(
  git
  colored-man-pages
  jsontools
)

unsetopt nomatch

source $ZSH/oh-my-zsh.sh

# some aliases
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias l.='ls -dlh .*'

# git for dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Run every terminal in tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
