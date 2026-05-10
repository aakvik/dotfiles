# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Editor
export EDITOR='vim'

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# SSH agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Zsh behavior
unsetopt nomatch

# Completion system
autoload -Uz compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump-$HOST"
mkdir -p "${ZSH_COMPDUMP:h}"
compinit -d "$ZSH_COMPDUMP"

# Better completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colors for ls/grep/etc where supported
autoload -Uz colors && colors
eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -lh --color=auto'

# Git prompt/status functions
autoload -Uz vcs_info

# Aliases
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

# Git for dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'

# JSON helpers replacing jsontools basics
alias pp_json='python -m json.tool'
alias is_json='python -m json.tool >/dev/null'

# Colored man pages replacement
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# Powerlevel10k theme, adjust path if installed elsewhere
[[ -r ~/.powerlevel10k/powerlevel10k.zsh-theme ]] &&
  source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Run every terminal in tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi
