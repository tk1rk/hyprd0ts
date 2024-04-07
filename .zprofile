# zdotdir
export ZDOTDIR=$HOME/.config/zsh
[[ -f $ZDOTDIR/.zshrc ]] && source $ZDOTDIR/.zshrc

# fzf - dracula theme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# env vars
export KITTY_USE_WAYLAND=1
export TERM=kitty
export COLORTERM=truecolor
export CLICOLOR=1
export VISUAL='alacritty -e nvim'
export EDITOR='alacritty -e nvim'
export SUDO_EDITOR='alacritty -e nvim'
export SYSTEM_EDITOR='alacritty -e nvim'
export BROWSER='vivaldi'
export PAGER='nvim +Man!'
export MANPAGER='nvim +Man!'
export HYPRLAND_LOG_WLR=1
export XCURSOR_THEME=ArchCursorCompletw
export XCURSOR_SIZE=24
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

dbus-run-session Hyprland
