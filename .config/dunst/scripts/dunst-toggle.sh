#!/bin/bash

STATUS=$(dunstctl is-paused)

if ${STATUS} == "true"; then
    dunstctl set-paused false
    echo ${HOME}/.config/dunst/assets/notifications.svg
    notify-send --app-name=Dunst --icon=Notifications --category=Notifications "Disabled Do not disturb." "Done, notifications are now live again."
else
    dunstctl set-paused true
    echo ${HOME}/.config/dunst/assets/dnd.svg
fi