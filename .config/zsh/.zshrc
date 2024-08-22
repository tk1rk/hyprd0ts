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
