#!/bin/sh

systemctl --user import-environment DISPLAY
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &
xset r rate 200 50 &
xset dpms 0 0 0 &
xset s 0 &
xrdb -merge $HOME/.Xresources
xsetroot -cursor_name left_ptr &

export PATH="$PATH:/home/samy/bin"
export PATH="$PATH:/home/samy/.local/bin"
export GOPATH=/home/samy/Coding/go
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export READER="zathura"
export PAGER="less"
export BROWSER="firefox"

export SUDO_ASKPASS="/home/samy/Coding/scripts/dpass"
export AWT_TOOLKIT=MToolkit
# export QT_SCALE_FACTOR=0.7

xrandr | grep -q "HDMI-1 connected" && monitor extend
# discord &
firefox &
TERMINAL &
xbanish &
slstatus &
~/.fehbg &
picom &

while type dwm >/dev/null ; do dwm && continue || break ; done
