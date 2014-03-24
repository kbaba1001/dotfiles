#!/bin/bash

xrandr --output HDMI1 --mode 1920x1080 --primary --output eDP1 --mode 1366x768 --below HDMI1
xbacklight -set 30

export XMODIFIERS="@im=uim-xim"
export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
exec uim-toolbar-gtk-systray &

xset r rate 150 80
xmodmap ~/.Xmodmap

exec xcompmgr &
exec wicd-client -t &
exec dropbox start -i &

exec terminator &
exec awesome
