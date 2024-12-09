#!/bin/bash

# vars
hyprDir=$HOME/.config/hypr
scriptDir=$hyprDir/scripts
configDir=$hyprDir/config

# wallpaper, nightlight, bar, idle, input
# swww-daemon --format xrgb &
# waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css
hyprpaper -c ~/.config/hypr/hyprpaper.conf &
mako -c ~/.config/mako/config &
fcitx5 -D &
hypridle &
hyprpm reload &
blueman-applet &
blueman-tray &
nm-applet --indicator &
nwggrid-server &
nwg-look -a &

# Core components (authentication, dbus)
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets) &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 || /usr/libexec/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --all &
sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE & # Some fix idk


# Clipboard: persist & history
wl-clip-persist --clipboard regular &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# Cursor, themes
$scriptDir/gtkthemes






  
