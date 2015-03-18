#ZSH=$HOME/.oh-my-zsh
#CASE_SENSITIVE='true'
#DISABLE_AUTO_UPDATE='true'
#DISABLE_AUTO_TITLE='true'
#DISABLE_CORRECTION='true'
#source $ZSH/oh-my-zsh.sh

# prezto (https://github.com/sorin-ionescu/prezto)
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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

# ThinkPad x240 のバッテリー残量を表示
function show_battery() {
  local ac_adapter_status=`acpi -a | awk '{print $3}'`
  if [ ${ac_adapter_status} = 'off-line' ]; then
    local battery0=`acpi -b | awk '{print $4}' | head -n 1`
    local battery1=`acpi -b | awk '{print $4}' | tail -n 1`

    echo "${battery0}%%,${battery1}%"
  fi
}

PROMPT='%{$fg_bold[red]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}%{$fg_bold[cyan]%}%C%{$reset_color%}$(git_super_status)%{$reset_color%}%# '
RPROMPT='$(show_battery)%{$reset_color%}'

# editor
alias st='subl'

# bundle open & gem open
export BUNDLER_EDITOR='subl'
export GEM_EDITOR='subl'
export EDITOR='vim'

# atomがうまく動かないので対策。これで直るかどうか不明...
# https://code.google.com/p/chromium/wiki/LinuxSUIDSandboxDevelopment
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

# keychain
keychain -q ${HOME}/.ssh/*.rsa

[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && source $HOME/.keychain/$HOSTNAME-sh-gpg

# git
alias g='git'
alias gup="git pull --rebase && git remote update --prune && git branch --merged | \grep -v -E \"(\*|master)\" | xargs -I % git branch -d %"
for command in $(\sed -ne '/^\[alias\]/,$p' ${HOME}/.gitconfig | \grep -v '\[alias\]' | \awk '{print $1}')
do
  alias "g${command}"="git ${command}"
done

# ctags
alias ct='ctags -R -f .tags'
alias ctg='ctags -R -f .gemtags `bundle show --paths`'

# ruby
alias bi='bundle install --without production -j4'
alias bu='bundle update'
alias be='bundle exec'
alias bo='bundle open'
alias ber='bundle exec rake'
alias brs='bundle exec rspec'
alias bra='bundle exec rails'
alias bcu='bundle exec cucumber'
alias bem='bundle exec middleman'
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

# short command
alias m='mkdir'
alias mp='mkdir -p'
alias d='cd'
alias v='vagrant'
alias so='source'
alias vgc='vim ~/.gitconfig'
alias sl='xscreensaver-command -lock'
alias h='head'
alias p='xsel --clipboard --output'
alias open='xdg-open'
alias f='feh -.'
alias za='zathura'
alias i='identify'
alias ag='ag -S --pager "less -XF"'
alias essid='iwlist wlan0 scan | \grep ESSID'
alias t='touch'
alias ta='tmux attach'
alias tc='tmux save-buffer - | xsel --clipboard --input'
alias zr="vim $HOME/.zshrc && source $HOME/.zshrc"
alias battery='acpi -b'
alias _='sudo'
alias up='sudo aptitude update && sudo aptitude upgrade -y'
alias cal='cal -3'
alias fm='pcmanfm' #ファイルマネージャ ( file manager )
alias pingg='ping www.google.com'
alias now='date +%Y%m%d%H%M%S'
alias today='date +%Y%m%d'
alias n='nano'

# global alias
alias -g G='| ag'
alias -g H='| head'
alias -g FIRST='| head -n 1'
alias -g T='| tail'
alias -g LAST='| tail -n 1'
alias -g L='| less -X'
alias -g CP='| xsel --clipboard --input'
alias -g P='| peco'
alias -g X='| xargs'
alias -g M='--help | less -X'

# over write
alias ls='ls -F --color'
alias less='less -XF'
alias grep='\grep --color=auto -n -E'
alias crontab='crontab -i'
alias pwgen='pwgen -s'

# ls
export LSCOLORS=gxfxcxdxbxegedabagacad
alias l='ls -lh'
alias a='ls -a'
alias la='ls -lha'
alias du='du -h'
alias du1='du -h -d 1'
alias dus='\du -d 1 | sort -nr'
alias diff='colordiff -u'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# color management
# http://sourceforge.net/mailarchive/forum.php?set=custom&viewmonth=&viewday=&forum_name=dispcalgui-users&style=nested&max_rows=75&submit=Change+View
XDG_DATA_DIRS=/opt/local:/usr/local

# 環境変数
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/*/**/bin:$HOME/Dropbox/my/dotfiles/scripts:$HOME/bin:$HOME/Dropbox/my/bin:/sbin:/usr/local/heroku/bin:$PATH:"
export WORDCHARS="*?_-.[]~=&;#$%^(){}<>"
export JSTESTDRIVER_HOME=~/Dropbox/project/tdd_javascript

bindkey -e           # Emacsライクキーバインド設定
setopt AUTO_PUSHD    # `cd -<Tab>` や `cd +<Tab>` を使えるようにする
setopt extended_glob # 拡張ファイルグロブが有効になり、正規表現として '#'、'~'、'^'が特別扱いになる。
stty stop undef      # Ctrl+s でロックしないようにする

# zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'

# cdした後の処理
function chpwd() {
    echo "$fg_bold[yellow]$PWD$reset_color"
    ls -F --color
}

# 空 Enter で $PWD と ls と git status を表示する ( http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d )
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    echo "$fg_bold[yellow]$PWD$reset_color"
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

# z の履歴を peco で検索して cd する関数
zcd() {
  cd $(awk -F '|' '{print $1}' ~/.z | peco | head -n 1)
}

# peco で histry を検索 ( http://qiita.com/comutt/items/f54e755f22508a6c7d78 )
peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# rbenv
eval "$(rbenv init -)"

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
