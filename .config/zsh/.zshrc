# sources
#source $ZDOTDIR/plugins
#source $ZDOTDIR/plugins
#source $ZDOTDIR/plugins

setopt auto_cd

# auto-ls
function cd() {
         builtin cd "$@" && command eza -lhA --no-time --group-directories-first --icons=always --color=always
}
alias ls='eza -lhA --no-time --group-directories-first --icons=always --color=always'

# Make sure $ZSH_CACHE_DIR is writable, otherwise use a directory in $HOME ###
if [[ ! -w "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
fi
#----------------------------------------------------
### Create cache and completions dir and add to $fpath ###
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)
#---------------------------------------------------
# function path ###
fpath=($ZSH/functions $ZSH/completions $fpath)
#---------------------------------------------------
# Load all stock functions (from $fpath files) ###
autoload -U compaudit compinit


# autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bd93f9,bold"

# sheldon
eval "$(sheldon source)"

# cargo
source $HOME/.cargo/env

# p10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
