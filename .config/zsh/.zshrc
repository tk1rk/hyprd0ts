#!/bin/zsh

# sources
source ${ZDOTDIR}/conf.d/aliases.zsh
source ${ZDOTDIR}/conf.d/functions.zsh
source ${ZDOTDIR}/conf.d/predict.zsh

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
plug "$ZDOTDIR/config/autosuggestions.zsh"
plug "$ZDOTDIR/config/bindkeys.zsh"
plug "$ZDOTDIR/config/functions.zsh"
plug "$ZDOTDIR/config/history.zsh"

# zd (zi docker)
#docker run --rm -it ghcr.io/z-shell/zd:latest

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bd93f9,bold"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1



