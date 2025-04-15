HISTSIZE=10000
HISTFILESIZE=20000

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# https://github.com/git/git/tree/master/contrib/completion
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
source /usr/lib/git-core/git-sh-prompt
PS1='\[\033[01;34m\]\w\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\]
\$ '

keychain --nogui $HOME/.ssh/id_rsa
keychain --nogui $HOME/.ssh/id_ed25519
source $HOME/.keychain/$HOSTNAME-sh

export ENHANCD_FILTER="fzf --height 40%"
export LS_COLORS='di=01;36'

for i in /home/linuxbrew/.linuxbrew/etc/bash_completion.d/*
do
  . $i
done

export GPG_TTY=$(tty)

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
for i in /home/linuxbrew/.linuxbrew/etc/bash_completion.d/*
do
  . $i
done

# alias
alias dc="docker compose"
alias ls='ls --color=auto --group-directories-first'
alias bat="bat -p"
alias type="type -a"
