# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

alias ls='eza -lA --header --icons=always --color=always --color-scale --color-scale-mode=gradient --group-directories-first --no-time --git --git-repos'

### CAT & LESS
command -v bat > /dev/null && \
        alias bat='bat --theme=Dracula' && \
        alias cat='bat --pager=never --theme=Dracula' && \
        alias less='bat --theme=Dracula'

# bathelp
alias bathelp='bat --plain --language=help'
function help() {
    "$@" --help 2>&1 | bathelp
}

