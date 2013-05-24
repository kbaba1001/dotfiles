#!/bin/bash

# 画面の設定
xrandr --output eDP1 --left-of HDMI1
xrandr --output eDP1 --mode 1024x768 --rate 60
xrandr --output HDMI1 --mode 1920x1080 --rate 60
xbacklight -set 25

# 日本語入力
export GTK_IM_MODULE=scim-bridge
export QT_IM_MODULE=scim-bridge
export XMODIFIERS="@im=SCIM"
#export LC_CTYPE=ja_JP.utf8
#/usr/bin/ibus-daemon --xim -d
scim -d &

# キーボード設定
xset r rate 150 80
xmodmap ~/.xmodmaprc

# ターミナルの起動
/usr/bin/terminator &

# 透明化の設定
# xcompmgr &

# Dropbox起動
# dropbox start -i &

exec awesome
