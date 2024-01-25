#!/usr/bin/env sh

CONFIG="$HOME/.config/mako/config"

if [[ ! `pidof mako` ]]; then
	mako --config ${CONFIG}
fi
