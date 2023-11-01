# My dwm config

### Requirements
- xorg-server
- xorg-xsetroot
- playerctl
- light
- scrot
- acpi

### My .xinitrc:

```
#!/bin/sh

# status bar things
status (){
    echo -n " $(acpi | awk '{print $4}' | sed s/,//) | $(date '+%Y-%m-%d | %H:%M') "
}

# xrandr second monitor connected
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
exec dwm

```

