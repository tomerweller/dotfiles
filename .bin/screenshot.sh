#!/bin/bash
grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') ~/screenshots/$(date +'%Y-%m-%d-%H%M%S.png')
xdg-open ~/screenshots/$(date +'%Y-%m-%d-%H%M%S.png') &