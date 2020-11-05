#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#picom blur
# compton --blur-background --blur-method kawase --blur-strength 12 --opacity-rule 65:'class_g="discord","Alacritty"' --
picom --experimental-backend &
#Wallpaper
xwallpaper --center ~/Pictures/Wallpaper/wallpaper.png &
~/.config/bashconf/git-prompt.sh
#while true; do
#	dwm >/dev/null 2>&1
#done 
#exec dwm 
exec i3
