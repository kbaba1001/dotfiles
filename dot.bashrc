# https://github.com/git/git/tree/master/contrib/completion
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
source ~/.bin/git-prompt.sh
PS1='\[\033[01;34m\]\w\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\]
\$ '

# export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk@11/include"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

export LS_COLORS='di=01;36'

# direnv https://direnv.net
eval "$(direnv hook bash)"

# https://github.com/b4b4r07/enhancd
source ~/enhancd/init.sh

alias dc="docker compose"
alias ls='ls --color=auto --group-directories-first'
