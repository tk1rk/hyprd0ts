# enable powerlevel10k instant prompt, keep at the top of the file
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# to set truecolor
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# promptinit
/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

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


# to customize prompt, run `p10k configure`
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~//.config/zsh/.p10k.zsh
