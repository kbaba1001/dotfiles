# peco search history
alias rhistory='history -n 1 | tail -r | uniq -u '

source "$HOME/Dropbox/my/dotfiles/dot.share_zshrc"

# z ( https://github.com/rupa/z )
. `brew --prefix`/etc/profile.d/z.sh

# bundle open & gem open
export BUNDLER_EDITOR='atom'
export GEM_EDITOR='atom'
export EDITOR='vim'

# my dotfiles/scripts
alias s='show-mac'

alias -g CP='| pbcopy'

# ls
alias ls='ls -FG'

# locate
alias updatedb='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'

# global alias
alias -g CP='| pbcopy'

# docker
#eval "$(boot2docker shellinit)"
# `boot2docker up` が必要
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/kbaba/.boot2docker/certs/boot2docker-vm

# postgresql
export PGDATA=/usr/local/var/postgres

# PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# irb や pry で日本語入力できるようにするための対応
# http://qiita.com/kidach1/items/d0137d96bed9ac381fd5
export RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline)"

# ctrl-g で ghq のリポジトリを検索してcdする
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src


