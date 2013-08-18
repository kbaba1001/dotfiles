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

# cd した直後に ls する。ファイルが多いときは省略表示する。
# http://qiita.com/yuyuchu3333/items/b10542db482c3ac8b059
chpwd() {
    ls_abbrev
}
ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-CF' '--color=always')

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}

# 空 Enter で ls と git status を表示する
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter


# '^' を押すと上のディレクトリに移動する
# http://qiita.com/PSP_T/items/0678178be19ea99c33f7
function cdup() {
echo
cd ..
zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup
