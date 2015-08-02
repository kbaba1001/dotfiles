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

# docker
eval "$(boot2docker shellinit)"

# peco search history
alias rhistory='history -n 1 | tail -r | uniq -u '

source "$HOME/Dropbox/my/dotfiles/dot.share_zshrc"
