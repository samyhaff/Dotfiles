#!/bin/sh

xrdb -merge $HOME/.Xresources

setxkbmap fr
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &

xset r rate 200 50 &
xset dpms 0 0 0 &
xset s 0 &

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export READER="zathura"
export PAGER="less"
export BROWSER="firefox"
export SUDO_ASKPASS="$HOME/bin/dpass"

xrandr | grep -q "HDMI-A-0 connected" && monitor extend

pulseaudio &
dwmblocks &
xbanish &
firefox &
# discord &
~/.fehbg &
picom &

while type dwm >/dev/null ; do dwm && continue || break ; done
