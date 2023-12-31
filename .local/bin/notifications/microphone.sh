#!/usr/bin/env bash

# Needed packages: pactl
# Usage: 
# Write path to this script in your WM config.
# 
# Example for i3wm / sway: 
# XF86AudioMicMute      exec ~/.local/bin/notifications/microphone.sh toggle

source ${HOME}/.local/bin/environment.sh

function send_notification {
    local is_muted 
    is_muted="$(wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle | sed 's/Mute: //')"

    if [ "$is_muted" == "yes" ]; then
        notify-send -i "$icon_microphone_muted" -u low -r 30 "Microphone muted"
    else
        notify-send -i "$icon_microphone" -u low -r 30 "Microphone unmuted"
    fi
}

case $1 in
    toggle) 
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        send_notification
        ;;
esac

