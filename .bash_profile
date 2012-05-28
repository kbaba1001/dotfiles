source ~/dotfiles/.private_bash_profile

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/*/*/bin:$PATH"
eval "$(rbenv init -)"

### prompt's setting ##################
# https://gist.github.com/1668822
# prompt with ruby version
__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version`
  short_version=${rbenv_ruby_version#?.}
  short_short_version=${short_version%-*}
  printf $short_short_version
}

# prompt with git branch name
source /usr/local/Cellar/git/1.7.10/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# prompt
if [ `which rbenv` ]; then
  export PS1='\[\033[31m\]$(__rbenv_ps1)\[\033[32m\]$(__git_ps1)\[\033[33m\]\W\[\033[00m\]\$ '
else
  export PS1='\[\033[32m\]$(__git_ps1)\[\033[33m\]\W\[\033[00m\]\$ '
fi
### end prompt's setting ##################

# ls
# http://d.hatena.ne.jp/yamazaru_rengou/20090119/1232373540
# export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls -GF"

#bash short
alias t='touch'
alias m='mkdir'
alias ll='ls -l'

#syntax for less
#@see http://c-brains.jp/blog/wsg/07/12/07-033558.php
alias pless="/usr/bin/less"
alias less="/usr/share/vim/vim73/macros/less.sh"

#gui application
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

#KeyRemap4MacBook
alias keyconfig="subl /Users/babakazuki/Library/Application\ Support/KeyRemap4MacBook/private.xml -n"

#locate
alias updatedb="/usr/libexec/locate.updatedb"

#git short
alias g="git"
alias gc="git add -A . ; git commit"
alias gcm="git add -A . ; git commit -m"

#ruby, rails short
alias ru='ruby'
alias r='rails'
alias be='bundle exec'
alias ber='bundle exec rspec'

#RSpec
alias rspec="rspec -c"

# Ruby 1.8記法のHashをRuby 1.9記法に変換する正規表現。
# 同名のファイルに上書き保存される。
# http://robots.thoughtbot.com/post/17450269990/convert-ruby-1-8-to-1-9-hash-syntax
alias chhash="perl -pi -e 's/([^\w^:]):([\w\d_]+)\s*=>/\1\2:/g'"

#postgreSQL's PATH
export PATH=/usr/local/bin:$PATH
