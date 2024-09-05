alias ls="eza -lhA --no-time --group-directories-first --icons=always
--color=always"


## Colorful output & useful aliases for 'ls' and 'grep'.
if [ -x "$HOME/.local/bin/dircolors" ] && [ -n "$LOCAL_PREFIX" ]; then
        if [ -f "$HOME/.local/bin/dircolors.conf" ]; then
                eval "$(dircolors -b "$LOCAL_PREFIX/etc/dircolors.conf")"
        fi
fi

## Colored output.
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto -h"

## Replace 'cat' with 'bat' (if available).
if [ -n "$(command -v bat)" ]; then
        alias cat="bat --color=never --decorations=never --paging=never"
fi

## Replace 'ls' with 'exa' (if available) + some aliases.
if [ -n "$(command -v exa)" ]; then
        alias l="exa"
        alias ls="exa"
        alias l.="exa -d .*"
        alias la="exa -a"
        alias ll="exa -Fhl"
        alias ll.="exa -Fhl -d .*"
else
        alias l="ls --color=auto"
        alias ls="ls --color=auto"
        alias l.="ls --color=auto -d .*"
        alias la="ls --color=auto -a"
        alias ll="ls --color=auto -Fhl"
        alias ll.="ls --color=auto -Fhl -d .*"
fi

## Safety.
alias cp="cp -i"
alias ln="ln -i"
alias mv="mv -i"
alias rm="rm -i"