# peco search history
alias rhistory='history -n 1 | tac | uniq -u '

source "$HOME/Dropbox/my/dotfiles/dot.share_zshrc"

# z ( https://github.com/rupa/z )
source ${HOME}/.zsh/z/z.sh

# Terminal lang
# LANG=en_US.UTF-8

# bundle open & gem open
export BUNDLER_EDITOR='atom'
export GEM_EDITOR='atom'
export EDITOR='vim'

# keychain
keychain -q ${HOME}/.ssh/*.rsa

[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && source $HOME/.keychain/$HOSTNAME-sh-gpg

# shutdown
alias sd='sudo shutdown -h now'
alias sr='sudo shutdown -r now'

# short command
alias cal='cal -3'
alias s='show-linux'
alias sl='screen_lock'
alias open='xdg-open'
alias f='feh -.'
alias za='zathura'
alias essid='iwlist wlan0 scan | \grep ESSID'
alias wifi='nmcli device wifi'
alias battery='acpi -b'
alias up='sudo apt update && sudo apt upgrade -y'
alias fm='pcmanfm' #ファイルマネージャ ( file manager )

# docker-compose
alias dc='docker-compose'
alias dcb='docker-compose run web bundle exec'

# global alias
alias -g CP='| xsel --clipboard --input'

# ls
alias ls='ls -F --color --group-directories-first'

# PATH
#export PATH="$HOME/Dropbox/my/bin:$PATH"

# ghq風
ghq-get() {
  git clone "git@github.com:$1.git" "$HOME/github_repos/$1"
}

function peco-ghq-fu () {
  local selected_dir=$(find $HOME/github_repos/ -maxdepth 2 -mindepth 2 | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ghq-fu
bindkey '^g' peco-ghq-fu

