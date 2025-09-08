#!/bin/bash

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

xrdb -load ~/.Xresources

source ~/.input-device

exec fcitx5 &
exec nm-applet &
exec i3
