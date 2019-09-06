#!/bin/bash
~/.config/sway/idle/inhibitors/pulse.sh || exit 1
echo "$(date) dim_screen.sh running" >> /tmp/brightness.log

# inhibited by AC or pulse?
~/.config/sway/idle/inhibitors/ac.sh || exit 1

BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"
MAX_BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/max_brightness"
MAX=$(cat $MAX_BRIGHTNESS_FILE)
cat $BRIGHTNESS_FILE > /tmp/prev_brightness

let IDLE_BRIGHTNESS=$MAX/10 # 10%

echo "$IDLE_BRIGHTNESS" > /sys/class/backlight/intel_backlight/brightness
