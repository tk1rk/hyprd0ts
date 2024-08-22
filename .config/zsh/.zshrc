# sources
#source $ZDOTDIR/config
#source $ZDOTDIR/
#source $ZDOTDIR/

setopt auto_cd


# Make sure $ZSH_CACHE_DIR is +x, else use dir in $HOME
if [[ ! -w "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
fi
#----------------------------------------------------
# Create cache & comp dirs & + to $fpath 
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# Load all stock functions (from $fpath files)
autoload -U compaudit compinit




# sheldon
eval "$(sheldon source)"

# cargo
source $HOME/.cargo/env

# p10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
