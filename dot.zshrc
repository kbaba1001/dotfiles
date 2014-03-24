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
export PATH="$PATH:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/*/**/bin:$HOME/Dropbox/my/dotfiles/scripts:$HOME/bin:$HOME/Dropbox/my/bin:/sbin:"
export WORDCHARS="*?_-.[]~=&;#$%^(){}<>"

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
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}\xF0\x9F\x8D\xB6 "
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[gray]%}\xF0\x9F\x91\xBD "
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[yellow]%}\xF0\x9f\x8d\xba "
ZSH_THEME_GIT_PROMPT_REMOTE=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}\xF0\x9F\x8D\xB7 "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%}\xF0\x9F\x8D\xA3 "

function git_diff_shortstat_master() {
  gitdir=`git rev-parse --git-dir 2>/dev/null`
  if [ -n "${gitdir}" ]; then
    #git --no-pager diff --shortstat master | awk '{print "+" $4 "-" $6}'
    #git --no-pager diff --shortstat master | ruby -ne '$_.match(/(\d+)\D*(\d+)\D*(\d+)/); print "#{$2} #{$3}"'
    diff_shortstat=`git --no-pager diff --shortstat master`
    file_count=`echo "${diff_shortstat}" | awk '{print "\xF0\x9F\x92\xBE " $1}'`
    plus_lines=`echo "${diff_shortstat}" | awk '{print "+" $4}'`
    minus_lines=`echo "${diff_shortstat}" | awk '{print "-" $6}'`

    echo "[%{$fg_bold[magenta]%}${file_count}%{$fg_bold[green]%}${plus_lines}%{$fg_bold[red]%}${minus_lines}%{$reset_color%}]"
  fi
}

function show_battery() {
  local ac_adapter_status=`acpi -a | awk '{print $3}'`
  if [ ${ac_adapter_status} = 'off-line' ]; then
    local battery0=`acpi -b | awk '{print $4}' | head -n 1`
    local battery1=`acpi -b | awk '{print $4}' | tail -n 1`

    echo "[\xf0\x9f\x94\x8b ${battery0}%%,${battery1}%]"
  else
    echo "\xf0\x9f\x94\x8c"
  fi
}

PROMPT='%{$fg_bold[red]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}%{$fg_bold[cyan]%}%C%{$reset_color%}$(git_super_status)%{$reset_color%}%# '
RPROMPT='$(git_diff_shortstat_master)$(show_battery)%{$reset_color%}'

# history に時刻を表示する
export HISTTIMEFORMAT='%Y-%m-%d %T '

# bundle open & gem open
export BUNDLER_EDITOR="st -w"
export GEM_EDITOR="st -w"
export EDITOR="vim"

# z ( https://github.com/rupa/z )
source ${HOME}/.zsh/z/z.sh

# keychain
# keychain -q ${HOME}/.ssh/*.rsa

[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && source $HOME/.keychain/$HOSTNAME-sh-gpg

# gem open & bundle open
alias bi="bundle install --without production"
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

# rspec-git-diff (my dotfiles/scripts)
alias brsd="rspec-git-diff"

# halt
alias halt='taisya && sudo halt'

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
alias p='xsel --clipboard --output'
alias open='xdg-open'
alias dp='display'

# firefox
alias firefox='iceweasel'

# grep
alias grep="\grep --color=auto -n -C 2 -E"

# global alias
alias -g G='| ag'
alias -g H='| head'
alias -g L='| less -X'
alias -g CP='| xsel --clipboard --input'
alias -g RT='RAILS_ENV=test'
alias -g RD='RAILS_ENV=development'
alias -g RP='RAILS_ENV=production'

# rm command to trash
alias rm="trash"

# show (ls & less)
alias s="show-linux"

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
alias tc="tmux save-buffer - | xsel --clipboard --input"

# update .zshrc
alias zr="vim $HOME/.zshrc && source $HOME/.zshrc"

# git
# alias git="hub"
alias g="git"
alias gup="git pull --rebase && git remote update --prune && git branch --merged | \grep -v -E \"(\*|master)\" | xargs -I % git branch -d % && ct"
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
export JSTESTDRIVER_HOME=~/Dropbox/tdd_javascript/

# color management
# http://sourceforge.net/mailarchive/forum.php?set=custom&viewmonth=&viewday=&forum_name=dispcalgui-users&style=nested&max_rows=75&submit=Change+View
XDG_DATA_DIRS=/opt/local:/usr/local

# cdd ( http://blog.m4i.jp/entry/2012/01/26/064329 )
# autoload -Uz compinit
# compinit
# . ~/.zsh/cdd/cdd

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'

chpwd() {
    # cd した直後に ls する。
    # ( ファイルが多いときは省略表示する方法もあるが今は使ってない
    #   http://qiita.com/yuyuchu3333/items/b10542db482c3ac8b059 )
    echo "$fg_bold[yellow]$PWD$reset_color"
    ls -F --color

    # cdd
    # _cdd_chpwd
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
        echo -e "\e[0;33m*** git status ***\e[0m"
        git status -s
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

# rbenv rehash ( http://rhysd.hatenablog.com/entry/20120226/1330265121 )
function gem(){
    $HOME/.rbenv/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
        rehash
    fi
}
