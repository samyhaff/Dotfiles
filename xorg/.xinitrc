#!/bin/sh

systemctl --user import-environment DISPLAY
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &
xset r rate 200 50 &
xset dpms 0 0 0 &
xset s 0 &
xrdb -merge $HOME/.Xresources
xsetroot -cursor_name left_ptr &

export PATH="$PATH:/home/samy/Coding/scripts"
export PATH="$PATH:/home/samy/.local/bin"
export GOPATH=/home/samy/Coding/go
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export READER="zathura"
export PAGER="less"

export SUDO_ASKPASS="/home/samy/Coding/scripts/dpass"
export QT_SCALE_FACTOR=0.7

xrandr | grep -q "HDMI-1 connected" && home

nm-applet &
dunst &
discord &
firefox &
TERMINAL &
xbanish &
slstatus &
~/.fehbg &
picom &

while type dwm >/dev/null ; do dwm && continue || break ; done
