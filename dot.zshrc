export SHELL=/bin/zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

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
# plugins=()

source $ZSH/oh-my-zsh.sh

#### Customize to your needs.
export PATH="$PATH:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/*/**/bin:$HOME/dotfiles/scripts:$HOME/bin:/sbin:"

# rbenv
eval "$(rbenv init -)"

## Emacsライクキーバインド設定
bindkey -e

# git prompt
source ~/.zsh/git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_NOCACHE="true"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}\xF0\x9F\x8D\xB6 "
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[gray]%}\xF0\x9F\x91\xBD "
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}\xF0\x9f\x8d\xba "
ZSH_THEME_GIT_PROMPT_REMOTE=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}\xF0\x9F\x8D\xB7 "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%}\xF0\x9F\x8D\xA3 "

PROMPT='%{$fg_bold[red]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}%{$fg_bold[cyan]%}%C%{$reset_color%}$(git_super_status)%{$reset_color%}%# '

# bundle open & gem open
export BUNDLER_EDITOR="st -w"
export GEM_EDITOR="st -w"
export EDITOR="vim -y"

# z ( https://github.com/rupa/z )
source ${HOME}/.z-sh/z.sh

# keychain
keychain -q ${HOME}/.ssh/*.rsa

[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && source $HOME/.keychain/$HOSTNAME-sh-gpg

# gem open & bundle open
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"
alias bo="bundle open"
alias ber="bundle exec rake"
alias brs="bundle exec rspec"
alias bra="bundle exec rails"
alias bcu="bundle exec cucumber"
alias -g RT="RAILS_ENV=test"
alias -g RD="RAILS_ENV=development"
alias -g RP="RAILS_ENV=production"

# short command
alias t="touch"
alias m="mkdir"
alias d="cd"
alias v="vim"
alias so="source"
alias vgc="vim ~/.gitconfig"
alias ct='ctags -f .tags -R'
alias sl='gnome-screensaver-command -l'
alias h='head'

# grep
alias grep="\grep --color=auto -n -C 2"

# global alias
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less -X'
alias -g RT='RAILS_ENV=test'
alias -g RD='RAILS_ENV=development'
alias -g RP='RAILS_ENV=production'

# rm command to trash
alias rm="trash"

# show (ls & less)
alias s="${HOME}/dotfiles/scripts/show-linux"

# ls
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls -F --color"
alias l="ls -lh"
alias a="ls -a"
alias la="ls -lha"

# less
alias less="less -X"

# du
alias du="du -hs"

# diff
alias diff="colordiff -u"

# tmux
alias ta="tmux attach"

# update .zshrc
alias zr="vim $HOME/.zshrc && source $HOME/.zshrc"

# git
# alias git="hub"
alias g="git"
alias gup="git pull --rebase && git remote update --prune && git branch --merged | \grep -v '*' | xargs -I % git branch -d % && ct"
for command in $(\sed -ne '/^\[alias\]/,$p' ${HOME}/.gitconfig | \grep -v '\[alias\]' | \awk '{print $1}')
do
  alias "g${command}"="git ${command}"
done

# search ESSID
alias essid="iwlist wlan0 scan | \grep ESSID"

# irb to pry
alias irb='pry'

# show remaining battery
alias battery='acpi -b'

# xscreensaver
alias ss='xscreensaver-command -lock'

# pravete setting
[ -f ~/.zshrc.private ] && source ~/.zshrc.private

# karma用の設定
export CHROME_BIN='/usr/bin/google-chrome-beta'

# Python用
export PYTHONPATH='/usr/lib64/python2.7/site-packages'

# JsTestDriver
export JSTESTDRIVER_HOME=~/bin

# cdd ( http://blog.m4i.jp/entry/2012/01/26/064329 )
#autoload -Uz compinit
#compinit
#. ~/.zsh/cdd/cdd
#
#chpwd() {
#    _cdd_chpwd
#}

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'

# cd した直後に ls する。
# ( ファイルが多いときは省略表示する方法もあるが今は使ってない
#   http://qiita.com/yuyuchu3333/items/b10542db482c3ac8b059 )
chpwd() {
    ls -F --color
}

# 空 Enter で ls と git status を表示する
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls -F --color
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -s
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter
