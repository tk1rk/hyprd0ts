#!/bin/zsh

# sources
source ${ZDOTDIR}/conf.d/aliases.zsh
source ${ZDOTDIR}/conf.d/functions.zsh
source ${ZDOTDIR}/conf.d/completion.zsh

# zimfw
if [[ ! $ZDOTDIR/.zimrc ]]; then
        command curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi
#-------------------------------------------------------
# degit
zstyle ':zim:zmodule' use 'degit'
#-------------------------------------------------------
# zim home
ZIM_HOME=$ZDOTDIR/.zim
ZIM_CONFIG_FILE=$_ZDOTDIR/.zimrc
#-------------------------------------------------------
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
#-------------------------------------------------------
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
#------------------------------------------------------
# Initialize modules.
source ${ZIM_HOME}/init.zsh


# zd (zi docker)
#docker run --rm -it ghcr.io/z-shell/zd:latest

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bd93f9,bold"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1



