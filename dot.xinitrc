#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# 画面の設定
xrandr --output eDP1 --left-of HDMI1
xrandr --output eDP1 --mode 1024x768 --rate 60
xrandr --output HDMI1 --mode 1920x1080 --rate 60
xbacklight -set 25

# ibus 日本語入力
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
/usr/bin/ibus-daemon --xim -d &

# ターミナルの起動
mlterm &

# 透明化の設定
xcompmgr &

# キーボード設定
xset r rate 150 100
xmodmap ~/.xmodmaprc

# Dropbox起動
dropbox start -i &

# invoke global X session script
. /etc/X11/Xsession

