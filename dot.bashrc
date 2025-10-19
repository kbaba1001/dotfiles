# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
HISTSIZE=10000
HISTFILESIZE=20000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
source /usr/share/git/git-prompt.sh
PS1='\[\033[01;36m\]\W\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\]
\$ '

export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export LS_COLORS='di=01;36'
export ENHANCD_FILTER="fzf --height 40%"
source $HOME/enhancd/init.sh

export GPG_TTY=$(tty)

keychain --nogui --agents gpg --gpg2 D67906C592FBA882
keychain --nogui $HOME/.ssh/id_ed25519
source $HOME/.keychain/$HOSTNAME-sh

# ctrl R の設定
export FZF_CTRL_R_OPTS="
  --height 40% \
  --layout=reverse \
  --border \
  --ansi \
  --preview 'echo {}' \
  --preview-window down:3:wrap"

# ターミナルでの  fzf 全体設定
export FZF_DEFAULT_OPTS="
  --height 40% \
  --layout=reverse \
  --border"

eval "$(fzf --bash)"
eval "$(mise activate bash)"

function filename_search {
  rg --files $2 2>/dev/null | rg $1
}

alias ls="ls --color=auto --group-directories-first"
alias dc="docker compose"
alias bat="bat -p"
alias type="type -a"
alias npm="pnpm"
alias rm="safe-rm"
alias s="echo '---pwd---' && pwd && echo '---ls---' && ls --color=auto --group-directories-first && echo '---git status & log---' && git status -s 2> /dev/null && git log --decorate --oneline -n 5 2> /dev/null"
alias tree="tree --dirsfirst -F -L 1"
