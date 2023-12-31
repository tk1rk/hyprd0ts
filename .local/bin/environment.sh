#!/usr/bin/env mysh

current_theme="$(cat "$HOME"/.config/.current_theme)"

if [ "$current_theme" = "Dracula" ]; then

    icon_memory="$HOME/.local/bin/notifications/icons/memory.png"
    icon_bell="$HOME/.local/bin/notifications/icons/bell-notification.png"
    icon_alert="$HOME/.local/bin/notifications/icons/alert.png"
    icon_succes="$HOME/.local/bin/notifications/icons/succes.png"
    icon_screenshot="$HOME/.local/bin/notifications/icons/screenshot.png"
    icon_usb_drive="$HOME/.local/bin/notifications/icons/flash-drive.png"
    icon_palette="$HOME/.local/bin/notifications/icons/palette.png"
    icon_archive="$HOME/.local/bin/notifications/icons/archive.png"
    
    icon_wifi="$HOME/.local/bin/notifications/icons/wifi.png"
    icon_wifi_alert="$HOME/.local/bin/notifications/icons/wifi-alert.png"
    icon_wifi_error="$HOME/.local/bin/notifications/icons/wifi-error.png"

    icon_battery="$HOME/.local/bin/notifications/icons/battery.png"
    icon_battery_charging="$HOME/.local/bin/notifications/icons/battery-charging.png"
    icon_battery_critical="$HOME/.local/bin/notifications/icons/battery-critical.png"
    icon_battery_charged="$HOME/.local/bin/notifications/icons/battery-charged.png"
    icon_battery_low="$HOME/.local/bin/notifications/icons/battery-low.png"

    icon_brightness_full="$HOME/.local/bin/notifications/icons/brightness-full.png"
    icon_brightness_half="$HOME/.local/bin/notifications/icons/brightness-half.png"
    icon_brightness_low="$HOME/.local/bin/notifications/icons/brightness-low.png"

    icon_volume_high="$HOME/.local/bin/notifications/icons/volume-high.png"
    icon_volume_half="$HOME/.local/bin/notifications/icons/volume-half.png"
    icon_volume_mute="$HOME/.local/bin/notifications/icons/volume-mute.png"

    icon_microphone="$HOME/.local/bin/notifications/icons/microphone.png"
    icon_microphone_muted="$HOME/.local/bin/notifications/icons/microphone-muted.png"

    icon_mtp_desktop="$HOME/.local/bin/notifications/icons/mtp-desktop.png"
    icon_mtp_laptop="$HOME/.local/bin/notifications/icons/mtp-laptop.png"

    icon_package="$HOME/.local/bin/notifications/icons/package-update.png"

    rofi_theme_themes="$HOME/.config/rofi/themes/dracula.rasi"
    rofi_theme_clipboard="$HOME/.config/rofi/themes/dracula.rasi"
    rofi_theme_hyprland="$HOME/.config/rofi/themes/dracula.rasi"
    rofi_theme_apps="$HOME/.config/rofi/themes/dracula.rasi"
    rofi_theme_tools="$HOME/.config/rofi/themes/dracula.rasi"
    rofi_theme_wifi="$HOME/.config/rofi/themes/dracula.rasi"
    
fi


