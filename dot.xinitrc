#!/bin/bash

[ -f ~/.display ] && . ~/.display
#xrandr --output HDMI1 --mode 1920x1080 --primary --output eDP1 --mode 1366x768 --below HDMI1
#xbacklight -set 30

xset r rate 150 80
xmodmap ~/.Xmodmap
#xmodmap ~/Dropbox/my/dotfiles/escher.xmodmap

export OOO_FORCE_DESKTOP="gnome"

export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
exec uim-xim &
export XMODIFIERS="@im=uim"
exec uim-toolbar-gtk3-systray &

exec xcompmgr &
exec wicd-client -t &
exec xscreensaver &
exec dropbox start -i &
exec clipit &
exec google-chrome --no-startup-window &
exec terminator &
exec awesome
