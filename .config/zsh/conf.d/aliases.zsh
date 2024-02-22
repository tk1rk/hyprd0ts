# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

alias ls='eza -lA --header --icons=always --color=always --color-scale --color-scale-mode=gradient --group-directories-first --no-time --git --git-repos'

### CAT & LESS
command -v bat > /dev/null && \
        alias bat='bat --theme=ansi' && \
        alias cat='bat --pager=never' && \
        alias less='bat'
# in debian the command is batcat
command -v batcat > /dev/null && \
        alias batcat='batcat --theme=ansi' && \
        alias cat='batcat --pager=never' && \
        alias less='batcat'
