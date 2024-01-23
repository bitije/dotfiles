#!/bin/sh

# status bar things
status (){ 
    echo -n " $( (echo "$(acpi)" | grep -oP '([0-9]%|[1-9][0-9]%|100%)')) | $(date '+%Y-%m-%d | %H:%M') " 
}

# refresh status bar
while true; do
    xsetroot -name "$(status)"
    sleep 1m 
done &

# xrandr second if display connected
if xrandr | grep -q 'HDMI-A-0 connected' ; then
    xrandr --output HDMI-A-0 --same-as eDP;
fi

export PATH=$PATH:/home/w/bin

# off screen dimming
xset s off
xset s noblank
xset -dpms

eval $(ssh-agent)
eval $(warpd)
clipmenud&
(/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1)&

systemctl --user import-environment DISPLAY
feh --bg-fill /home/$(whoami)/Downloads/123.png

exec dbus-launch dwm
