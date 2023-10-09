#!/bin/sh

source ./scripts/settings.sh

BRIGHTNESS=$(cat /sys/class/backlight/$BACKLIGHT_DEVICE/brightness)
MAX_BRIGHTNESS=$(cat /sys/class/backlight/$BACKLIGHT_DEVICE/max_brightness)

echo $(awk -vn="$BRIGHTNESS" -vm="$MAX_BRIGHTNESS" 'BEGIN{printf "%3.0f\n", n * 100 / m }')
