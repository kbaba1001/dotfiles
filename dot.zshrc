# rbenv
eval "$(rbenv init -)"

# z ( https://github.com/rupa/z )
source ${HOME}/.zsh/z/z.sh

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

# ThinkPad x240 のバッテリー残量を表示
function show_battery() {
  local ac_adapter_status=`acpi -a | awk '{print $3}'`
  if [ ${ac_adapter_status} = 'off-line' ]; then
    local battery0=`acpi -b | awk '{print $4}' | head -n 1`
    local battery1=`acpi -b | awk '{print $4}' | tail -n 1`

    echo "\xf0\x9f\x94\x8b ${battery0}%%,${battery1}%"
  fi
}

PROMPT='%{$fg_bold[red]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}%{$fg_bold[cyan]%}%C%{$reset_color%}$(git_super_status)%{$reset_color%}%# '
RPROMPT='$(git_diff_shortstat_master)$(show_battery)%{$reset_color%}'

# bundle open & gem open
export BUNDLER_EDITOR='st -w'
export GEM_EDITOR='st -w'
export EDITOR='vim'

# keychain
keychain -q ${HOME}/.ssh/*.rsa

[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && source $HOME/.keychain/$HOSTNAME-sh-gpg

# git
alias g='git'
alias gup="git pull --rebase && git remote update --prune && git branch --merged | \grep -v -E \"(\*|master)\" | xargs -I % git branch -d % && ct"
for command in $(\sed -ne '/^\[alias\]/,$p' ${HOME}/.gitconfig | \grep -v '\[alias\]' | \awk '{print $1}')
do
  alias "g${command}"="git ${command}"
done

# ruby
alias bi='bundle install --without production -j4'
alias bu='bundle update'
alias be='bundle exec'
alias bo='bundle open'
alias ber='bundle exec rake'
alias brs='bundle exec rspec'
alias bra='bundle exec rails'
alias bcu='bundle exec cucumber'
alias -g RT='RAILS_ENV=test'
alias -g RD='RAILS_ENV=development'
alias -g RP='RAILS_ENV=production'
alias irb='pry'

# my dotfiles/scripts
alias brsd='rspec-git-diff'
alias rm='trash'
alias s='show-linux'

# halt
alias sd='sudo shutdown -h now'
alias halt='taisya && sudo shutdown -h now'

# short command
alias t='touch'
alias m='mkdir'
alias d='cd'
alias v='vim'
alias so='source'
alias vgc='vim ~/.gitconfig'
alias ct='ctags -f .tags -R'
alias sl='xscreensaver-command -lock'
alias h='head'
alias p='xsel --clipboard --output'
alias open='xdg-open'
alias dp='display'
alias f='feh'
alias agl='ag --pager 'less -X''
alias essid='iwlist wlan0 scan | \grep ESSID'
alias ta='tmux attach'
alias tc='tmux save-buffer - | xsel --clipboard --input'
alias zr="vim $HOME/.zshrc && source $HOME/.zshrc"
alias battery='acpi -b'

# global alias
alias -g G='| ag'
alias -g H='| head'
alias -g First='| head -n 1'
alias -g T='| tail'
alias -g Last='| tail -n 1'
alias -g L='| less -X'
alias -g CP='| xsel --clipboard --input'
alias -g RT='RAILS_ENV=test'
alias -g RD='RAILS_ENV=development'
alias -g RP='RAILS_ENV=production'

# over write
alias ls='ls -F --color'
alias less='less -XR'
alias grep='\grep --color=auto -n -E'

# ls
export LSCOLORS=gxfxcxdxbxegedabagacad
alias l='ls -lh'
alias a='ls -a'
alias la='ls -lha'
alias du='du -h'
alias diff='colordiff -u'

# color management
# http://sourceforge.net/mailarchive/forum.php?set=custom&viewmonth=&viewday=&forum_name=dispcalgui-users&style=nested&max_rows=75&submit=Change+View
XDG_DATA_DIRS=/opt/local:/usr/local

export PATH="$PATH:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/*/**/bin:$HOME/Dropbox/my/dotfiles/scripts:$HOME/bin:$HOME/Dropbox/my/bin:/sbin:"
export WORDCHARS="*?_-.[]~=&;#$%^(){}<>"
export JSTESTDRIVER_HOME=~/Dropbox/project/tdd_javascript

## Emacsライクキーバインド設定
bindkey -e

# case-sensitive completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'

function chpwd() {
    echo "$fg_bold[yellow]$PWD$reset_color"
    ls -F --color
}

# 空 Enter で ls と git status を表示する ( http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d )
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

# pravete setting
[ -f ~/.zshrc.private ] && source ~/.zshrc.private
