eval "$(dbus-launch --sh-syntax --exit-with-session)"

# 画面の設定
xrandr --output eDP1 --mode 1366x768 --below HDMI1
xrandr --output HDMI1 --mode 1920x1080 --rate 60 --primary
xbacklight -set 25

# 日本語入力
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
exec fcitx &

# キーボード設定
xset r rate 150 80
setxkbmap -layout "us, se"
xmodmap ~/.Xmodmaprc

# カーソル設定
# xrdb ~/.Xresources &

# タブレット設定
xsetwacom --set 17 Suppress 25

xsetwacom --set 'Wacom BambooFun 6x8 stylus' Suppress 15
xsetwacom --set 'Wacom BambooFun 6x8 eraser' Suppress 15
xsetwacom --set 'Wacom BambooFun 6x8 cursor' Suppress 15
xsetwacom --set 'Wacom BambooFun 6x8 pad'    Suppress 15

# 透明化の設定
xcompmgr &

# Dropbox起動
dropbox start -i &

# LAN
wicd-client -t &

exec awesome
