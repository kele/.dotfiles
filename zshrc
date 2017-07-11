ZSH=$HOME/.oh-my-zsh

ZSH_THEME="evan"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(colored-man rust cargo)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

alias rm=trash
