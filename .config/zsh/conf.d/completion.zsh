autoload -Uz compinit && compinit
autoload -U colors && colors

setopt COMPLETE_IN_WORD       # Complete from both ends of a word.
setopt ALWAYS_TO_END          # Move the cursor to the end of a completed word.
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
unsetopt auto_menu

zmodload -i zsh/complist

#zstyle ':completion:*' completer _expand _complete _match _approximate
zstyle ':completion:*' completer \
    _expand _complete _complete:-loose _complete:-fuzzy _ignored
#zstyle ':completion:*' completer _complete _prefix:-complete _approximate _prefix:-approximate
#zstyle ':completion:*:prefix-complete:*' completer _complete
#zstyle ':completion:*:prefix-approximate:*' completer _approximate
    
#zstyle ':completion:*' completer _complete _match _approximate
zstyle ':autocomplete:*' min-input 1
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*'    max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
  
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' special-dirs true
#zstyle ':completion:*' matcher-list \
#  'm:{a-zA-Z}={A-Za-z}' \
#  'r:|[._-]=* r:|=*' \
#  'l:|=* r:|=*'
# Case-insensitive (all), partial-word, and then substring completion.
if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path $ZCACHE
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle -e ':completion:*:-command-:*:commands'	list-colors 'reply=( '\''=(#b)('\''$words[CURRENT]'\''|)*-- #(*)=0=38;5;45=38;5;136'\'' '\''=(#b)('\''$words[CURRENT]'\''|)*=0=38;5;45'\'' )'


autoload -U +X bashcompinit && bashcompinit