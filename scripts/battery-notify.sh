#!/bin/bash

battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Only warn when discharging (not plugged in)
if [[ $battery_status == "Discharging" ]]; then
    if [[ $battery_level -le 15 ]]; then
        notify-send -u critical "⚠️ Battery Critical" "Only ${battery_level}% remaining! Plug in NOW!"
    elif [[ $battery_level -le 30 ]]; then
        notify-send -u normal "🔋 Battery Low" "Battery at ${battery_level}%. Consider plugging in soon."
    fi
fi
