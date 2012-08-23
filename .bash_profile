source ~/dotfiles/.private_bash_profile

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
    1.9.3) version_string="(v*╹◡╹)v" ;;
    1.9.2) version_string="(´_ゝ\`)" ;;
    *)     version_string=${version_string#?.} ;;
  esac
  printf $version_string
}


# prompt with git branch name
source /usr/local/Cellar/git/1.7.10/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# prompt
export PS1='\[\033[1;31m\]$(__rbenv_ps1)\[\033[0;32m\]$(__git_ps1)\[\033[33m\]\W\[\033[00m\]\$ '
### end prompt's setting ##################

# Ellie
alias hi='echo "(v*╹◡╹)v < hi, わたしエリー。happy ?"'
alias happy='echo "(v*╹◡╹)v < ウフフ ダブルピース!!!"'
alias hello='echo "(v*╹◡╹)v < hello. コーヒーでも飲んでリラックスしたら？"'
alias にゃんにゃん='echo "(v*╹◡╹)v < 酔いを覚ましてください"'
alias ほむほむ='echo "(v*╹◡╹)v < ほむほむ"'


# ls
# http://d.hatena.ne.jp/yamazaru_rengou/20090119/1232373540
# export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -FG'
alias l='ls -lh'

# syntax for less
# @see http://c-brains.jp/blog/wsg/07/12/07-033558.php
alias pless='/usr/bin/less'
alias less="/usr/share/vim/vim73/macros/less.sh"

# show
# showは引数がディレクトリならls, ファイルならlessするスクリプト
alias s='/usr/local/bin/show'

# rm
# trashは削除する代わりに.Trash(ゴミ箱)にファイルを移動する。実態は単なるmv
alias rm='/usr/local/bin/trash'
alias prm='/bin/rm'
alias rr='rm -r'
alias rf='rm -fr'

#bash short
alias t='touch'
alias m='mkdir'
alias mp='mkdir -p'  #サブディレクトリを一気に作成する
alias d='cd'
alias grep='grep -n -r'
alias bp='nano ~/.bash_profile ; source ~/.bash_profile'
alias tr='tree | less'


#gui application
alias st="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

#KeyRemap4MacBook
alias keyconfig="st /Users/babakazuki/Library/Application\ Support/KeyRemap4MacBook/private.xml -n"

#locate
alias updatedb="sudo /usr/libexec/locate.updatedb"

#git short
alias git="hub"  # https://github.com/defunkt/hub
alias g="git"
alias gc="git add . -A ; git commit"
alias gcm="git add . -A ; git commit -m"
alias ga="git commit --amend"
alias gaa="git add . -A ; git commit --amend"

#ruby, rails short
alias ru='ruby'
alias r='rails'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bec='bundle exec cucumber'
alias irb='pry'

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
