#!/bin/bash

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

xrdb -load ~/.Xresources

fcitx5 &
nm-applet &
clipmenud &
slack &
brave-browser-stable &
urxvt &

exec i3
