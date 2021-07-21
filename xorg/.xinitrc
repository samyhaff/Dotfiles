#!/bin/sh

systemctl --user import-environment DISPLAY
# setxkbmap -option caps:escape &
setxkbmap -option 'caps:ctrl_modifier' & 
xcape -e 'Caps_Lock=Escape' &
xset r rate 300 50 &
xset dpms 0 0 0 &
xset s 0 &
xrdb -merge $HOME/.Xresources
xsetroot -cursor_name left_ptr &

export PATH="$PATH:/home/samy/Coding/scripts"
export PATH="$PATH:/home/samy/.local/bin"
export GOPATH=/home/samy/Coding/go
export EDITOR="nvim"
export VISUAL="gedit"
export TERMINAL="st"
export READER="zathura"
export PAGER="less"

fg=$(colorsXresources dunst.foreground)
bg=$(colorsXresources dunst.background)
fr=$(colorsXresources dunst.frame)

[ $(xrandr | grep "HDMI-1 connected " | awk '{ print$1 }') = "HDMI-1" ] && homemonitor

nm-applet &
dunst -config ~/.config/dunst/dunstrc -lb "$bg" -nb "$bg" -cb "$bg" -lf "$fg" -bf "fg" -cf "$fg" -nf "$fg" -frame_color "$fr" &
discord &
firefox &
TERMINAL &
xbanish &
slstatus &
~/.fehbg &
# calcurse --daemon &
picom &

# if dwm exits 0, restart -- this allows hot reloading of config.h
while type dwm >/dev/null ; do dwm && continue || break ; done
