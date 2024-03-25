#!/bin/zsh

source /usr/local/bin/hl

# fzf - dracula theme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# env vars
export TERM='kitty'
export COLORTERM='truecolor'
export CLICOLOR=1
export VISUAL='alacritty -e nvim'
export EDITOR='alacritty -e nvim'
export SUDO_EDITOR='alacritty -e nvim'
export SYSTEM_EDITOR='alacritty -e nvim'
export BROWSER='vivaldi'
export PAGER='nvim +Man!'
export MANPAGER='nvim +Man!'

