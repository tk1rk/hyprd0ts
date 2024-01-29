#!/usr/bin/env zsh


#### xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DOWNLOADS_HOME="$HOME/Downloads"
export XDG_DOCUMENTS_HOME="$HOME/Documents"
export XDG_MUSIC_HOME="$HOME/Music"
export XDG_PICTURES_HOME="$HOME/Pictures"

#### ZSH
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_CACHE="$HOME/.cache/zsh"

### Create cache and completions dir and add to $fpath ###
fpath+=('$HOME/.cache/zsh/completions')
_comp_options+=(globdots)

# Editor + Others
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"
export PAGER="nvim +Man!"
export BROWSER="vivaldi-stable"

export EXA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

# # configure nvim as manpager (requires neovim-remote)
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ] || [ -n "${NVIM+x}" ]; then
    export MANPAGER="nvim -c 'Man!' -o -"
  else
    export MANPAGER="nvim -c 'Man!'"
fi

### Path ###
path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/Applications")
path+=("$HOME/.config")
export PATH

### TERMINAL ###
export TERMINAL="alacritty"
export COLORTERM="truecolor"
export CLICOLOR=1

### LANG ###
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# misc
export WORDCHARS='~!#$%^&*(){}[]<>?.+;'  
export GPG_TTY="$(tty)"

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# neofetch-btw
neofetch

# bat
export BAT_THEME="Dracula"

# LS_COLORS
export LS_COLORS="$(vivid generate dracula)"
