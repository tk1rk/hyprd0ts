if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi


# $ZDOTDIR
export ZDOTDIR=$HOME/.config/zsh
source $ZDOTDIR/.zshrc

# xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DOWNLOADS_HOME=$HOME/Downloads
export XDG_PICTURES_HOME=$HOME/Pictures

# locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_MONETARY=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# bat
export BAT_THEME=Dracula

# LS_COLORS
export LS_COLORS="$(vivid generate dracula)"
export TERMINAL=alacritty
export COLORTERM=truecolor
export CLICOLOR=1

#### ZSH
export ZDOTDIR=$HOME/.config/zsh
export ZCACHE=$HOME/.cache/zsh

### Create cache and completions dir and add to $fpath & path
if [[ ! $ZCACHE/completions ]]; then
        command mkdir -p $ZCACHE/completions
fi
if [[ ! $ZDOTDIR/autoload ]]; then
        command mkdir -p $ZDOTDIR/autoload
fi

export FPATH="$ZDOTDIR/autoload:$ZCACHE/completions:$FPATH"
export PATH="$HOME.local/bin:$HOME/.config/hypr/scripts:$HOME/.config/waybar/scripts:$HOME/.local/share/cargo/bin:$HOME:$PATH"
_comp_options+=(globdots)

# Editor + Others
export EDITOR=nvim
export SUDO_EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export VISUAL=nvim
export PAGER="nvim +Man!"
export BROWSER=vivaldi

# # configure nvim as manpager (requires neovim-remote)
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ] || [ -n "${NVIM+x}" ]; then
    export MANPAGER="nvim -c 'Man!' -o -"
  else
    export MANPAGER="nvim -c 'Man!'"
fi

# misc
export WORDCHARS='~!#$%^&*(){}[]<>?.+;'  
export GPG_TTY="$(tty)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"


# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# neofetch-btw
neofetch

