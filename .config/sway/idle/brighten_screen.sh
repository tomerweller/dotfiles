#!/bin/bash
BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"
PREV=$(cat /tmp/prev_brightness)

echo "$PREV" > /sys/class/backlight/intel_backlight/brightness