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

export PATH=/home/kyle/.local/bin/statusScripts:$PATH
export PATH=/home/kyle/.local/bin:$PATH

xrandr --output DP-0 --rate 144.00 --rotate right &
xrandr --output HDMI-0 --rate 144.00 --left-of DP-0 --primary &
picom --experimental-backend &
~/.config/bashconf/git-prompt.sh
setxkbmap dvorak -option "grp:alt_space_toggle"
nitrogen --restore &
xsetwacom set "Wacom Intuos S Pad pad" Button 2 "key +ctrl d -ctrl"
xsetwacom set "Wacom Intuos S Pad pad" Button 1 "key +ctrl z -ctrl"
~/.local/src/scripts/change_key.sh

ibus-daemon -d &
dwmblocks &
~/.local/bin/restartdwm.sh
