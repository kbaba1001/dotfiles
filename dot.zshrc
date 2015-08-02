# z ( https://github.com/rupa/z )
source ${HOME}/.zsh/z/z.sh

# Terminal lang
# LANG=en_US.UTF-8

# editor
alias st='subl'

# bundle open & gem open
export BUNDLER_EDITOR='subl'
export GEM_EDITOR='subl'
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

alias -g CP='| xsel --clipboard --input'

# ls
alias ls='ls -F --color --group-directories-first'

# peco search history
alias rhistory='history -n 1 | tac | uniq -u '

source "$HOME/Dropbox/my/dotfiles/dot.share_zshrc"
