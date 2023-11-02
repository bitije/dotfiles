#!/bin/sh

# status bar things
status (){
    echo -n " $( (echo "$(acpi)" | grep -oP '([1-9][0-9]%|100%)') | sed s/,//) | $(date '+%Y-%m-%d | %H:%M') "
}

# xrandr second display connected
if xrandr | grep -q 'HDMI-A-0 connected' ; then
    xrandr --output HDMI-A-0 --same-as eDP;
fi

# refresh status bar
while true; do
    xsetroot -name "$(status)"
    sleep 1m 
done &

# off screen dimming
xset s off
xset s noblank
xset -dpms

eval $(ssh-agent)
eval $(warpd)
feh --bg-center /home/$(whoami)/wp.png
exec dbus-launch dwm
