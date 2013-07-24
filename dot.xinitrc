#!/bin/bash

# 画面の設定
xrandr --output eDP1 --mode 1024x768 --rate 60 --left-of HDMI1
xrandr --output HDMI1 --mode 1920x1080 --rate 60 --primary
xbacklight -set 25

# キーボード設定
xset r rate 150 80
setxkbmap -layout "us, se"
xmodmap ~/.xmodmaprc

# カーソル設定
# xrdb ~/.Xresources &

# 日本語入力
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
ibus-daemon -d -x

# 透明化の設定
xcompmgr &

# Dropbox起動
dropbox start -i &

exec awesome
