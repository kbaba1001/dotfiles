export SHELL=/bin/zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my_theme"
# ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler cap git gitfast heroku rails3 rake rbenv ruby tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="$PATH:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/*/**/bin:$HOME/dotfiles/scripts:/sbin:/usr/local/heroku/bin:"

# rbenv
eval "$(rbenv init -)"

## Emacsライクキーバインド設定
bindkey -e

# gem open & bundle open
export BUNDLER_EDITOR="/usr/local/bin/st"
export GEM_EDITOR="/usr/local/bin/st"
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"
alias bo="bundle open"
alias ber="bundle exec rake"
alias brs="bundle exec rspec"
alias bra="bundle exec rails"

# short command
alias t="touch"
alias m="mkdir"
alias d="cd"
alias cm="chmod"
alias v="vim"
alias h="head"

# rm command to trash
alias rm="trash"

# show (ls & less)
alias s="${HOME}/dotfiles/scripts/show-linux"

# ls
alias ls="ls -F --color"
alias l="ls -l"
alias a="ls -a"
alias la="ls -la"

# less
alias less="less -X"

# tmux
alias ta="tmux attach"

# update .zshrc
alias zr="vim $HOME/.zshrc ; source $HOME/.zshrc"

# git
# alias git="hub"
alias g="git"
alias gup="git pull --rebase ; git remote update --prune ; git branch --merged | grep -v '*' | xargs -I % git branch -d %"

# search ESSID
alias essid="iwlist wlan0 scan | grep ESSID"

# irb to pry
alias irb='pry'

# show remaining battery
alias battery='acpitool -b'

# xscreensaver
alias ss='xscreensaver-command -lock'
