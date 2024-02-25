#!/usr/bin/zsh

# Predict
autoload -U predict-on
zle-line-init() { predict-on }
zle -N zle-line-init
zle -N predict-on
zle -N predict-off
zstyle ':predict' toggle true
zstyle ':predict' verbose true

# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
