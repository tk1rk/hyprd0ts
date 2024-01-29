#!/bin/zsh

# ZAP
ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
if [[ ! ${ZAP_DIR} ]]; then
    command zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
fi

# theme
plug "romkatv/powerlevel10k"

# zap plugins
plug "zap-zsh/supercharge"
plug "zap-zsh/completions"
plug "zap-zsh/sudo"
plug "zap-zsh/nvm"

# zsh-users plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"

# z-shell plugins
plug "z-shell/F-Sy-H"
plug "z-shell/zsh-eza"
plug "z-shell/zsh-fancy-completions"
plug "z-shell/H-S-MW"

# local sources
plug "$ZDOTDIR/config/aliases.zsh"
plug "$ZDOTDIR/config/functions.zsh"
plug "$ZDOTDIR/config/autosuggestions.zsh"

# zd (zi docker)
#docker run --rm -it ghcr.io/z-shell/zd:latest



