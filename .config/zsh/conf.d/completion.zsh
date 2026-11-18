autoload -Uz compinit && compinit
autoload -U colors && colors

zmodload -i zsh/complist

#zstyle ':completion:*' completer _expand _complete _match _approximate
zstyle ':completion:*' completer \
    _expand _complete _complete:-loose _complete:-fuzzy _ignored
zstyle ':autocomplete:*' min-input 1
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors \
  'reply=($((($#PREFIX + $#SUFFIX) / 3 > 7 ? 7 : ($#PREFIX + $#SUFFIX) / 3))numeric)'
  
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
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}