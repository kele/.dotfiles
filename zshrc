# Autoload tmux
export TERM='screen-256color'
if [ "$TMUX" = "" ]; then tmux attach-session && exit; fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="edvardm"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colored-man screen pip python pyenv ssh-agent)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

# Tmux is unhappy with these lines
# 256 colours in terminal
#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#    export TERM='xterm-256color'
#else
#    export TERM='xterm-color'
#fi



alias g++11="g++ -std=c++11"
alias clang++11="clang++ -std=c++11"
alias rm=trash
alias pinggateway="ping `/sbin/ip route | awk '/default/ { print $3 }'`"
alias -g zatwierdz=commit
alias purge="sudo apt-get purge"
alias install="sudo apt-get install"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get autoremove -y --purge && sudo apt-get update; sudo apt-get upgrade -y"
alias inbox="cd ~/inbox"
alias work="cd ~/work"

# Without this, vim tries to connect with X server which causes a 1s lag in tmux
#alias vim="vim -X"

alias usermount="sudo mount -o rw,nosuid,nodev,uid=1000,gid=1000,shortname=mixed,dmask=0077,showexec,flush"


# Welcome message for login shells
echo
print -P "\e[1;30m Welcome to: \e[1;31m%m"
print -P "\e[1;30m Running: \e[1;31m`uname -srm`\e[1;30m on \e[1;31m%l"
print -P "\e[1;30m It is:\e[1;31m %D{%r}\e[1;30m on \e[1;31m%D{%f-%m-%G}"
print -P "\e[1;30m Battery state:\e[1;31m `acpi | sed -e 's/%/%%/'`"

echo
print -P "\e[1;30mTodo: \e[1;31m"
cat ~/todo | head -n 10 | sed 's/^.*/  &/'

alias todo="cat ~/todo"

export CXXFLAGS="-std=c++11 -g"
export CXX=clang++

echo `pushd > /dev/null; cd ~/.dotfiles; git status -s; popd > /dev/null`
