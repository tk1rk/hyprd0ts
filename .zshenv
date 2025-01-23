# $ZDOTDIR
export ZDOTDIR="$HOME/.config/zsh"
[[ -f "$ZDOTDIR/.zshrc" ]] && source "$ZDOTDIR/.zshrc"
export ZCACHE="$HOME/.cache/zsh"
export ZCOMPLETION="$ZCACHE/completions"
export ZCONF="$ZDOTDIR/conf.d"
export ZPLUGINS="$ZDOTDIR/plugins"

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DOWNLOADS_HOME="$HOME/Downloads"
export XDG_PICTURES_HOME="$HOME/Pictures"

# locale
export LANG="en_US.UTF-8"
export LANGUAGE="en_US"
export LC_MONETARY="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# themes
export BAT_THEME="Dracula"
export PAGER="nvim +Man!"
export MANPAGER="nvim +Man!"
export LS_COLORS="$(vivid generate dracula)"
export COLORTERM="truecolor"
export CLICOLOR=1

# Apps
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="vivaldi-stable"

export fpath=($ZCACHE/completions $fpath)
export PATH="$HOME.local/bin:$HOME/.config/hypr/scripts:$HOME/.config/waybar/scripts:$HOME/.local/share/cargo/bin:$HOME:$PATH"
_comp_options+=(globdots)

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# neofetch-btw
neofetch

