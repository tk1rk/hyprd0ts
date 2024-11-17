# enable powerlevel10k instant prompt, keep at the top of the file
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# sources
[[ -r ${ZDOTDIR}/aliases.zsh ]] && source ${ZDOTDIR}/aliases.zsh
[[ -r ${ZDOTDIR}/autosuggestions.zsh ]] && source ${ZDOTDIR}/autosuggestions.zsh
[[ -r ${ZDOTDIR}/dracula.zsh ]] && source ${ZDOTDIR}/dracula.zsh
[[ -r ${ZDOTDIR}/functions.zsh ]] && source ${ZDOTDIR}/functions.zsh

# Make sure $ZSH_CACHE_DIR is +x, else use dir in $HOME
if [[ ! -w "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh
# Create cache & comp dirs & + to $fpath 
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# tab autocompletions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# try completion matching in order: smart-case, case-insensitive, partial-word, substring
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Z}{a-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use LS_COLORS for completion coloring
[ -n "${LS_COLORS}" ] && zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# history
export HISTSIZE=100000
export SAVEHIST=20000
export HISTFILE="$HOME/.cache/zsh/history"
setopt hist_ignore_dups     # do not record an event that was just recorded again
setopt hist_ignore_all_dups # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_space    # do not record an event starting with a space
setopt hist_save_no_dups    # do not write a duplicate event to the history file
setopt inc_append_history   # write to the history file immediately, not when the shell exits
setopt share_history        # share history between terminals

# directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

### completion
setopt always_to_end
setopt complete_in_word
unsetopt list_beep

zmodload zsh/complist

# change word selection to exclude slashes
autoload -U select-word-style
select-word-style bash

# cd to folder when quitting lf (terminal file manager)
cd () {
	      builtin cd "$@" && command eza -lhA --no-time --group-directories-first --icons=always --color=always
}

# this function is necessary for the foot terminal to be able to open new terminal to cwd
autoload -U add-zsh-hook
function osc7-pwd() {
	emulate -L zsh
	setopt extendedglob
	local LC_ALL=C
	printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}
function chpwd-osc7-pwd() {
	(( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

# fix vi plugin conflicting with fzf
export ZVM_INIT_MODE=sourcing

# basic plugin manager to automatically import zsh plugins
# script by mattmc3 from https://github.com/mattmc3/zsh_unplugged
# clone a plugin, identify its init file, source it, and add it to your fpath
function plugin-load {
	local repo plugdir initfile initfiles=()
	: ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
	for repo in $@; do
		plugdir=$ZPLUGINDIR/${repo:t}
		initfile=$plugdir/${repo:t}.plugin.zsh
		if [[ ! -d $plugdir ]]; then
			echo "Cloning $repo..."
			git clone -q --depth 1 --recursive --shallow-submodules \
				https://github.com/$repo $plugdir
		fi
		if [[ ! -e $initfile ]]; then
			initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
			(( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
			ln -sf $initfiles[1] $initfile
		fi
		fpath+=$plugdir
		(( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
	done
}

# list of github repos of plugins
repos=(
	romkatv/powerlevel10k
  marlonrichert/zsh-autocomplete
  zsh-users/zsh-history-substring-search
  hlissner/zsh-autopair
	romkatv/zsh-defer
	zsh-users/zsh-autosuggestions
	zdharma-continuum/fast-syntax-highlighting
	kazhala/dotbare
)
plugin-load $repos

# fzf in terminal, fzf must be installed to use this
eval "$(fzf --zsh)"
# fzf catppuccin theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# to customize prompt, run `p10k configure`
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
