#!/bin/bash

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5


fcitx5 &
nm-applet &
clipmenud &
dunst &

xrdb -load ~/.Xresources
pulseaudio -D
bash .screenlayout/default.sh

exec i3
