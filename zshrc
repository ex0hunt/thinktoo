export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=30

ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git python battery pip history-substring-search colorize docker emoji emoji-clock sudo git-flow zsh_reload)

# User configuration
export TERM=xterm-256color
export PATH="/usr/sbin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.8.3:/usr/games/bin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

alias genupdate="su -c 'layman -S;eix-sync && emerge -vuDN world && smart-live-rebuild'"
alias ping="grc ping"
alias topsize="du -hsx * | sort -rh | head -10"
alias vmdk2vdi="VBoxManage clonehd --format VDI "
#alias docker-cleanup="docker rmi `docker images | awk '$1 == "<none>" && $2 == "<none>" { print $3}'`"