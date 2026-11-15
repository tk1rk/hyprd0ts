# enable powerlevel10k instant prompt, keep at the top of the file
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# to set truecolor
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# Define the directory containing your configuration splits
export ZDOTDIR=$HOME/.config/zsh
export ZCACHE=$HOME/.cache/zsh
export ZCONFIG=$ZDOTDIR/conf.d
export ZPLUGIN=$ZDOTDIR/plugins

# zsh config sources
for file in ~/.config/zsh/conf.d/*.zsh(N); do
    source "$file"
done

# promptinit
source ~/powerlevel10k/powerlevel10k.zsh-theme

# defer
source $ZPLUGIN/zsh-defer/zsh-defer.plugin.zsh

# zsh plugins
zsh-defer source $ZPLUGIN/zsh-autopair/zsh-autopair.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-completions/zsh-completions.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
zsh-defer source $ZPLUGIN/H-S-MW/H-S-MW.plugin.zsh
zsh-defer source $ZPLUGIN/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

# autols
function cd () {
	      builtin cd "$@" && command eza -lhA --no-time --group-directories-first --icons=always --color=always
}
alias ls="eza -lhA --no-time --group-directories-first --icons=always --color=always"

# fzf in terminal, fzf must be installed to use this
eval "$(fzf --zsh)"

# fzf dracula theme
export FZF_DEFAULT_OPTS=" \
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 \
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

# ls-colors
export LS_COLORS="$(vivid generate dracula)"

# to customize prompt, run `p10k configure`
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
