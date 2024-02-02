#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/apps"
theme='launcher'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
