# enable powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# to set truecolor
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# xdg
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# Define the directory containing your configuration splits
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
export ZCACHE=${XDG_CACHE_HOME;-$HOME/.cache}/zsh
export ZCONFIG=${ZDOTDIR:-$HOME/.config/zsh}/conf.d
export ZPLUGIN=${ZDOTDIR:-$HOME/.config/zsh}/plugins

# promptinit
source ~/powerlevel10k/powerlevel10k.zsh-theme

# defer
autoload -Uz $ZPLUGIN/zsh-defer/zsh-defer.plugin.zsh

# zsh plugins
zsh-defer source $ZPLUGIN/zsh-autopair/zsh-autopair.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-completions/zsh-completions.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
zsh-defer source $ZPLUGIN/H-S-MW/H-S-MW.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# zsh config sources
for file in $HOME/config/zsh/conf.d/*.zsh(N); do
    source "$file"
done

# autols
function cd () {
	      builtin cd "$@" && command eza -lhA --no-time --group-directories-first --icons=always --color=always
}
alias ls="eza -lhA --no-time --group-directories-first --icons=always --color=always"

# fzf in terminal, fzf must be installed to use this
source <(fzf --zsh)
# fzf misc
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# fzf dracula theme
export FZF_DEFAULT_OPTS=" \
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 \
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

# ls-colors
export LS_COLORS="$(vivid generate dracula)"

# to customize prompt, run `p10k configure`
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
