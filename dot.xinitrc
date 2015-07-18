#!/bin/bash

[ -f ~/.display ] && . ~/.display
[ -f ~/.input_device ] && source ~/.input_device
[ -f ~/.xinitrc.private ] && source ~/.xinitrc.private

export OOO_FORCE_DESKTOP="gnome"

export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
exec uim-xim &
export XMODIFIERS="@im=uim"
exec uim-toolbar-gtk3-systray &

exec xcompmgr &
exec xbindkeys &
exec nm-applet &
exec xautolock -time 10 -locker screen_lock &
exec dropbox start -i &
exec clipit &
exec google-chrome --no-startup-window &
exec terminator &
exec feh --bg-scale ~/Dropbox/wallpapers/jetpack_octocat1.jpg &
#exec awesome
exec i3
