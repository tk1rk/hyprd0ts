#!/bin/bash

## Set GTK Themes, Icons, Cursor and Fonts

THEME='Dracula'
ICONS='Papirus-Dark'
FONT='MesloLGS Nerd Font 12'
CURSOR='ArchCursorComplete'
CURSOR_SIZE='24'

SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes() {
  ${SCHEMA} gtk-theme "$THEME"
  ${SCHEMA} icon-theme "$ICONS"
  ${SCHEMA} cursor-theme "$CURSOR"
  ${SCHEMA} cursor-size "$CURSOR_SIZE"
  ${SCHEMA} font-name "$FONT"
}

apply_themes
