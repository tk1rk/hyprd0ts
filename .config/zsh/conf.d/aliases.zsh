alias ls="eza -lhA --no-time --group-directories-first --icons=always --color=always"

## Colored output.
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto -h"

## Replace 'cat' with 'bat' (if available).
if [ -n "$(command -v bat)" ]; then
        alias cat="bat --color=always --theme=Dracula --decorations=never --paging=never"
fi

## Safety.
alias cp="cp -i"
alias ln="ln -i"
alias mv="mv -i"
alias rm="rm -i"
