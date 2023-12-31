#!/bin/sh
# From https://wiki.hyprland.org/Useful-Utilities/Status-Bars/#configuration

hyprctl monitors -j | jq --raw-output '.[] | select(.focused) | .activeWorkspace.id'
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/{print $2}' -e '/^focusedmon>>/{print $3}'
