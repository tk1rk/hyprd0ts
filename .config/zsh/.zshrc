#!/bin/zsh

# sources
source $ZDOTDIR/conf.d/aliases.zsh
source $ZDOTDIR/conf.d/bindkeys.zsh
source $ZDOTDIR/conf.d/completion.zsh
source $ZDOTDIR/conf.d/functions.zsh
source $ZDOTDIR/plugins/auto-sized-fzf.sh


ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bd93f9,bold"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1



