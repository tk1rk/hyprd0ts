#!/usr/bin/zsh

# sources
source $ZDOTDIR/conf.d/aliases.zsh
source $ZDOTDIR/conf.d/bindkeys.zsh
source $ZDOTDIR/conf.d/completion.zsh
source $ZDOTDIR/conf.d/functions.zsh
source $ZDOTDIR/conf.d/autosuggestions.zsh

function cd() {
         builtin cd "$@" && command eza -lhA --no-time --group-directories-first --icons=always --color=always
}
alias ls='eza -lhA --no-time --group-directories-first --icons=always --color=always'

### Make sure $ZSH_CACHE_DIR is writable, otherwise use a directory in $HOME ###
if [[ ! -w "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
fi

### Create cache and completions dir and add to $fpath ###
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

### function path ###
fpath=($ZSH/functions $ZSH/completions $fpath)

### Load all stock functions (from $fpath files) ###
autoload -U compaudit compinit

