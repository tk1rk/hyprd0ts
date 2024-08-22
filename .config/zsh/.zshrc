# sources
#source $ZDOTDIR/conf.d/aliases.zsh
#source $ZDOTDIR/conf.d/autosuggestions.zsh
#source $ZDOTDIR/conf.d/dracula.zsh
#source $ZDOTDIR/conf.d/functions.zsh

# directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

### completion
setopt always_to_end
setopt complete_in_word
unsetopt list_beep

zmodload zsh/complist

### history
setopt hist_expire_dups_first
setopt inc_append_history

# settings
[ -z "${HISTFILE}" ] &&
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zsh_history"
HISTSIZE=120000
SAVEHIST=100000

# Make sure $ZSH_CACHE_DIR is +x, else use dir in $HOME
if [[ ! -w "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh
# Create cache & comp dirs & + to $fpath 
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# try completion matching in order: smart-case, case-insensitive, partial-word, substring
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Z}{a-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use LS_COLORS for completion coloring
[ -n "${LS_COLORS}" ] && zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


kbind() {
    local ti_name="$1"
    local action="$2"
    local tinfo="${terminfo[${ti_name}]}"
    [ -n "${tinfo}" ] && bindkey "${tinfo}" "${action}"
}

# home
kbind khome beginning-of-line

# end
kbind kend end-of-line

# delete
kbind kdch1 delete-char

# shift-tab
kbind kcbt reverse-menu-complete

# up arrow
kbind kcuu1 up-line-or-history

# down arrow
kbind kcud1 down-line-or-history

# left arrow
kbind kcub1 backward-char

# right arrow
kbind kcuf1 forward-char

# ctrl-u
bindkey "^U" backward-kill-line

unfunction kbind



# Load all stock functions (from $fpath files)
autoload -U compaudit compinit




# sheldon
eval "$(sheldon source)"

# cargo
source $HOME/.cargo/env

# p10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
