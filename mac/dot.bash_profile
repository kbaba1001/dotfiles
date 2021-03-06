source ~/.bash_profile.private

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/*/*/bin:$PATH"
eval "$(rbenv init -)"

### prompt's setting ##################
# https://gist.github.com/1668822
# prompt with ruby version
__rbenv_ps1 ()
{
  version_string=$(rbenv version | cut -c 1-5)
  case $version_string in
    2.0.0) version_string="2.0" ;;
    1.9.3) version_string="9.3" ;;
    1.9.2) version_string="9.2" ;;
    *)     version_string=${version_string#?.} ;;
  esac
  printf $version_string
}

# prompt with git branch name
source ~/dotfiles/git/git-completion.bash
source ~/dotfiles/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true

# prompt
export PROMPT_COMMAND='__git_ps1 "" "\[\e[1;33m\]\W\[\e[0m\]\$ " "\[\e[1;32m\](%s\[\e[1;32m\])"'
### end prompt's setting ##################

# ls
# http://d.hatena.ne.jp/yamazaru_rengou/20090119/1232373540
# export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -FG'
alias l='ls -lh'
alias a='ls -a'
alias la='ls -alh'

# syntax for less
# @see http://c-brains.jp/blog/wsg/07/12/07-033558.php
alias less="/usr/share/vim/vim73/macros/less.sh"

# grep
alias grep='grep --color=auto -n'

# show
# showは引数がディレクトリならls, ファイルならlessするスクリプト
alias s='show-mac'

# rm
# trashは削除する代わりに.Trash(ゴミ箱)にファイルを移動する。実態は単なるmv
alias rm='trash'
alias rr='\rm -r'
alias rf='\rm -fr'

# diff
alias diff='colordiff'

#bash short
alias t='touch'
alias m='mkdir'
alias mp='mkdir -p'
alias d='cd'
alias bp='vim ~/.bash_profile ; source ~/.bash_profile'
alias tree='tree -C'
alias ct='ctags -R -f .tags'
alias ta='tmux attach'
alias so='source'

#gui application
alias st="/usr/local/bin/subl"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias gimp='/Applications/GIMP.app/Contents/MacOS/GIMP'

#KeyRemap4MacBook
alias keyconfig="st /Users/babakazuki/Library/Application\ Support/KeyRemap4MacBook/private.xml -n"

#locate
alias updatedb="sudo /usr/libexec/locate.updatedb"

#git short
alias git="hub"  # https://github.com/defunkt/hub
alias g="git"
alias gg='git grep -n'
alias gbc="git branch --merged | grep -v '*' | xargs -I % git branch -d %"
alias gup="git pull --rebase ; git remote update --prune ; gbc ; git fetch --tags ; ctags -R -f .tags"
for command in $(\sed -ne '/^\[alias\]/,$p' ${HOME}/.gitconfig | \grep -v '\[alias\]' | \awk '{print $1}')
do
  alias "g${command}"="git ${command}"
done

#ruby, rails short
alias ru='ruby'
alias r='rails'
alias bi='bundle install'
alias bu='bundle update'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bra='bundle exec rails'
alias brs='bundle exec rspec'
alias bec='bundle exec cucumber'
alias irb='pry'
alias spr='spring rake'
alias sps='spring rspec'
alias spc='spring cucumber -c'

# Ruby 1.8記法のHashをRuby 1.9記法に変換する正規表現。
# 同名のファイルに上書き保存される。
# http://robots.thoughtbot.com/post/17450269990/convert-ruby-1-8-to-1-9-hash-syntax
alias chhash="perl -pi -e 's/([^\w^:]):([\w\d_]+)\s*=>/\1\2:/g'"

#postgreSQL's PATH
export PATH=/usr/local/bin:$PATH

# perl
export PATH=$HOME/.cpanm/work/*/:$PATH

# JsTestDriver
# JavaScriptのテストフレームワーク
export JSTESTDRIVER_HOME=~/bin

# bundle open & gem open
export BUNDLER_EDITOR="/usr/local/bin/subl"
export GEM_EDITOR="/usr/local/bin/subl"

# nano
alias nano="/usr/local/bin/nano"

# my scripts's PATH
export PATH=$HOME/dotfiles/scripts/:$PATH

# z (https://github.com/rupa/z)
. `brew --prefix`/etc/profile.d/z.sh
