export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wezm"

plugins=(
  git
  zsh-256color
)

source $ZSH/oh-my-zsh.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# User configuration
export TERM=xterm-256color

# ssh
export SSH_KEY_PATH="~/.ssh/git_rsa"

# alias
export LS_OPTIONS='--group-directories-first --color=auto -h'
alias ls="ls $LS_OPTIONS"
alias mkdir="mkdir -v"
alias dd="dd status=progress"

alias sl=ls

alias ll="ls -l $LS_OPTIONS"
alias la="ls -la $LS_OPTIONS"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs 
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 ' 
export PROJECT_HOME=$HOME/Devel 
source $HOME/.local/bin/virtualenvwrapper.sh

# termux
export TERMUX=0
if [ -d /data/data/com.termux/files ]; then
    TERMUX=1
fi
